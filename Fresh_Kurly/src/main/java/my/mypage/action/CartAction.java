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
		
		// 장바구니 페이지에 보여줄 아이템 정보
		CartDAO dao = new CartDAO();
		int listcount = 0; // 카트에 담긴 제품 리스트
		List<Cart> list = null; // 카트에 담긴 리스트
		listcount =dao.getCartListCount(id);
		list = dao.getCartList(id);
		request.setAttribute("listcount", listcount); // 카트에 담긴 각 제품 수
		request.setAttribute("cartlist", list); // 카트리스트를 cartlist라는 속성명으로 저장
		
		// 장바구니에 담긴 모든 상품 총액
		int totalAll = dao.getTotalAll(id);
		request.setAttribute("totalAll", totalAll); // 카트에 담긴 각 제품 수
		
		// 장바구니 페이지에 보여줄 회원 정보
		if(listcount > 0) {
			String post_address = dao.getMemberPostAddress(id);
			request.setAttribute("member_post", post_address.substring(0, 5)); // 회원 우편번호 저장
			request.setAttribute("member_address", post_address.substring(5)); // 회원 주소 저장
		}
		
		forward.setPath("mypage/myPage.jsp");
		forward.setRedirect(false); // dispatcher - 주소 변경x
		return forward;
		
		
		
		
		// 로그인 하지 않은 상태로 마이페이지 누르면 로그인 페이지로 이동하는거 추가하기
	}
}
