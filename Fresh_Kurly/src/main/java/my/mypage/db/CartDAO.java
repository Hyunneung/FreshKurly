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
			
			System.out.println(sql);
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
					   + "on cart.item_id	= item.item_id "
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
	
	
}
