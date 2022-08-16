package my.mypage.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CartDAO {
	private DataSource ds;

	public CartDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			System.out.println("DB 연결 성공");
		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}
	
	
	// 2. 장바구니
	// 카트에 담긴 제품 수
	public int getCartListCount(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listcount = 0; 
		try {
			con = ds.getConnection();
			String sql = "select count(*) from cart "
					   + "where member_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); // String은 작은따옴표 자동으로 생긴다
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listcount = rs.getInt(1) ; 
			}
		} catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("getCartListCount() 에러:" + ex);
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch(SQLException e) {
					System.out.println(e.getMessage());
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
		} // finally 끝
		return listcount; 
	} // getCartistCount(String id) end
	// 카트에 담긴 제품 리스트
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

	
	// 장바구니 특정 상품 수량 변경
	// 1. 수량 -1 감소
	public int cartItemMinus(String member_id, int item_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			con = ds.getConnection();
			String sql = "update cart "
					   + "set cart_amount = (select cart.cart_amount "
					   + "					from cart join item "
   					   + "					on cart.item_id	= item.item_id "
					   + "					where member_id = ? and cart.item_id = ?) - 1 "
					   + "where cart_id = (select cart_id "
					   + "					from cart join item "
					   + "					on cart.item_id	= item.item_id "
					   + "					where member_id = ? and cart.item_id = ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.setInt(2, item_id);
			pstmt.setString(3, member_id);
			pstmt.setInt(4, item_id);
			result = pstmt.executeUpdate(); // 수량 감소 성공하면 1, 실패하면 0
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
					con.close(); // DB 연결은 마지막에 끊는다
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
		} // try-catch-finally 끝
		return result; // // 수량 감소 성공하면 1, 실패하면 0
	} // cartItemMinus(member_id, item_id) end
	// 2. 수량 +1 증가
	public int cartItemPlus(String member_id, int item_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			con = ds.getConnection();
			
			String sql = "update cart "
					   + "set cart_amount = (select cart.cart_amount "
					   + "					from cart join item "
   					   + "					on cart.item_id	= item.item_id "
					   + "					where member_id = ? and cart.item_id = ?) + 1 "
					   + "where cart_id = (select cart_id "
					   + "					from cart join item "
					   + "					on cart.item_id	= item.item_id "
					   + "					where member_id = ? and cart.item_id = ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.setInt(2, item_id);
			pstmt.setString(3, member_id);
			pstmt.setInt(4, item_id);
			result = pstmt.executeUpdate(); // 수량 추가 성공하면 1, 실패하면 0
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
					con.close(); // DB 연결은 마지막에 끊는다
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
		} // try-catch-finally 끝
		return result; // 수량 추가 성공하면 1, 실패하면 0
	} // cartItemPlus(member_id, item_id) end

	
	// 장바구니에서 해당 상품 삭제
	public int cartItemDelete(String member_id, int item_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			con = ds.getConnection();
			String sql = "delete from cart "
					   + "where member_id = ? "
					   + "and item_id = ? ";	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.setInt(2, item_id);
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

	
	
	
	// 회원 우편번호, 주소 조회
	public String getMemberPostAddress(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String post_address = null;
		try {
			con = ds.getConnection();
			String sql = "select distinct member_post, member_address "
					   + "from cart join member "
					   + "on cart.member_id = member.member_id "
					   + "where cart.member_id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // distinct로 중복행 제거되어 행 1개만 조회됨
				post_address = rs.getString("member_post") + rs.getString("member_address");
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
		return post_address;
	} // getMemberPostAddress(String id) end

	
	// 장바구니에 담긴 모든 상품 총액
	public int getTotalAll(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalALL = 0;
		try {
			con = ds.getConnection();
			String sql = "select sum(item_price*cart_amount) as totalAll "
					+ "from cart join item "
					+ "on cart.item_id	= item.item_id "
					+ "where member_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalALL = rs.getInt("totalAll");
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
		return totalALL;
	} // getTotalAll(String id) end

	
	// 아이템페이지 - 장바구니 버튼 클릭 - 장바구니에 상품 추가
	public int cartItemAdd(String member_id, int item_id) {
		Connection con = null;
		PreparedStatement pstmt_s = null; // select에 사용할 PreparedStatement
		PreparedStatement pstmt_i = null; // insert에 사용할 PreparedStatement
		ResultSet rs = null;
		int result = -1;
		try {
			con = ds.getConnection();
			
			// 상품이 장바구니에 있는지 확인 - 장바구니에 이미 있는 상품이면 담을 수 없다
			String select_sql = "select item_id "
							  + "from cart "
							  + "where member_id = ? "
							  + "and item_id = ?";
			pstmt_s = con.prepareStatement(select_sql);
			pstmt_s.setString(1, member_id);
			pstmt_s.setInt(2, item_id);
			rs = pstmt_s.executeQuery();
			
			if (rs.next()) {
				if( item_id == rs.getInt("item_id") ) { // 장바구니에 이미 해당상품 있으면 더이상 추가할 수 없다
					result = 0;
					return result;
				} 
			} else { // 장바구니에 해당상품 없으면 담는다
				String insert_sql = "insert into cart "
						  + "values ((select nvl(max(cart_id),0)+1 from cart), ?, ?, 1)";
				pstmt_i = con.prepareStatement(insert_sql);
				pstmt_i.setInt(1, item_id);
				pstmt_i.setString(2, member_id);
				result = pstmt_i.executeUpdate(); // 장바구니 담기 성공하면 1
				return result;
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
			if (pstmt_s != null) {
				try {
					pstmt_s.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
			if (pstmt_i != null) {
				try {
					pstmt_i.close();
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
		return result; // 장바구니에 잘 담기면 1, 기존에 있어서 못담으면 0, 에러나면 -1
	} // cartItemAdd(String member_id, int item_id) end
		
		
}
