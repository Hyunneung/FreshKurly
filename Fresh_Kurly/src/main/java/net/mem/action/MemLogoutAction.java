package net.mem.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		
		request.getSession().invalidate(); // 로그아웃 - 세션에 저장했던 모든 회원 정보 제거
		
		forward.setPath("/index.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
