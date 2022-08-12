package item.iteminfo.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.iteminfo.db.Item;
import item.iteminfo.db.ItemDAO;

public class ItemUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		String item_id = request.getParameter("item_id");
		
		ItemDAO mdao = new ItemDAO();
		Item m = mdao.Item_info(item_id);
		
		forward.setPath("item/item_update_Form.jsp");
		forward.setRedirect(false);
		request.setAttribute("iteminfo", m);
		return forward;
	}

}
