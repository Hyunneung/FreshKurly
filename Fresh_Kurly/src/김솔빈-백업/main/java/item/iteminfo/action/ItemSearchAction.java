package item.iteminfo.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import item.iteminfo.db.Item;
import item.iteminfo.db.ItemDAO;

public class ItemSearchAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		ItemDAO mdao = new ItemDAO();
		
		int page = 1; // 보여줄 page
		int limit = 10; // 한 페이지에 보여줄 게시판 목록의 수
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("넘어온 페이지 =" + page);
		
		List<Item> list = null;
		int listcount = 0;
		int index = -1; // search_field에 존재하지 않는 값으로 초기화
		
		String search_word="";
		
		//메뉴-관리자-회원정보 클릭한 경우(member_list.net)
		//또는 메뉴-관리자-회원정보 클릭 후 페이지 클릭한 경우
		//(member_list.net?page=2&search_field=-1&search_word=)
		if (request.getParameter("search_word") == null
				|| request.getParameter("search_word").equals("")) {
			// 총 리스트 수를 받아옵니다.
			listcount = mdao.getListCount();
			list = mdao.getList(page, limit);
		} else {
			index= Integer.parseInt(request.getParameter("search_field"));
			String[] search_field = new String[] { "item_id", "item_name", "item_category"};
			search_word = request.getParameter("search_word");
			listcount = mdao.getListCount(search_field[index], search_word);
			list = mdao.getList(search_field[index], search_word, page, limit);
		}
		
		int maxpage = (listcount + limit -1) / limit;
		System.out.println("총 페이지수 = " + maxpage);
				 
		int startpage = ((page - 1) / 10) * 10 + 1;
		System.out.println("현재 페이지에 보여줄 시작 페이지 수 : " + startpage);
				
		int endpage = startpage + 10 -1;
		System.out.println("현재 페이지에 보여줄 마지막 페이지 수 : " + endpage);
				
				
		if (endpage > maxpage)
			endpage = maxpage;
				
				
		request.setAttribute("page", page); // 현재 페이지 수
		request.setAttribute("maxpage", maxpage); // 최대 페이지 수
		
		// 현재 페이지에 표시할 첫 페이지 수
		request.setAttribute("startpage", startpage); 
					
		// 현재 페이지에 표시할 끝 페이지 수
		request.setAttribute("endpage", endpage);
					
		request.setAttribute("listcount", listcount); // 총 글의 수
		request.setAttribute("totallist", list);					
		request.setAttribute("search_field", index);					
		request.setAttribute("search_word", search_word);					

		forward.setPath("item/itemregister.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
