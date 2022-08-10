package my.mypage.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my.mypage.db.OrderInfoDAO;
import my.mypage.db.OrderInfo;

public class OrderInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		HttpSession session= request.getSession();
		String id = (String)session.getAttribute("id");
		request.setAttribute("myPage", "order");
		
		OrderInfoDAO dao = new OrderInfoDAO();
		int listcount = dao.getOrderListCount(id);
		List<OrderInfo> list = dao.getOrderList(id);
		request.setAttribute("listcount", listcount); // 주문내역 수
		request.setAttribute("orderlist", list); // 주문내역list를 orderlist라는 속성명으로 저장
		
		forward.setRedirect(false); // 주소 변경 없이 보낸다
		forward.setPath("mypage/myPage.jsp");
		return forward;
		
		
		/*
		// 로그인 하지 않은 상태로 마이페이지 누르면 로그인 페이지로 이동
		if(id == null) {
			forward.setRedirect(true);
			forward.setPath("login.net");
			return forward;
		} else {
			MyPageDAO dao = new MyPageDAO();
			List<OrderInfo> list = dao.getOrderList(id);
			request.setAttribute("oiderlist", list); // 주문내역 list를 oiderlist라는 속성명으로 저장
			
			forward.setRedirect(false); // 주소 변경 없이 보낸다
			forward.setPath("mypage/myPage.jsp");
			return forward;
		}
		*/
	}
}
