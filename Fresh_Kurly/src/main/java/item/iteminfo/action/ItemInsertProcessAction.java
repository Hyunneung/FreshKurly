package item.iteminfo.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.iteminfo.db.Item;
import item.iteminfo.db.ItemDAO;

public class ItemInsertProcessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int item_id = Integer.parseInt(request.getParameter("item_id"));
		String item_name = request.getParameter("item_name");
		int item_price = Integer.parseInt(request.getParameter("item_price"));
		String item_image = request.getParameter("item_image");
		String item_deliver = request.getParameter("item_deliver");
		String item_seller = request.getParameter("item_seller");
		String item_package = request.getParameter("item_package");
		String item_expiredate = request.getParameter("item_expiredate");
		String item_unit = request.getParameter("item_unit");
		String item_weight = request.getParameter("item_weight");
		String item_category = request.getParameter("item_category");
		String item_intro = request.getParameter("item_intro");
		int item_stock = Integer.parseInt(request.getParameter("item_stock"));
				
		
		
		Item i = new Item();
		i.setItem_id(item_id); i.setItem_name(item_name); i.setItem_price(item_price);
		i.setItem_image(item_image); i.setItem_deliver(item_deliver);
		i.setItem_seller(item_seller); i.setItem_package(item_package);
		i.setItem_expiredate(item_expiredate); i.setItem_unit(item_unit);
		i.setItem_weight(item_weight); i.setItem_category(item_category);
		i.setItem_intro(item_intro); i.setItem_stock(item_stock);
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		ItemDAO dao = new ItemDAO();
		int result = dao.insert(i);
		
		if (result == 0) {
			System.out.println("상품등록 실패입니다.");
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			request.setAttribute("message", "상품등록 실패입니다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		
		out.print("<script>");
		if (result == 1) { // 삽입이 된 경우
			out.println("alert('상품등록을 축하합니다.');");
			out.println("location.href='itemList.item';");
		} 
		
		out.print("</script>");
		out.close();
		
		return null;
	}

}
