package item.iteminfo.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.iteminfo.db.Item;
import item.iteminfo.db.ItemDAO;


public class gotoMainpage implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		ItemDAO dao = new ItemDAO();
		
		List<Item> list1 = null; //과일
		List<Item> list2 = null; //야채
		List<Item> list3 = null; //수산 건어물
		List<Item> list4 = null; //정육
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String category1 = "과일";
		String category2 = "야채";
		String category3 = "수산/건어물";
		String category4 = "정육/계란";
		
		list1 = dao.getListByCategory(category1);
		list2 = dao.getListByCategory(category2);
		list3 = dao.getListByCategory(category3);
		list4 = dao.getListByCategory(category4);
					
					
		request.setAttribute("itemList1", list1);
		request.setAttribute("itemList2", list2);
		request.setAttribute("itemList3", list3);
		request.setAttribute("itemList4", list4);
		forward.setRedirect(false); // dispatcher 
		forward.setPath("mainpage/mainpage.jsp");
		return forward;
	}

}
