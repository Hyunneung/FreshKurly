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

public class NoticeDAO {
	private DataSource ds;
	
	// 생성자에서 JNDI 리소스를 참조하여 Connection 객체를 얻어옵니다.
	public NoticeDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}
	
	public boolean noticeInsert(NoticeBean notice) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			con = ds.getConnection();
			
			String max_sql = "(select nvl(max(notice_num),0)+1 from notice)";

			// 원문글의 NOTICE_RE_REF 필드는 자신의 글번호 입니다.
			String sql = "insert into notice " 
			            + "(NOTICE_NUM,     NOTICE_NAME,  NOTICE_PASS,    NOTICE_SUBJECT,"
					    + " NOTICE_CONTENT, NOTICE_VIEW)"
					    + " values(" + max_sql + ",?,?,?," 
			            + "        ?,?)";

			 // 새로운 글을 등록하는 부분입니다.
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, notice.getNotice_name());
	         pstmt.setString(2, notice.getNotice_pass());
	         pstmt.setString(3, notice.getNotice_subject());
	         pstmt.setString(4, notice.getNotice_content());
	         pstmt.setInt(5, 0); // NOTICE_VIEW 필드
	         
	         result = pstmt.executeUpdate();
	         if (result ==1) {
	        	 System.out.println("데이터 삽입이 모두 완료되었습니다.");
	        	 return true;
	         }
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("getListCount() 에러: " + ex);
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
		}//finally   
		return false;
	}// noticeInsert()메서드 end
	
	// 글의 갯수 구하기
	public int getListCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		int x = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from notice");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("getListCount() 에러: " + ex);
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
	}//getListCount()메서드 end
	
	// 글 목록보기
	public List<NoticeBean> getNoticeList(int page, int limit) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;

		String notice_list_sql = "select * " 
                + "  from  (select rownum rnum, j.* "
                + "         from (select notice.*,  nvl(cnt,0) cnt "
	            + "               from notice left outer join (select comment_notice_num,count(*) cnt"
                + "                                           from comm"
                + "                                           group by comment_notice_num)"
                + "               on notice_num=comment_notice_num"
	            + "               ) j "
	            + "         where rownum<= ? "      
	            + "         ) "
	            + " where rnum>=? and rnum<=?";

		
		List<NoticeBean> list = new ArrayList<NoticeBean>();
		// 한 페이지당 10개씩 목록인 경우 1페이지, 2페이지, 3페이지, 4페이지 ...
		int startrow = (page -1) * limit + 1; // 일기 시작할 row 번호(1 11 21 31 ...
		int endrow = startrow + limit - 1;	 // 읽을 마지막 row 번호(10 20 30 40 ...
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(notice_list_sql);
			pstmt.setInt(1, endrow);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();

			// DB에서 가져온 데이터를 VO객체에 담습니다.
			while (rs.next()) {
				NoticeBean notice = new NoticeBean();
				notice.setNotice_num(rs.getInt("Notice_NUM"));
				notice.setNotice_name(rs.getString("NOTICE_NAME"));
				notice.setNotice_subject(rs.getString("NOTICE_SUBJECT"));
				notice.setNotice_content(rs.getString("NOTICE_CONTENT"));
				notice.setNotice_view(rs.getInt("NOTICE_VIEW"));
				notice.setNotice_date(rs.getString("NOTICE_DATE"));
				notice.setCnt(rs.getInt("cnt"));
				list.add(notice); // 값을 담은 객체를 리스트에 저장합니다.
				
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("getNoticeList() 에러: " + ex);
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
	}// getnoticeList()메서드 end
	
	// 조회수 업데이트 - 글번호에 해당하는 조회수를 1 증가합니다.
	public void setReadCountUpdate(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;		
		String sql = "update notice "
				   + "set NOTICE_VIEW=NOTICE_VIEW+1 "
				   + "where NOTICE_NUM = ?";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("setReadCountUpdate() 에러: " + ex);
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
		      }//finally 
	}//setReadCountUpdate()메서드 end

	public NoticeBean getDetail(int num) {
		NoticeBean notice = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		try{
			con = ds.getConnection();    
			pstmt = con.prepareStatement("select * from notice where NOTICE_NUM = ?");        
			pstmt.setInt(1, num);         
			rs= pstmt.executeQuery();         
			if (rs.next()) {
				notice = new NoticeBean();
				notice.setNotice_num(rs.getInt("NOTICE_NUM"));
				notice.setNotice_name(rs.getString("NOTICE_NAME"));
				notice.setNotice_subject(rs.getString("NOTICE_SUBJECT"));
				notice.setNotice_content(rs.getString("NOTICE_CONTENT"));
				notice.setNotice_view(rs.getInt("NOTICE_VIEW"));
				notice.setNotice_date(rs.getString("NOTICE_DATE"));
			}        			
		} catch(Exception ex){  
			ex.printStackTrace();
			System.out.println("getDetail 에러 : " + ex);      
		} finally{         
			if(rs!=null)
			   try { 
					rs.close();
				} catch( SQLException ex){
					ex.printStackTrace();
				}         
			if(pstmt !=null)
			   try { 
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}        
			if(con!=null) 
			   try {
					con.close();
				} catch (SQLException ex){
					ex.printStackTrace();
				}      
		}
		return notice;
	}// getDetail()메서드 end

	// 글쓴이인지 확인 - 비밀번호로 확인합니다.
	public boolean isnoticeWriter(int num, String pass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
		String NOTICE_sql = "select NOTICE_PASS from notice where NOTICE_NUM=?";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(NOTICE_sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (pass.equals(rs.getString("NOTICE_PASS"))) {
					result = true;
				}
			}
		} catch(Exception ex) {
	         ex.printStackTrace();
	         System.out.println("isNoticeWriter() 에러: " + ex);
	      }finally {
	         if(rs != null)
	            try {
	               rs.close();
	            }catch (SQLException ex) {
	               ex.printStackTrace();
	            }
	         if(pstmt != null)
	            try {
	               pstmt.close();
	            }catch (SQLException ex) {
	               ex.printStackTrace();
	            }
	         if(con != null)
	            try {
	               con.close();
	            }catch (SQLException ex) {
	               ex.printStackTrace();
	            }
	      }//finally   
		return result;
	}// isnoticeWriter()메서드 end

	// 글 수정
	public boolean noticeModify(NoticeBean modifynotice) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update notice "
				   + "set NOTICE_SUBJECT=?, NOTICE_CONTENT=?, NOTICE_FILE=? "
				   + "where NOTICE_NUM=? ";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, modifynotice.getNotice_subject());
			pstmt.setString(2, modifynotice.getNotice_content());
			pstmt.setInt(4, modifynotice.getNotice_num());
			int result = pstmt.executeUpdate();
	         if(result == 1) {
	            System.out.println("성공 업데이트");
	            return true;
	         }
	      } catch (Exception ex) {
	         ex.printStackTrace();
	         System.out.println("noticeModify() 에러: " + ex);
	      } finally {
	         if(pstmt != null)
	            try {
	               pstmt.close();
	            }catch (SQLException ex) {
	               ex.printStackTrace();
	            }
	         if(con != null)
	            try {
	               con.close();
	            }catch (SQLException ex) {
	               ex.printStackTrace();
	            }
	      }//finally  
	       return false;  
	   }//noticeModify() 메서드 end
	
	// 글 삭제
	public boolean noticeDelete(int num) {
		
		
		Connection con = null;
		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null;
		String notice_delete_sql = "delete from notice "
				+ "			 where  NOTICE_NUM = ?";
      boolean result_check = false;
      try {
		  con = ds.getConnection();	
    	  pstmt = con.prepareStatement(notice_delete_sql);
    	  pstmt.setInt(1, num);
    	  rs = pstmt.executeQuery();
    	  if (rs.next()) {
    		pstmt2 = con.prepareStatement(notice_delete_sql);
			pstmt2.setInt(1, rs.getInt("NOTICE_NUM"));
			
			int count=pstmt2.executeUpdate();
			
			if(count>=1)
				result_check = true;// 삭제가 안된 경우에는 false를 반환합니다.
    	  }			
      } catch (Exception ex) {
      	ex.printStackTrace();
      	System.out.println("noticeDelete() 에러: " + ex);
      } finally {
          if(rs != null)
              try {
                 rs.close();
              }catch (SQLException ex) {
                 ex.printStackTrace();
              }
           if(pstmt != null)
              try {
                 pstmt.close();
              }catch (SQLException ex) {
                 ex.printStackTrace();
              }
           if (pstmt2 != null)
		         try {
		               pstmt2.close();
		         } catch (SQLException ex) {
		            ex.printStackTrace();
		         }
           if(con != null)
              try {
                 con.close();
              }catch (SQLException ex) {
                 ex.printStackTrace();
              }
        }   
        return result_check;

	}// noticeDelte메서드 end

}// class end
