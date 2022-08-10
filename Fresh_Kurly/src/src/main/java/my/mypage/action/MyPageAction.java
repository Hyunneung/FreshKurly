// 삭제삭제삭제
package my.mypage.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String myPage = request.getParameter("myPage");
		
		if( request.getAttribute("myPage") != null ) {
			myPage = (String) request.getAttribute("myPage");
		}
		System.out.println("마이페이지 어트리뷰트 " + request.getAttribute("myPage"));
		
		// 마이페이지의 기본페이지는 주문내역 페이지
		if(myPage == null) {
			myPage = "order";
		}
		
		request.setAttribute("myPage", myPage);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("mypage/myPage.jsp");
		return forward;
	}

}
