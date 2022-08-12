//글 등록에 대한 Action 클래스
package board.boardpage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import javax.servlet.ServletException;

import board.boardpage.db.QnaDAO;

public class QnaAddAction implements Action {
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
	   
		QnaDAO qnadao 	 =new QnaDAO();
		QnaBean qnadata  =new QnaBean();
		ActionForward forward=new ActionForward();
			
			boolean result=false;
			//qnaBean 객체에 글 등록 폼에서 입력 받은 정보들을 저장합니다.
	         qnadata.setQna_name(request.getParameter("qna_name"));
	         qnadata.setQna_pass(request.getParameter("qna_pass"));
	         qnadata.setQna_subject(request.getParameter("qna_subject"));
	         qnadata.setQna_content(request.getParameter("qna_content"));
	         
	         //글 등록 처리를 위해 DAO의 qnaInsert()메서드를 호출합니다.
	         //글 등록 폼에서 입력한 정보가 저장되서 있는 qnadata객체를 전달합니다.
	         result=qnadao.qnaInsert(qnadata);
	         
	         //글 등록에 실패할 경우 false를 반환합니다.
	         if(result==false){
	        	 System.out.println("게시판 등록 실패");
	        	 forward.setPath("error/error.jsp");
	        	 request.setAttribute("message", "게시판 등록 실패입니다.");
	        	 forward.setRedirect(false);
	        	 return forward;
	         }
	         System.out.println("게시판 등록 완료");
			
			 forward.setRedirect(true);
			 forward.setPath("QnaList.bo");//이동할 경로를 지정합니다.
			 return forward;
	}//excute end
}
