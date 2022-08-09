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
	
	public int delete(String item_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			con = ds.getConnection();
			
			String sql = " delete from item "
					+ 	 " where item_id = ? ";
			
			
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, item_id);
			
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
	
}