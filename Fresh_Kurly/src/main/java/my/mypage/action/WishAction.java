package my.mypage.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my.mypage.db.Wish;
import my.mypage.db.WishDAO;

public class WishAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		HttpSession session= request.getSession();
		String id = (String)session.getAttribute("id");
		request.setAttribute("myPage", "wish");
		
		
		WishDAO dao = new WishDAO();
		int listcount = 0; // 주문내역에 담긴 제품 수 
		List<Wish> list = null;
		
		listcount = dao.getWishListCount(id);
		list = dao.getWishList(id);
		request.setAttribute("listcount", listcount); // 위시리스트 수
		request.setAttribute("wishlist", list); // 위시리스트를 wishlist라는 속성명으로 저장
		
		
		
		
		
		
		forward.setPath("mypage/myPage.jsp");
		forward.setRedirect(false); // 주소 변경 없이 보낸다
		return forward;
		
	}

}
