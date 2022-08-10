package my.mypage.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my.mypage.db.Qna;
import my.mypage.db.QnaDAO;

public class QnaAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		HttpSession session= request.getSession();
		String id = (String)session.getAttribute("id");
		request.setAttribute("myPage", "qna");
		
		
		QnaDAO dao = new QnaDAO();
		int listcount = 0; // qna에 담긴 문의내역 수
		List<Qna> list = null; // qna에 담긴 문의내역 리스트
		
		listcount =dao.getQnaListCount(id);
		list = dao.getQnaList(id);
		request.setAttribute("listcount", listcount); // qna에 담긴 문의내역 수
		request.setAttribute("qnalist", list); // qna를 qnalist라는 속성명으로 저장
		
		
		
		
		forward.setPath("mypage/myPage.jsp");
		forward.setRedirect(false); // 주소 변경 없이 보낸다
		return forward;
	}

}
