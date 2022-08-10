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

public class OrderInfoDAO {
	private DataSource ds;

	public OrderInfoDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			System.out.println("DB 연결 성공");
		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}
	
	
	
	// 1. Order
	// 주문내역 수
	public int getOrderListCount(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listcount = 0; 
		try {
			con = ds.getConnection();
			String sql = "select count(*) from orderInfo "
						+ "where member_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); // String은 작은따옴표 자동으로 생긴다
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listcount = rs.getInt(1) ; 
			}
		} catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("getOrderListCount() 에러:" + ex);
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
	} // getOrderListCount(String id) end
	//특정 회원의 주문내역 테이블 조회
	public List<OrderInfo> getOrderList(String id) {
		List<OrderInfo> list = new ArrayList<OrderInfo>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();

			String sql = "select * "
					   + "from orderInfo join item "
					   + "on orderInfo.item_id = item.item_id "
					   + "where member_id = ? "
					   + "order by order_date ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int order_number = rs.getInt("order_number");
				int item_id = rs.getInt("item_id");
				String member_id = rs.getString("member_id");
				String order_deliver = rs.getString("order_deliver");
				String order_date = rs.getString("order_date");
				int order_amount = rs.getInt("order_amount");
				String item_image = rs.getString("item_image");
				String item_name = rs.getString("item_name");
				int item_price = rs.getInt("item_price");
				
				OrderInfo oi = new OrderInfo();
				oi.setOrder_number(order_number);
				oi.setItem_id(item_id);		
				oi.setMember_id(member_id);
				oi.setOrder_deliver(order_deliver);
				oi.setOrder_date(order_date);
				oi.setOrder_amount(order_amount);
				oi.setItem_image(item_image);
				oi.setItem_name(item_name);
				oi.setItem_price(item_price);
				list.add(oi);
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
	} // getOrderList() end
}
