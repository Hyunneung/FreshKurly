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

public class WishDAO {
	private DataSource ds;

	public WishDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			System.out.println("DB 연결 성공");
		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}
	
	
	// 3. Wish
	// 위시리스트 수 
	public int getWishListCount(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listcount = 0; 
		try {
			con = ds.getConnection();
			String sql = "select count(*) from wish "
						+ "where member_id = ?";
			
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listcount = rs.getInt(1) ; 
			}
		} catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("getWishListCount() 에러:" + ex);
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
	} // getWishListCount(String id) end
	// 특정 회원의 위시리스트 테이블 조회
	public List<Wish> getWishList(String id) {
		List<Wish> list = new ArrayList<Wish>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			String sql = "select * "
					   + "from wish join item "
					   + "on wish.item_id = item.item_id "
					   + "where member_id = ? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int wish_id = rs.getInt("wish_id");
				int item_id = rs.getInt("item_id");
				String member_id = rs.getString("member_id");
				String item_image = rs.getString("item_image");
				String item_name = rs.getString("item_name");
				int item_price = rs.getInt("item_price");
				
				Wish wish = new Wish();
				wish.setWish_id(wish_id);
				wish.setItem_id(item_id);
				wish.setMember_id(member_id);
				wish.setItem_image(item_image);
				wish.setItem_name(item_name);
				wish.setItem_price(item_price);
				list.add(wish);
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
	} // getWishList() end

	
	
	// 위시리스트 상품 장바구니에 담기
	public int wishItemToCart(String member_id, int item_id) {
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
	} // wishItemToCart(String member_id, int item_id) end
	public int wishItemToCart(String member_id, int item_id, int cart_amount) {
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
						  + "values ((select nvl(max(cart_id),0)+1 from cart), ?, ?, ?)";
				pstmt_i = con.prepareStatement(insert_sql);
				pstmt_i.setInt(1, item_id);
				pstmt_i.setString(2, member_id);
				pstmt_i.setInt(3, cart_amount);
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
	} // wishItemToCart(String member_id, int item_id, int cart_amount) end
	
	
	
	
	// 찜한상품 삭제
	public int wishItemDelete(String member_id, int item_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			con = ds.getConnection();
			String sql = "delete from wish "
					   + "where member_id = ? "
					   + "and item_id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.setInt(2, item_id);
			result = pstmt.executeUpdate(); // 찜한상품 삭제 성공하면 1, 실패하면 0
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
		return result; // 찜한상품 삭제 성공하면 1, 실패하면 0
	} // wishItemDelete(String member_id, int item_id) end

	
	// 아이템페이지 - 찜하기 버튼 클릭 - 찜한상품에 상품 추가
	public int wishItemAdd(String member_id, int item_id) {
		Connection con = null;
		PreparedStatement pstmt_s = null; // select에 사용할 PreparedStatement
		PreparedStatement pstmt_i = null; // insert에 사용할 PreparedStatement
		ResultSet rs = null;
		int result = -1;
		try {
			con = ds.getConnection();
			
			// 상품이 찜한상품에 있는지 확인 - 찜한상품에 이미 있는 상품이면 담을 수 없다
			String select_sql = "select item_id "
							  + "from wish "
							  + "where member_id = ? "
							  + "and item_id = ?";
			pstmt_s = con.prepareStatement(select_sql);
			pstmt_s.setString(1, member_id);
			pstmt_s.setInt(2, item_id);
			rs = pstmt_s.executeQuery();
			
			if (rs.next()) {
				if( item_id == rs.getInt("item_id") ) { // 찜한상품에 이미 해당상품 있으면 더이상 추가할 수 없다
					result = 0;
					return result;
				} 
			} else { // 찜한상품에 해당상품 없으면 담는다
				String insert_sql = "insert into wish "
						  + "values ((select nvl(max(wish_id),0)+1 from wish), ?, ?)";
				pstmt_i = con.prepareStatement(insert_sql);
				pstmt_i.setInt(1, item_id);
				pstmt_i.setString(2, member_id);
				result = pstmt_i.executeUpdate(); // 찜한상품 담기 성공하면 1
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
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
		} // finally 끝
		return result; // 찜한상품에 잘 담기면 1, 기존에 있어서 못담으면 0, 에러나면 -1
	}
	
}
