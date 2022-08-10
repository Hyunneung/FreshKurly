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

public class QnaDAO {
	private DataSource ds;

	public QnaDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			System.out.println("DB 연결 성공");
		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}
	
	// 4. qna
	// qna에 담긴 문의내역 수
	public int getQnaListCount(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listcount = 0; 
		try {
			con = ds.getConnection();
			String sql = "select count(*) from qna "
					   + "where qna_name = ?"; // qna_name는 회원아이디(member_id)
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); // String은 작은따옴표 자동으로 생긴다
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listcount = rs.getInt(1) ; 
			}
		} catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("getQnaListCount() 에러:" + ex);
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
	} // getQnaListCount(String id) end
	// qna에 담긴 문의내역 리스트
	public List<Qna> getQnaList(String id, int page, int limit) {
		List<Qna> list = new ArrayList<Qna>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * "
				   + "from ( select rownum rnum, j.* "
				   + "		from ( select * "
				   + "				from qna "
				   + "				where qna_name = ? "
				   + "				order by qna_reg_date desc) j "
				   + "		where rownum <= ? ) "
				   + "where rnum >= ? and rnum <= ?";
		// 한 페이지 당 10개씩 목록인 경우 1페이지, 2페이지, 4페이지 ...
		int startrow = (page - 1) * limit + 1; // 읽기 시작할 row 번호(1 11 21 31 ...
		int endrow = startrow + limit - 1;     // 읽을 마지막 row 번호(10 20 30 40 ...
				
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, endrow);
			pstmt.setInt(3, startrow);
			pstmt.setInt(4, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int qna_number = rs.getInt("qna_number");
				String qna_name = rs.getString("qna_name");
				String qna_pass = rs.getString("qna_pass");
				String qna_subject = rs.getString("qna_subject");
				String qna_content = rs.getString("qna_content");
				String qna_reg_date = rs.getString("qna_reg_date");

				Qna qna = new Qna();
				qna.setQna_number(qna_number);
				qna.setQna_name(qna_name);
				qna.setQna_pass(qna_pass);
				qna.setQna_subject(qna_subject);
				qna.setQna_content(qna_content);
				qna.setQna_reg_date(qna_reg_date);
				list.add(qna);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getQnaList() 에러: " + e);
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
	} // getQnaList() end
	
	
	
}
