package my.mypage.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my.mypage.db.WishDAO;

public class WishItemDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("id");
		int item_id = Integer.parseInt( request.getParameter("item_id") );
		
		WishDAO dao = new WishDAO();
		int result = dao.wishItemDelete(member_id, item_id); // 찜한상품 삭제 성공하면 1, 실패하면 0
		
		response.getWriter().print(result);
		System.out.println("result = " + result + "(찜한상품 아이템 삭제 성공하면 1, 실패하면 0)");
		return null;
	}

}
