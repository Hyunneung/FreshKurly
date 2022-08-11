package net.mem.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// ID기억하기 - 쿠키에 저장
public class MemLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
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