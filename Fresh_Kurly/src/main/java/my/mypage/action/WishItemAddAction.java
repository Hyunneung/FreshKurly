package my.mypage.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my.mypage.db.WishDAO;

public class WishItemAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("id");
		int item_id = Integer.parseInt( request.getParameter("item_id") );
		
		// 비회원은 찜한상품 서비스 불가 - itempage.jsp 완성되면 비회원 걸러지는지 확인해야 함
		if (member_id == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인하셔야 본 서비스를 이용하실 수 있습니다.');");
			out.println("history.back()");
			out.println("</script>");
			out.close();
			return null;
		} else {
			WishDAO dao = new WishDAO();
			int result = dao.wishItemAdd(member_id, item_id); // 장바구니에 잘 담기면 1, 기존에 있어서 못담으면 0, 에러나면 -1
			
			response.getWriter().print(result);
			System.out.println("result = " + result + "(찜한상품에 잘 담기면 1, 기존에 있어서 못담으면 0, 에러나면 -1)");
			return null;
		}
	}

}
