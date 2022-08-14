package item.iteminfo.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import my.mypage.db.Cart;




public class ItemDAO {
	private DataSource ds;
	
	// 생성자에서 JNDI 리소스를 참조하여 Connection 객체를 얻어옵니다.
	public ItemDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}

	public int getListCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(" select count(*) from item ");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
		}  // finally
		return x;
	}
	
	public List<Item> getList(int page, int limit) {
		List<Item> list = new ArrayList<Item>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			
			String sql = " select * "
					+ 	 " from (select b.*, rownum rnum "
					+ 	 " 		 from(select * from item "
					+ 	 " 			  order by item_id) b "
					+	 "         	 ) "
					+ 	 " where rnum>=? and rnum<=? ";
			
			pstmt = con.prepareStatement(sql);
			// 한 페이지당 10개씩 목록인 경우 1페이지, 2페이지, 3페이지, 4페이지 ...
			
			int startrow = (page - 1) * limit + 1;
					// 읽기 시작할 row 번호(1 11 21 31 ...)
			int endrow = startrow + limit - 1;
					// 읽을 마지막 row 번호 (10 20 30 40..)
			
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Item m = new Item();
				m.setItem_id(rs.getInt("item_id"));
				m.setItem_name(rs.getString("item_name"));
				m.setItem_category(rs.getString("item_category"));
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
		}  // finally
		return list;
	}
	
	
	public int getListCount(String field, String value) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		try {
			con = ds.getConnection();
			String sql = " select count(*) from item "
					+ 	 " where " + field + " like ? ";
			
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+ value +"%");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x = rs.getInt(1);
			} 
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException ex) {
						ex.printStackTrace();
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException ex) {
						ex.printStackTrace();
					}
				if (con != null)
					try {
						con.close();
					} catch (SQLException ex) {
						ex.printStackTrace();
					}
			}  // finally
			return x;
	}
	
	public List<Item> getList(String field, String value, int page, int limit) {
		List<Item> list = new ArrayList<Item>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			
			String sql = " select * "
					+ 	 " from (select b.*, rownum rnum "
					+ 	 " 		 from(select * from item "
					+ 	 "			  where " + field + " like ? "
					+ 	 " 			  order by item_id) b "
					+	 "		) "
					+ 	 " where rnum between ? and ? ";
			
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+value+"%");
			
			int startrow = (page - 1) * limit + 1;
					// 읽기 시작할 row 번호(1 11 21 31 ...)
			int endrow = startrow + limit - 1;
					// 읽을 마지막 row 번호 (10 20 30 40..)
			
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Item m = new Item();
				m.setItem_id(rs.getInt("item_id"));
				m.setItem_name(rs.getString("item_name"));
				m.setItem_category(rs.getString("item_category"));
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
		}  // finally
		return list;
	}
	
	public int delete(int item_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			con = ds.getConnection();
			
			String sql = " delete from item "
					+ 	 " where item_id = ? ";
			
			
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, item_id);
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
		}  // finally
		return result;
	}
	
	public int update(Item m) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = " update item "
				+ 	 " set "
				+ 	 " item_name = ?, "
				+ 	 " item_price = ?, "
				+ 	 " item_image = ?, "
				+ 	 " item_deliver = ?, "
				+ 	 " item_seller = ?, "
				+ 	 " item_package = ?, "
				+ 	 " item_expiredate = ?, "
				+ 	 " item_unit = ?, "
				+ 	 " item_weight = ?, "
				+ 	 " item_category = ?, "
				+ 	 " item_intro = ?, "
				+ 	 " item_stock = ? "
				+ 	 " where item_id = ? ";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getItem_name());
			pstmt.setInt(2, m.getItem_price());
			pstmt.setString(3, m.getItem_image());
			pstmt.setString(4, m.getItem_deliver());
			pstmt.setString(5, m.getItem_seller());
			pstmt.setString(6, m.getItem_package());
			pstmt.setString(7, m.getItem_expiredate());
			pstmt.setString(8, m.getItem_unit());
			pstmt.setString(9, m.getItem_weight());
			pstmt.setString(10, m.getItem_category());
			pstmt.setString(11, m.getItem_intro());
			pstmt.setInt(12, m.getItem_stock());
			pstmt.setInt(13, m.getItem_id());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
		}  // finally
		return result;
	}

	public int item_id_num() { // insert item_id 구하기
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			con = ds.getConnection();
			
			String max_sql = "(select nvl(max(item_id),0)+1 from item)";
			
			pstmt = con.prepareStatement(max_sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) 
				result = rs.getInt(1);
			
		} catch (Exception ex) {
			System.out.println("getListCount() 에러: " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
		}  // finally
		return result;
	}

	public int insert(Item i) {
		  Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      int result = 0; 
	      
	      try {
	         con = ds.getConnection();
	         
	         String sql = " insert into item "
	                  + " (item_id, item_name, item_price, item_reg_date, item_image, "
	                  + " item_deliver, item_seller, item_package, item_expiredate,"
	                  + " item_unit, item_weight, item_category, item_intro, item_stock) "
	                  + " values(?, ?, ?, sysdate, ?, "
	                  + " 		 ?, ?, ?, ?, 	"
	                  + "		?, ?, ?, ?, ?)	";
	         
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, i.getItem_id());
	         pstmt.setString(2, i.getItem_name());
	         pstmt.setInt(3, i.getItem_price());
	         pstmt.setString(4, i.getItem_image());
	         pstmt.setString(5, i.getItem_deliver());
	         pstmt.setString(6, i.getItem_seller());
	         pstmt.setString(7, i.getItem_package());
	         pstmt.setString(8, i.getItem_expiredate());
	         pstmt.setString(9, i.getItem_unit());
	         pstmt.setString(10, i.getItem_weight());
	         pstmt.setString(11, i.getItem_category());
	         pstmt.setString(12, i.getItem_intro());
	         pstmt.setInt(13, i.getItem_stock());
	         
	         result = pstmt.executeUpdate(); // 회원가입(삽입) 성공하면 1, 실패하면 0
	         
	         // Primary key 제약조건 위반했을 경우 발생하는 에러      
	      } catch(Exception e) {
	         e.printStackTrace();
	      } finally {
	         if (rs != null) {
	            try {
	               rs.close();
	            } catch(SQLException ex) {
	               ex.printStackTrace();
	            }
	         }
	         if(pstmt != null) {
	            try {
	               pstmt.close();
	            } catch(SQLException e) {
	               System.out.println(e.getMessage());
	            }
	         }
	         if(con != null) {
	            try {
	               con.close();
	            } catch(Exception e) {
	               System.out.println(e.getMessage());
	            }
	         }
	      } // finally end
	      return result; // 삽입 성공하면 1, 실패하면 0
	}

	public Item Item_info(String item_id) {
		Item m = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from item where item_id = ? ";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, item_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				m = new Item();
				m.setItem_id(rs.getInt(1));
				m.setItem_name(rs.getString(2));
				m.setItem_price(rs.getInt(3));
				m.setItem_reg_date(rs.getString(4));
				m.setItem_image(rs.getString(5));
				m.setItem_deliver(rs.getString(6));
				m.setItem_seller(rs.getString(7));
				m.setItem_package(rs.getString(8));
				m.setItem_expiredate(rs.getString(9));
				m.setItem_unit(rs.getString(10));
				m.setItem_weight(rs.getString(11));
				m.setItem_category(rs.getString(12));
				m.setItem_intro(rs.getString(13));
				m.setItem_stock(rs.getInt(14));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
		}  // finally
		return m;
	}

	public List<Item> getListByCategory(String category) {
		List<Item> list = new ArrayList<Item>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			
			String sql =  "select * from item where item_category = '" +  category + "'";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Item m = new Item();
				m.setItem_name(rs.getString("item_name"));
				m.setItem_price(rs.getInt("item_price"));
				m.setItem_image(rs.getString("item_image"));
				m.setItem_id(rs.getInt("item_id"));
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
		}  // finally
		return list;
	}
	

	public List<Cart> getCartList(String id) {
	      List<Cart> list = new ArrayList<Cart>();
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	         try {
	         con = ds.getConnection();
	         
	         String sql = "select * "
	                  + "from cart join item "
	                  + "on cart.item_id = item.item_id "
	                  + "where member_id = ?";
	         
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            int cart_id = rs.getInt("cart_id");
	            int item_id = rs.getInt("item_id");
	            String member_id = rs.getString("member_id");
	            int cart_amount = rs.getInt("cart_amount");
	            String item_image = rs.getString("item_image");
	            String item_name = rs.getString("item_name");
	            int item_price = rs.getInt("item_price");
	               
	            Cart cart = new Cart();
	            cart.setCart_id(cart_id);
	            cart.setItem_id(item_id);
	            cart.setMember_id(member_id);
	            cart.setCart_amount(cart_amount);
	            cart.setItem_image(item_image);
	            cart.setItem_name(item_name);
	            cart.setItem_price(item_price);
	            list.add(cart);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         if (rs != null) {
	            try {
	               rs.close();
	            } catch (SQLException ex) {
	               ex.printStackTrace();
	            }
	         }
	         if (pstmt != null) {
	            try {
	               pstmt.close();
	            } catch (SQLException e) {
	               System.out.println(e.getMessage());
	            }
	         }
	         if (con != null) {
	            try {
	               con.close();
	            } catch (Exception e) {
	               System.out.println(e.getMessage());
	            }
	         }
	      } // finally 끝
	      return list;
	   } // getCartList() end

	public int cartItemDelete(String member_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			con = ds.getConnection();
			String sql = "delete from cart "
					   + "where member_id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			result = pstmt.executeUpdate(); // 상품 삭제 성공하면 1, 실패하면 0
		} catch(Exception se) {
			se.printStackTrace();
		} finally {
			try {
				if(pstmt != null) 
				pstmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
			try {
				if(con != null) 
					con.close();
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
		} // try-catch-finally 끝
		return result; // 상품 삭제 성공하면 1, 실패하면 0
	} // cartItemDelete(member_id, item_id) end

	public List<Item> getListByItemName(String item_name) {
		List<Item> list = new ArrayList<Item>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			
			String sql =  "select * from item where item_name like '%" +  item_name + "%'";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Item m = new Item();
				m.setItem_name(rs.getString("item_name"));
				m.setItem_price(rs.getInt("item_price"));
				m.setItem_image(rs.getString("item_image"));
				m.setItem_id(rs.getInt("item_id"));
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
		}  // finally
		return list;
	}

	
	
}
