package item.iteminfo.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.iteminfo.db.Item;
import item.iteminfo.db.ItemDAO;

public class showByCategory implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		ItemDAO dao = new ItemDAO();
		
		List<Item> list = null;
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String category = request.getParameter("category");
		
		list = dao.getListByCategory(category);
					
					
		request.setAttribute("itemList", list);					

		forward.setPath("item/show_by_category.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
