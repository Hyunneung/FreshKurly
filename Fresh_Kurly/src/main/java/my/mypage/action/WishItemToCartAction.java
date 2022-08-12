package my.mypage.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my.mypage.db.WishDAO;

public class WishItemToCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("id");
		int item_id = Integer.parseInt( request.getParameter("item_id") );
		
		WishDAO dao = new WishDAO();
		int result = dao.wishItemToCart(member_id, item_id); // 장바구니에 잘 담기면 1, 기존에 있어서 못담으면 0, 에러나면 -1
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		if (member_id == null) { // 비회원은 장바구니 서비스 불가
			out.println("<script>");
			out.println("history.back()");
			out.println("</script>");
			out.close();
			System.out.println("result = " + result + "(장바구니에 잘 담기면 1, 기존에 있어서 못담으면 0, 에러(비회원)나면 -1)");
			return null;
		} else {
			out.print(result);
			out.close();
			System.out.println("result = " + result + "(장바구니에 잘 담기면 1, 기존에 있어서 못담으면 0, 에러(비회원)나면 -1)");
			return null;
		}
	}
}
