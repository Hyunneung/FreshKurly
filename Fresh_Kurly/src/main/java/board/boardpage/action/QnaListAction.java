package board.boardpage.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import board.boardpage.db.QnaDAO;

public class QnaListAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		QnaDAO qnadao = new QnaDAO();
		
		//로그인 성공시 파라미터 page가 없어요. 그래서 초기값이 필요합니다.
		int page = 1;	//보여줄 page
		int limit = 10;	//한 페이지에 보여줄 게신판 목록의 수
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("넘어온 페이지 =" + page);
		
		//추가
		if (request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
		}
		System.out.println("넘어온 limit =" + limit);
		
		// 총 리스트 수를 받아 옵니다.
		int listcount = qnadao.getListCount();
		
		List<QnaBean> list = null;
		int index=-1; //search_field에 존재하지 않는 값으로 초기화
		
		String search_word="";
		
		//메뉴-관리자-회원정보 클릭한 경우(member_list.net)
		//또는 메뉴-관리자-회원정보 클릭 후 페이지 클릭한 경우
		//(member_list.net?page=2&search_field=-1&search_word=)
		if (request.getParameter("search_word")==null
				|| request.getParameter("search_word").equals("")) {
			//총 리스트 수를 받아옵니다.
			listcount = qnadao.getListCount();
			list = qnadao.getQnaList(page,limit);
		} else { //검색을 클릭한 경우
			index=Integer.parseInt(request.getParameter("search_field"));
			String[] search_field = new String[] {"qna_subject", "qna_content"};
			search_word = request.getParameter("search_word");
			listcount = qnadao.getListCount(search_field[index], search_word);
			list = qnadao.getList(search_field[index], search_word, page, limit);
		}
		
		
		int maxpage = (listcount + limit - 1) / limit;
		System.out.println("총 페이지수 =" + maxpage);
				
		int startpage = ((page -1) / 10) * 10 + 1;
		System.out.println("현재 페이지에 보여줄 시작 페이지 수 :" + startpage);
		
		// endpage: 현재 페이지 그룹에서 보여줄 마지막 페이지 수([10]. [20], [30] end...)
		int endpage = startpage + 10 - 1;
		System.out.println("현재 페이지에 보여줄 마지막 페이지 수:" + endpage);

		if (endpage > maxpage)
			endpage = maxpage;
		
		String state = request.getParameter("state");
		
		if (state == null) {
			System.out.println("state==null");
			request.setAttribute("page", page);	// 현재 페이지 수
			request.setAttribute("maxpage", maxpage); // 최대 페이지 수
			
			// 현재 페이지에 표시할 첫 페이지 수
			request.setAttribute("startpage", startpage);
			
			// 현재 페이지에 표시할 끝 페이지 수
			request.setAttribute("endpage", endpage);
			
			request.setAttribute("listcount", listcount);	// 총 공지사항 글의 수
			
			// 헤당 페이지의 글 목록을 갖고 있는 리스트
			request.setAttribute("qnalist", list);
			
			request.setAttribute("search_field", index);
			request.setAttribute("search_word", search_word);
			
			request.setAttribute("limit", limit);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			
			// 글 목록 페이지로 이동하기 위해 경로를 설정합니다.
			forward.setPath("board/qnaList.jsp");
			return forward; // AdminForntController.java로 리턴됩니다.
			
		}else {
			System.out.println("state=ajax");
			
			//위에서 request로 담았던 것을 JsonObject에 담습니다.
			JsonObject object = new JsonObject();
			object.addProperty("page", page);//{"page" : 변수 page의 값} 형식으로 저장
			object.addProperty("maxpage", maxpage);
			object.addProperty("startpage", startpage);
			object.addProperty("endpage", endpage);
			object.addProperty("listcount", listcount);
			object.addProperty("limit", limit);
			//JsonObject에 List 형식을 담을 수 있는 addProperty() 존재하지 않습니다.
			//void com.google.gson.JsonObject.add(String property, Jsonelemet value)
			//메서드를 통해서 저장합니다.
			//List형식을 JsonElement로 바꾸어 주어야 object에 저장할 수 있습니다.
			// List => JsonElement
			JsonElement je = new Gson().toJsonTree(list);
			System.out.println("qnalist="+je.toString());
			object.add("qnalist", je);
			
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append(object.toString());
			System.out.println(object.toString());
			return null;
		}//else end
		
	}//execute end
}//class end
