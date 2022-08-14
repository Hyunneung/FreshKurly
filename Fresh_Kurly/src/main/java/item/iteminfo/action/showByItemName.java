package item.iteminfo.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.iteminfo.db.Item;
import item.iteminfo.db.ItemDAO;

public class showByItemName implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		ItemDAO dao = new ItemDAO();
		
		List<Item> list = null;
		
		String item_name = request.getParameter("item_name");
		
		list = dao.getListByItemName(item_name);
					
					
		request.setAttribute("itemList", list);					

		forward.setPath("item/show_by_itemName.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
