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
	public List<QnaBean> getQnaList(String id, int page, int limit) {
		List<QnaBean> list = new ArrayList<QnaBean>();
		Connection con = null;
		PreparedStatement pstmt_s1 = null;
		ResultSet rs = null;

		String sql = "select * "
				   + "from ( select rownum rnum, j.*  "
				   + "		from ( select qna.qna_number, qna.qna_name, qna.qna_pass, qna.qna_subject, qna.qna_content, qna.qna_reg_date, NVL(qnacomm.num, 0) as commOK "
				   + "				from qna left outer join qnacomm "
				   + "				on qna.qna_number = qnacomm.comment_qna_number "
				   + "				where qna.qna_name = ?  "
				   + "				order by qna.qna_number desc) j  "
				   + "		where rownum <= ?)  "
				   + "where rnum >= ? and rnum <= ?";
		
				   
		// 한 페이지 당 10개씩 목록인 경우 1페이지, 2페이지, 4페이지 ...
		int startrow = (page - 1) * limit + 1; // 읽기 시작할 row 번호(1 11 21 31 ...
		int endrow = startrow + limit - 1;     // 읽을 마지막 row 번호(10 20 30 40 ...
		
		try {
			con = ds.getConnection();
			
			pstmt_s1 = con.prepareStatement(sql);
			pstmt_s1.setString(1, id);
			pstmt_s1.setInt(2, endrow);
			pstmt_s1.setInt(3, startrow);
			pstmt_s1.setInt(4, endrow);
			rs = pstmt_s1.executeQuery();
			
			while(rs.next()) {
				int qna_number = rs.getInt("qna_number");
				String qna_name = rs.getString("qna_name");
				String qna_pass = rs.getString("qna_pass");
				String qna_subject = rs.getString("qna_subject");
				String qna_content = rs.getString("qna_content");
				String qna_reg_date = rs.getString("qna_reg_date");
				int cnt = rs.getInt("commOK");
					
				QnaBean qna = new QnaBean();
				qna.setQna_number(qna_number);
				qna.setQna_name(qna_name);
				qna.setQna_pass(qna_pass);
				qna.setQna_subject(qna_subject);
				qna.setQna_content(qna_content);
				qna.setQna_reg_date(qna_reg_date);
				qna.setCnt(cnt);
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
			if (pstmt_s1 != null) {
				try {
					pstmt_s1.close();
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
	
	
	// 문의내역 삭제 - 글 삭제 명령을 요청한 사용자가 글을 작성한 사용자인지 판단
	public boolean isQnaWriter(int qna_number, String qna_pass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
		String select_sql = "select qna_pass from qna where qna_number = ?";
		
		try {	
			con = ds.getConnection();
			pstmt = con.prepareStatement(select_sql);
			pstmt.setInt(1, qna_number);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if(qna_pass.equals(rs.getString("qna_pass"))) {
					result = true; // 비밀번호 맞으면 true, 틀리면 false
				}
			}	
		} catch(Exception ex) {
			System.out.println("isQnaWriter() 에러: " + ex);
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
		} // finally 끝
		return result; // 비밀번호 맞으면 true, 틀리면 false
	} // isQnaWriter(qna_numer, pass) end
	// 문의내역 삭제
	public boolean qnaDelete(int qna_number) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean result_check = false;
		try {
			con = ds.getConnection();
			String sql = "delete from qna "
					   + "where qna_number = ? "; // 글번호 - qna_number
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qna_number);
			int count = pstmt.executeUpdate(); // 문의 삭제 성공하면 1, 실패하면 0
			
			if(count == 1) {
				result_check = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("qnaDelete() 에러: " + e);
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
		return result_check; // 문의 삭제 성공하면 1, 실패하면 0
	} // qnaDelete(qna_number) end
	
	
	// 문의내역 삭제 (modal)
	public int qnaDelete(String member_id, int qna_number) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			con = ds.getConnection();
			String sql = "delete from qna "
					   + "where qna_name = ? " // 회원id - member_id
					   + "and qna_number = ?"; // 글번호 - qna_number
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.setInt(2, qna_number);
			result = pstmt.executeUpdate(); // 문의 삭제 성공하면 1, 실패하면 0
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("qnaDelete() 에러: " + e);
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
		return result; // 문의 삭제 성공하면 1, 실패하면 0
	} // qnaDelete(member_id, qna_number) end

	
	
}
