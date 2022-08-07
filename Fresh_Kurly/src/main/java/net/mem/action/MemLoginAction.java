package net.mem.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// ID기억하기 - 쿠키에 저장
public class MemLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		
		// 로그인 된 상태에서 로그인 폼으로 돌아가면(뒤로가기) 로그인 됐다고 나온다
		/*
		HttpSession session= request.getSession();
		if((String)session.getAttribute("id") != null) {
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
		
		String id = "";
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null) {
			for(int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("id") ) {
					id = cookies[i].getValue();
				}
			} // for end
		} // if end
		
		request.setAttribute("id", id);
		forward.setRedirect(false); // dispatcher 
		forward.setPath("member/login.jsp");
		return forward;
	}
}