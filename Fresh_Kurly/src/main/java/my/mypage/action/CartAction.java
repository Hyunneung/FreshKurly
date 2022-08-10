package my.mypage.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my.mypage.db.Cart;
import my.mypage.db.CartDAO;

public class CartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		HttpSession session= request.getSession();
		String id = (String)session.getAttribute("id");
		request.setAttribute("myPage", "cart");
		
		
		CartDAO dao = new CartDAO();
		int listcount = 0; // 카트에 담긴 제품 수 
		List<Cart> list = null; // 카트에 담긴 리스트
		
		listcount =dao.getCartListCount(id);
		list = dao.getCartList(id);
		request.setAttribute("listcount", listcount); // 카트에 담긴 각 제품 수
		request.setAttribute("cartlist", list); // 카트리스트를 cartlist라는 속성명으로 저장
		
		forward.setPath("mypage/myPage.jsp");
		forward.setRedirect(false); // dispatcher - 주소 변경x
		
		return forward;
		
		
		
		
		// 로그인 하지 않은 상태로 마이페이지 누르면 로그인 페이지로 이동하는거 추가하기
	}
}
