package board.boardpage.db;

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
	
	// 생성자에서 JNDI 리소스를 참조하여 Connection 객체를 얻어옵니다.
	public QnaDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}
	
	public boolean qnaInsert(QnaBean qna) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			con = ds.getConnection();
			
			String max_sql = "(select nvl(max(qna_num),0)+1 from qna)";

			// 원문글의 QNA_RE_REF 필드는 자신의 글번호 입니다.
			String sql = "insert into qna " 
			            + "(QNA_NUM,     QNA_NAME,  QNA_PASS,    QNA_SUBJECT,"
					    + " QNA_CONTENT, QNA_VIEW)"
					    + " values(" + max_sql + ",?,?,?,?,?)";

			 // 새로운 글을 등록하는 부분입니다.
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, qna.getQna_name());
	         pstmt.setString(2, qna.getQna_pass());
	         pstmt.setString(3, qna.getQna_subject());
	         pstmt.setString(4, qna.getQna_content());
	         pstmt.setInt(5, 0); // QNA_VIEW 필드
	         
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
	}// qnaInsert()메서드 end
	
	// 글의 갯수 구하기
	public int getListCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		int x = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from QNA");
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
	public List<QnaBean> getQnaList(int page, int limit) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;

		// page : 페이지
		// limit : 페이지 당 목록의 수
		// qna_re_ref desc, qna_re_seq asc에 의한 정렬한 것을
		// 조건절에 맞는 rnum의 범위 만큼 가져오는 쿼리문입니다.
		
		String qna_list_sql = "select * " 
                + "  from  (select rownum rnum, j.* "
                + "         from (select qna.*,  nvl(cnt,0) cnt "
	            + "               from qna left outer join (select comment_qna_num,count(*) cnt"
                + "                                           from comm"
                + "                                           group by comment_qna_num)"
                + "               on qna_num=comment_qna_num"
	            + "               order by QNA_RE_REF desc,"
                + "               QNA_RE_SEQ asc) j "
	            + "         where rownum<= ? "      
	            + "         ) "
	            + " where rnum>=? and rnum<=?";

		
		List<QnaBean> list = new ArrayList<QnaBean>();
		// 한 페이지당 10개씩 목록인 경우 1페이지, 2페이지, 3페이지, 4페이지 ...
		int startrow = (page -1) * limit + 1; // 일기 시작할 row 번호(1 11 21 31 ...
		int endrow = startrow + limit - 1;	 // 읽을 마지막 row 번호(10 20 30 40 ...
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(qna_list_sql);
			pstmt.setInt(1, endrow);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();

			// DB에서 가져온 데이터를 VO객체에 담습니다.
			while (rs.next()) {
				QnaBean qna = new QnaBean();
				qna.setQna_num(rs.getInt("QNA_NUM"));
				qna.setQna_name(rs.getString("QNA_NAME"));
				qna.setQna_subject(rs.getString("QNA_SUBJECT"));
				qna.setQna_content(rs.getString("QNA_CONTENT"));
				qna.setQna_readcount(rs.getInt("QNA_VIEW"));
				qna.setQna_date(rs.getString("QNA_DATE"));
				qna.setCnt(rs.getInt("cnt"));
				list.add(qna); // 값을 담은 객체를 리스트에 저장합니다.
				
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("getQnaList() 에러: " + ex);
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
	}// getQnaList()메서드 end
	
	// 조회수 업데이트 - 글번호에 해당하는 조회수를 1 증가합니다.
	public void setReadCountUpdate(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;		
		String sql = "update qna "
				   + "set QNA_VIEW=QNA_VIEW+1 "
				   + "where QNA_NUM = ?";
		
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

	public QnaBean getDetail(int num) {
		QnaBean qna = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		try{
			con = ds.getConnection();    
			pstmt = con.prepareStatement("select * from QNA where QNA_NUM = ?");        
			pstmt.setInt(1, num);         
			rs= pstmt.executeQuery();         
			if (rs.next()) {
				qna = new QnaBean();
				qna.setQna_num(rs.getInt("QNA_NUM"));
				qna.setQna_name(rs.getString("QNA_NAME"));
				qna.setQna_subject(rs.getString("QNA_SUBJECT"));
				qna.setQna_content(rs.getString("QNA_CONTENT"));
				qna.setQna_readcount(rs.getInt("QNA_VIEW"));
				qna.setQna_date(rs.getString("QNA_DATE"));
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
		return qna;
	}// getDetail()메서드 end

	// 글쓴이인지 확인 - 비밀번호로 확인합니다.
	public boolean isQnaWriter(int num, String pass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
		String qna_sql = "select QNA_PASS from qna where QNA_NUM=?";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(qna_sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (pass.equals(rs.getString("QNA_PASS"))) {
					result = true;
				}
			}
		} catch(Exception ex) {
	         ex.printStackTrace();
	         System.out.println("isQnaWriter() 에러: " + ex);
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
	}// isQnaWriter()메서드 end

	// 글 수정
	public boolean qnaModify(QnaBean modifyqna) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update qna "
				   + "set QNA_SUBJECT=?, QNA_CONTENT=? "
				   + "where QNA_NUM=? ";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, modifyqna.getQna_subject());
			pstmt.setString(2, modifyqna.getQna_content());
			pstmt.setInt(3, modifyqna.getQna_num());
			int result = pstmt.executeUpdate();
	         if(result == 1) {
	            System.out.println("성공 업데이트");
	            return true;
	         }
	      } catch (Exception ex) {
	         ex.printStackTrace();
	         System.out.println("qnaModify() 에러: " + ex);
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
	   }//qnaModify() 메서드 end

	
	// 글 삭제
	public boolean qnaDelete(int num) {
		Connection con = null;
		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null;
		String QNA_delete_sql = "delete from QNA where qna_num";
      boolean result_check = false;
      try {
		  con = ds.getConnection();	
    	  pstmt = con.prepareStatement(QNA_delete_sql);
    	  pstmt.setInt(1, num);
    	  rs = pstmt.executeQuery();
		 int count=pstmt.executeUpdate();
			
			if(count>=1)
				result_check = true;// 삭제가 안된 경우에는 false를 반환합니다.
    	  			
      } catch (Exception ex) {
      	ex.printStackTrace();
      	System.out.println("qnaDelete() 에러: " + ex);
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

	}// qnaDelte메서드 end

}// class end
