package admin.adminpage.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private DataSource ds;
		
	// 생성자에서 JNDI 리소스 참조하여 Connection 객체를 얻어옵니다.	
	public MemberDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}

	public Member member_info(String member_id) {
		Member m = null;
		Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs= null;
	    try {
	    	con = ds.getConnection();
	    	
	    	String sql = "select * from member where member_id = ? ";
	    	pstmt = con.prepareStatement(sql);
	    	pstmt.setString(1, member_id);
	    	rs = pstmt.executeQuery();
	    	if(rs.next()){
	    		m = new Member();
	    		m.setMember_id(rs.getString(1));
	    		m.setMember_pass(rs.getString(2));
	            m.setMember_name(rs.getString(3));
	            m.setMember_email(rs.getString(4));
	            m.setMember_phone(rs.getString(5));
	            m.setMember_post(rs.getString(6));
	            m.setMember_address(rs.getString(7));
	            m.setMember_gender(rs.getString(8));
	            m.setMember_jumin(rs.getString(9));
	    	}
	    } catch(Exception e) {
	         e.printStackTrace();
	      }finally {
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
	      }//finally   
	      return m;
	    
	}//Member member_info()메서드 end

	

	public int getListCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int x = 0;
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from member where member_id != 'admin'");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("getListCont() 에러: " + ex);
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
		      }//finally   

		
		return x;
	}//getListCount() 메서드 end
	
	public int getListCount(String field, String value) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int x = 0;
		try {
			
			con = ds.getConnection();
			String sql = "select count(*) from member "
					   + "where member_member_id !='admin' "
					   + "and " + field + " like ?"; // and name like '%홍길동%'
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+value+"%");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("getListCont() 에러: " + ex);
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
		      }//finally   

		
		return x;
	}//getListCount(String field, String vlaue) 메서드 end

	public List<Member> getList(int page, int limit) {
		List<Member> list = new ArrayList<Member>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con = ds.getConnection();
			
			String sql = "select * "
					+ "   from (select	b.*, rownum rnum"
					+ " 		from(select * from member "
					+ " 			 where member_member_id != 'admin'"
					+ "				 order by member_member_id) b"
					+ 			")"
					+ "   where rnum>=? and rnum<=?";
			pstmt = con.prepareStatement(sql);
			// 한 페이지당 10개씩 목록인 경우 1페이지, 2페이지, 3페이지, 4페이지 ...
			int startrow = (page - 1) * limit + 1;
						  // 읽기 시작할 row 번호(1 11 21 31 ...
			int endrow = startrow + limit - 1;
						 // 읽을 마지막 row 번호(10 20 30 40 ...
			pstmt.setInt(1, endrow);
			pstmt.setInt(2, startrow);
			pstmt.setInt(1, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Member m = new Member();
				m.setMember_id(rs.getString("member_id"));
				m.setMember_pass(rs.getString(2));
				m.setMember_name(rs.getString(3));
				m.setMember_email(rs.getString(4));
				m.setMember_phone(rs.getString(5));
				m.setMember_reg_date(rs.getString(5));
				list.add(m);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("getListCont() 에러: " + ex);
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
		      }//finally   
		return list;
	}
	
	public List<Member> getList(String field, String value, int page, int limit) {
		List<Member> list = new ArrayList<Member>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con = ds.getConnection();
			
			String sql = 
					"select * "
					+ "   from (select	b.*, rownum rnum"
					+ " 		from(select * from member "
					+ " 			 where member_id != 'admin'"
					+ " 			 and " + field + " like ?"			
					+ "				 order by memember_id) b"
					+ 			")"
					+ "   where rnum between ? and ?" ;
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+value+"%");
			
			// 한 페이지당 10개씩 목록인 경우 1페이지, 2페이지, 3페이지, 4페이지 ...
			// 읽기 시작할 row 번호(1 11 21 31 ...
			int startrow = (page - 1) * limit + 1;
			// 읽을 마지막 row 번호(10 20 30 40 ...
			int endrow = startrow + limit - 1;
			pstmt.setString(1, "%"+value+"%");
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Member m = new Member();
				m.setMember_id(rs.getString("member_id"));
				m.setMember_name(rs.getString(3));
				list.add(m);
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
		      }//finally   
		return list;
	}
	
	//회원 정보 삭제
	public int delete(String member_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			con = ds.getConnection();
			String sql ="delete from member where member_id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			result=pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
        } finally {
         
        if (pstmt != null)
            try {
               pstmt.close();
            }catch (SQLException ex) {
               ex.printStackTrace();
            }
        if (con != null)
            try {
               con.close();
            }catch (SQLException ex) {
               ex.printStackTrace();
            }
      }   
      return result;

	}//delete()메서드 end

	

}//class end
	
	