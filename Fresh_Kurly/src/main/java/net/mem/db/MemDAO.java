package net.mem.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemDAO {
	private DataSource ds;

	// 생성자에서 JNDI 리소스를 참조하여 Connection 객체 얻는다
	public MemDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			System.out.println("DB 연결 성공");
		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}
	
	
	// 로그인 - id, pass 맞는지 확인
	public int isId(String id, String pass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1; // DB에 해당 id가 없습니다.

		try {
			con = ds.getConnection();

			String sql = "select member_id, member_pass from member where member_id = ?";
			pstmt = con.prepareStatement(sql); // PreparedStatement 객체 얻기
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 사용자가 입력한 비밀번호와 DB 비밀번호 비교
				if (rs.getString(2).equals(pass)) { // id, pass 일치하는 경우
					result = 1;
				} else { // // id, pass 일치하지 않는 경우
					result = 0;
				}
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
		return result; // id, pass 일치하는 경우 1, 아닌 경우 0 (DB에 해당 id가 없는 경우 -1)
	} // isId(id,pass) end
	
	
	
	// 회원가입 - ID 중복 검사DB에 id 있는지 없는지 확인
	public int overlapId(String id){
		// DB 작업에 필요한 인터페이스들의 레퍼런스 변수 선언
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0; // DB에 해당 id가 없습니다.
		
		try {
			con = ds.getConnection();
			
			String sql = "select member_id from member where member_id = ?";
			pstmt = con.prepareStatement(sql);  // PreparedStatement 객체 얻기
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); 
			
			if (rs.next()) {
				result = 1; // DB에 해당 id가 있습니다.
			}
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
		} // finally 끝
		return result; // DB에 ID 있으면 1, 없으면 0
	} // overlapId(id) end

	
	// 회원가입 - 휴대폰번호 중복 검사 - DB에 중복된 휴대폰번호 있는지 없는지 확인
	public int overlapPhone(String phone){
		// DB 작업에 필요한 인터페이스들의 레퍼런스 변수 선언
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0; // DB에 해당 휴대폰번호가 없습니다.
		
		try {
			con = ds.getConnection();
			
			String sql = "select member_phone from member where member_phone = ?";
			pstmt = con.prepareStatement(sql);  // PreparedStatement 객체 얻기
			pstmt.setString(1, phone);
			rs = pstmt.executeQuery(); 
			
			if (rs.next()) {
				result = 1; // DB에 해당 휴대폰번호가 있습니다.
			}
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
		} // finally 끝
		return result; // DB에  휴대폰번호 있으면 1, 없으면 0
	} // overlapPhone(phone) end
	
	
	// 회원가입 - DB에 멤버 추가
	public int insert(Mem m){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0; 
		
		try {
			con = ds.getConnection();
			
			String sql = "insert into member "
					   + "(member_id, member_pass, member_name, member_email, member_phone, "
					   + " member_post, member_address, member_gender, member_jumin) "
					   + "values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);  // PreparedStatement 객체 얻기
			pstmt.setString(1, m.getMember_id());
			pstmt.setString(2, m.getMember_pass());
			pstmt.setString(3, m.getMember_name());
			pstmt.setString(4, m.getMember_email());
			pstmt.setString(5, m.getMember_phone());
			pstmt.setString(6, m.getMember_post());
			pstmt.setString(7, m.getMember_address());
			pstmt.setString(8, m.getMember_gender());
			pstmt.setString(9, m.getMember_jumin());
			
			result = pstmt.executeUpdate(); // 회원가입(삽입) 성공하면 1, 실패하면 0
			
		  // Primary key 제약조건 위반했을 경우 발생하는 에러	
		} catch(java.sql.SQLIntegrityConstraintViolationException e) {
			result = -1;
			System.out.println("멤버 아이디 중복 에러입니다.");
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
		} // finally 끝
		return result; // 삽입 성공하면 1, 실패하면 0
	} // insert() end
	public int insert(String id, String name, String email){ // 소셜 회원가입
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0; 
		
		try {
			con = ds.getConnection();
			
			String sql = "insert into member "
					   + "(member_id, member_name, member_email) "
					   + "values(?, ?, ?) ";
			
			pstmt = con.prepareStatement(sql);  // PreparedStatement 객체 얻기
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			result = pstmt.executeUpdate(); // 삽입 성공하면 1, 실패하면 0
			
		  // Primary key 제약조건 위반했을 경우 발생하는 에러	
		} catch(java.sql.SQLIntegrityConstraintViolationException e) {
			result = -1;
			System.out.println("멤버 아이디 중복되어 메인페이지로 이동합니다. - 소셜로그인 사용자");
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
		} // finally 끝
		return result; // 삽입 성공하면 1, 실패하면 0
	} // insert(id, name, email) end
}
