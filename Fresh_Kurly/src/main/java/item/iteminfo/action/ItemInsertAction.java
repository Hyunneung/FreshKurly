package item.iteminfo.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.iteminfo.db.ItemDAO;

public class ItemInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ItemDAO dao = new ItemDAO();
		
		int num = dao.item_id_num();
		
		request.setAttribute("item_id", num);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("item/item_insert_Form.jsp");
		return forward;
	}

}
