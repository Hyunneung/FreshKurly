package my.mypage.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my.mypage.db.CartDAO;

public class CartItemDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("id");
		int item_id = Integer.parseInt( request.getParameter("item_id") );
		
		CartDAO dao = new CartDAO();
		int result = dao.cartItemDelete(member_id, item_id);
		
		response.getWriter().print(result);
		System.out.println("result = " + result + "(DB에 아이템 삭제 성공하면 1, 실패하면 0)");
		return null;
	}

}
