package item.iteminfo.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.iteminfo.db.Item;
import item.iteminfo.db.ItemDAO;

public class showAllItem implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		ItemDAO dao = new ItemDAO();
		
		int page = 1;
		int limit = 8;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("넘어온 페이지 : " + page);
		
		List<Item> list = null;
		int listcount  = 0;//listcount 에는 총 아이템수가 들어갈것입니다
		
		listcount = dao.getListCount();
		list = dao.getAllList(page,limit);
		
		int maxpage = (listcount + limit -1) / limit ;
		System.out.println("총 페이지수 = "+ maxpage);
		
		int startpage = ((page-1) / 10) * 10 +1;
		System.out.println("현재 페이지에 보여줄 시작 페이지 수 : " + startpage);
		int endpage = startpage + 10 -1 ;
		System.out.println("현재 페이지에 보여줄 마지막 페이지 수 : "+ endpage);			
		
		
		if (endpage > maxpage)
			endpage = maxpage;
		
		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
	
		request.setAttribute("listcount", listcount); //총 아이템 수
		
		request.setAttribute("itemList", list);					

		forward.setPath("item/show_all_item.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
