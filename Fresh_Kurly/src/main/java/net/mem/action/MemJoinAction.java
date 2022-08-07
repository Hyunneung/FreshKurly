package net.mem.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		
		// 로그인 된 상태에서 회원가입 폼으로 돌아가면(뒤로가기) 로그인 됐다고 나온다
		/*
		HttpSession session= request.getSession();
		String id = (String)session.getAttribute("id");
		
		if(id != null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('이미 로그인 되셨습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		*/
		
		forward.setRedirect(false); // dispatcher 
		forward.setPath("member/join.jsp");
		return forward;
	}
}
