package item.iteminfo.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import item.iteminfo.db.ItemDAO;

public class OrdercartDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("id");
		
		ItemDAO dao = new ItemDAO();
		int result = dao.cartItemDelete(member_id);
		
		if(result == 0) {
			System.out.println("장바구니 삭제 실패입니다.");
		} else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("location.href='myOrder.my';");
			out.print("</script>");
			out.close();
			
			
		}
		return null;
	}

}
