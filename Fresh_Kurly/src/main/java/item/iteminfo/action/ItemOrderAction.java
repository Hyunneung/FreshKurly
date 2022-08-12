package item.iteminfo.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import item.iteminfo.db.ItemDAO;

public class ItemOrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		/*
		 * ItemDAO dao = new ItemDAO();
		 * 
		 * int num = dao.item_id_num();
		 * 
		 * request.setAttribute("item_id", num);
		 */
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
	

		if(id == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");out.println("alert('로그인하고 해주세요');");
			out.println("location.href=member/login.jsp");
			out.println("</script>");
			out.close();
			return null;
		} else {
			ItemDAO dao = new ItemDAO();
			result = dao.idfo_iteminfo();
			
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("item/item_order_Form.jsp");
			return forward;
		}
		
		
	}

}



