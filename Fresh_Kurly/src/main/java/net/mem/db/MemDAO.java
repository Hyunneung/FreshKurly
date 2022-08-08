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
         pstmt = con.prepareStatement(sql); 
         pstmt.setString(1, id);
         rs = pstmt.executeQuery();

         if (rs.next()) {
            // 사용자가 입력한 비밀번호와 DB 비밀번호 비교
            if (rs.getString(2).equals(pass)) { // id, pass 일치하는 경우
               result = 1;
            } else { // id, pass 일치하지 않는 경우
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
      } // finally end
      return result; // // id, pass 일치하는 경우 1, 아닌 경우 0 (DB에 해당 id가 없는 경우 -1)
   } // isId(id,pass) end
   
   
   
   // 회원가입 - ID 중복 검사 - DB에 id 있는지 없는지 확인
   public int overlapId(String id){
      // DB 작업에 필요한 인터페이스들의 레퍼런스 변수 선언
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      int result = 0; // DB에 해당 id가 없습니다.
      
      try {
         con = ds.getConnection();
         
         String sql = "select member_id from member where member_id = ?";
         pstmt = con.prepareStatement(sql);  
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
      } // finally end
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
         pstmt = con.prepareStatement(sql);
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
      } // finally end
      return result; // DB에  휴대폰번호 있으면 1, 없으면 0
   } // overlapPhone(콜) end
   
   
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
         
         pstmt = con.prepareStatement(sql);
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
      } // finally end
      return result; // 삽입 성공하면 1, 실패하면 0
   } // insert() end
   public int insert(String id, String name, String email){ //  Ҽ  ȸ      
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      int result = 0; 
      
      try {
         con = ds.getConnection();
         
         String sql = "insert into member "
                  + "(member_id, member_name, member_email) "
                  + "values(?, ?, ?) ";
         
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, id);
         pstmt.setString(2, name);
         pstmt.setString(3, email);
         result = pstmt.executeUpdate(); // 삽입 성공하면 1, 실패하면 0
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
   
   
   
   // MyPage - profileUpdate 뷰에 보일 회원 정보
   // 정보 수정할 행 조회
   public Mem selectInfo(String id) {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      try {
         con = ds.getConnection();

         String select_sql = "select * from member where member_id=?";

         pstmt = con.prepareStatement(select_sql);
         pstmt.setString(1, id);
         rs = pstmt.executeQuery();

         if (rs.next()) {
            Mem m = new Mem();
            m.setMember_id(rs.getString("member_id"));
            m.setMember_name(rs.getString("member_name"));
            m.setMember_email(rs.getString("member_email"));
            m.setMember_phone(rs.getString("member_phone"));
            m.setMember_post(rs.getString("member_post"));
            m.setMember_address(rs.getString("member_address"));

            return m;
         }
      } catch (Exception se) {
         se.printStackTrace();
      } finally {
         try {
            if (rs != null)
               rs.close();
         } catch (SQLException e) {
            System.out.println(e.getMessage());
         }
         try {
            if (pstmt != null)
               pstmt.close();
         } catch (SQLException e) {
            System.out.println(e.getMessage());
         }
         try {
            if (con != null)
               con.close(); // DB 연결은 마지막에 끊는다
         } catch (Exception e) {
            System.out.println(e.getMessage());
         }
      } // try-catch-finally 끝
      return null; // 조회된 행이 없으면 null 반환
   } // selectInfo() 메소드 끝
   // 정보 수정 - 비밀번호도 수정 했을 때 
   public int profileUpdate(String id, String pass, String email, String phone, String postcode, String address) {
      Connection con = null;
      PreparedStatement pstmt = null;
      int result = 0;
      
      try {
         con = ds.getConnection();
         
         String update_sql = "update member "
                        + "set member_pass = ?, "
                        + "      member_email = ?, "
                        + "      member_phone= ?, "
                        + "      member_post= ?, "
                        + "      member_address= ? "
                        + "where member_id = ?";
         pstmt = con.prepareStatement(update_sql);
         pstmt.setString(1, pass);
         pstmt.setString(2, email);
         pstmt.setString(3, phone);
         pstmt.setString(4, postcode);
         pstmt.setString(5, address);
         pstmt.setString(6, id); // where id = ?
            
         result = pstmt.executeUpdate(); // update된 행의 개수 - 수정 잘 되면 1, 아니면 0
      } catch(Exception se) {
         se.printStackTrace();
      } finally {
         try {
            if(pstmt != null) 
            pstmt.close();
         } catch(SQLException e) {
            System.out.println(e.getMessage());
         }
         try {
            if(con != null) 
               con.close(); // DB 연결은 마지막에 끊는다
         } catch(Exception e) {
            System.out.println(e.getMessage());
         }
      } // try-catch-finally 끝
      return result; // 
   } // profileUpdate() 메소드 끝
   // 정보 수정 - 비밀번호 수정 안 했을 때 
   public int profileUpdate(String id, String email, String phone, String postcode, String address) {
      Connection con = null;
      PreparedStatement pstmt = null;
      int result = 0;
      
      try {
         con = ds.getConnection();
         
         String update_sql = "update member "
                        + "set member_email = ?, "
                        + "      member_phone= ?, "
                        + "      member_post= ?, "
                        + "      member_address= ? "
                        + "where member_id = ?";
         pstmt = con.prepareStatement(update_sql);
         pstmt.setString(1, email);
         pstmt.setString(2, phone);
         pstmt.setString(3, postcode);
         pstmt.setString(4, address);
         pstmt.setString(5, id); // where id = ?
            
         result = pstmt.executeUpdate(); // update된 행의 개수 - 수정 잘 되면 1, 아니면 0
      } catch(Exception se) {
         se.printStackTrace();
      } finally {
         try {
            if(pstmt != null) 
            pstmt.close();
         } catch(SQLException e) {
            System.out.println(e.getMessage());
         }
         try {
            if(con != null) 
               con.close(); // DB 연결은 마지막에 끊는다
         } catch(Exception e) {
            System.out.println(e.getMessage());
         }
      } // try-catch-finally 끝
      return result; // 
   } // profileUpdate() 메소드 끝
  


   //findId () start
	public String findId(String getter) {
		Connection con = null;
	    PreparedStatement pstmt = null;
		ResultSet rs = null;
	    String findId = null;
		
		try {
			con = ds.getConnection();
			
			String sql = "SELECT member_id FROM member WHERE member_email =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, getter);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				findId = rs.getString("member_id");
				System.out.println("아이디 : "+findId);
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return findId;
	} // findId() end
  
}