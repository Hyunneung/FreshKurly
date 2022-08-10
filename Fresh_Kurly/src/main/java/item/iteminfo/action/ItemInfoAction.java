package item.iteminfo.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.iteminfo.db.Item;
import item.iteminfo.db.ItemDAO;

public class ItemInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		ItemDAO mdao = new ItemDAO();
		
		String item_id = request.getParameter("item_id");
		
		Item m = mdao.Item_info(item_id);
		
		if (m == null) {
			forward.setPath("error/error.jsp");
			forward.setRedirect(false);
			request.setAttribute("message", "아이디에 해당하는 정보가 없습니다.");
			return forward;
		}
		
		request.setAttribute("iteminfo", m);
		forward.setPath("item/itemInfo.jsp");
		forward.setRedirect(false);
		return forward;
	}
		
}
