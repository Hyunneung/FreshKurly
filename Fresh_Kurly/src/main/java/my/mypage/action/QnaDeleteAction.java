package my.mypage.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my.mypage.db.QnaDAO;

public class QnaDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("id");
		int qna_number = Integer.parseInt( request.getParameter("qna_number") );
		
		QnaDAO dao = new QnaDAO();
		int result = dao.qnaDelete(member_id, qna_number); // 문의 삭제 성공하면 1, 실패하면 0
		
		response.getWriter().print(result);
		System.out.println("result = " + result + "(DB에 문의 삭제 성공하면 1, 실패하면 0)");
		return null;
	}

}
