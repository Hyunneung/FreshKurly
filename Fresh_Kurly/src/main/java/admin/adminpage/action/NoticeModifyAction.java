package admin.adminpage.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import admin.adminpage.db.NoticeBean;
import admin.adminpage.db.NoticeDAO;

public class NoticeModifyAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		NoticeDAO noticedao = new NoticeDAO();
		NoticeBean noticedata = new NoticeBean();
		ActionForward forward = new ActionForward();
		
		boolean result = false;
		try {
			int num = Integer.parseInt(request.getParameter("notice_number"));
			String pass = request.getParameter("notice_pass");
			
			// 글쓴이 인지 확인하기 위해 저장된 비밀번호와 입력한 비밀번호를 비교합니다.
			boolean usercheck = noticedao.isnoticeWriter(num, pass);
			// 비밀번호가 다른 경우
	         if (usercheck == false) {
	            response.setContentType("text/html;charset=utf-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>");
	            out.println("alert('비밀번호가 다릅니다.')");
	            out.println("history.back();");
	            out.println("</script>");
	            out.close();
	            return null;
	         }
	         
	         // 비밀번호가 일치하는 경우 수정 내용을 설정합니다.
	         // noticeBean 객체에 글 등록 폼에서 입력 받은 정보들을 저장합니다.
	         noticedata.setNotice_number(num);
	         noticedata.setNotice_subject(request.getParameter("notice_subject")); 
	         noticedata.setNotice_content(request.getParameter("notice_content"));
             
             // DAO에서 수정 메서드 호출하여 수정합니다.
             result = noticedao.noticeModify(noticedata);
             
             // 수정에 실패한 경우
             if (result == false) {
            	 System.out.println("공지사항 게시물 수정 실패");
            	 forward.setRedirect(false);
            	 request.setAttribute("message", "공지사항 게시판 수정이 되지 않았습니다.");
            	 forward.setPath("error/error.jsp");
            	 return forward;
             }
             // 수정 성공의 경우
             System.out.println("공지사항 게시판 수정 완료");
             
             forward.setRedirect(true);
             // 수정한 글 내용을 보여주기 위해 글 내용 보기 페이지로 이동하기위해 경로를 설정합니다.
             forward.setPath("NoticeDetailAction.ad?num=" + noticedata.getNotice_number());
             return forward;
		} catch (IOException e) {
			e.printStackTrace();
			forward.setPath("error/error.jsp");
			request.setAttribute("message", "공시사항 게시판 업로드 중 실패입니다.");
			forward.setRedirect(false);
			return forward;
		}
	}
}
