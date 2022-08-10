package my.mypage.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProfileAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setAttribute("myPage", "profile");
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false); // dispatcher
		forward.setPath("mypage/myPage.jsp");
		return forward;
		
		
	}
}
