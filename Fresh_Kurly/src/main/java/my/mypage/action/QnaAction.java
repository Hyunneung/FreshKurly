package my.mypage.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my.mypage.db.QnaBean;
import my.mypage.db.QnaDAO;

public class QnaAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		HttpSession session= request.getSession();
		String id = (String)session.getAttribute("id");
		request.setAttribute("myPage", "qna");
		
		// 로그인 성공시 파라미터 page가 없기 때문에 초기값 성정
		int page = 1; // 보여줄 page
		int limit = 10; // 한 페이지에 보여줄 게시판 목록의 수
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		if(request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
		}
		
		QnaDAO dao = new QnaDAO();
		int listcount = dao.getQnaListCount(id); // qna에 담긴 문의내역 수
		List<QnaBean> list = null; 
		list = dao.getQnaList(id, page, limit); // qna에 담긴 문의내역 리스트
		
		int maxpage = (listcount + limit - 1) / limit; // 총 페이지 수
		int startpage = ((page - 1) / 10) * 10 + 1; // 현재 페이지 그룹에서 맨 처음에 표시될 페이지 수
		int endpage = startpage + 10 - 1; // 현재 페이지 그룹에서 보여줄 마지막 페이지 수
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		
		request.setAttribute("listcount", listcount); // qna에 담긴 문의내역 수
		request.setAttribute("qnalist", list); // qna를 qnalist라는 속성명으로 저장
		request.setAttribute("page", page); // 현재 페이지 수 (즉, page는 현재 페이지)
		request.setAttribute("maxpage", maxpage); // 최대 페이지 수
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("listcount", listcount); // 총 글의 수
		request.setAttribute("limit", limit);
		
		System.out.println("listcount = " + listcount);
		System.out.println("page = " + page);
		
		// 이동할 경로 설정
		forward.setPath("mypage/myPage.jsp");
		forward.setRedirect(false); // 주소 변경 없이 보낸다
		return forward;
	}

}
