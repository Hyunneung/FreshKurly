package board.boardpage.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.boardpage.db.QnaDAO;

public class QnaModifyAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		QnaDAO qnadao = new QnaDAO();
		QnaBean qnadata = new QnaBean();
		ActionForward forward = new ActionForward();

		boolean result = false;

		int num = Integer.parseInt(request.getParameter("qna_number"));
		String pass = request.getParameter("qna_pass");

		// 글쓴이 인지 확인하기 위해 저장된 비밀번호와 입력한 비밀번호를 비교합니다.
		boolean usercheck = qnadao.isqnaWriter(num, pass);
		// 비밀번호가 다른 경우
		if (usercheck == false) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다.')");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}

		// 비밀번호가 일치하는 경우 수정 내용을 설정합니다.
		// qnaBean 객체에 글 등록 폼에서 입력 받은 정보들을 저장합니다.
		qnadata.setQna_number(num);
		qnadata.setQna_subject(request.getParameter("qna_subject"));
		qnadata.setQna_content(request.getParameter("qna_content"));

		// DAO에서 수정 메서드 호출하여 수정합니다.
		result = qnadao.qnaModify(qnadata);

		// 수정에 실패한 경우
		if (result == false) {
			System.out.println("게시물 수정 실패");
			forward.setRedirect(false);
			request.setAttribute("message", "게시판 수정이 되지 않았습니다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		// 수정 성공의 경우
		System.out.println("게시판 수정 완료");

		forward.setRedirect(true);
		// 수정한 글 내용을 보여주기 위해 글 내용 보기 페이지로 이동하기위해 경로를 설정합니다.
		forward.setPath("QnaDetailAction.bo?num=" + qnadata.getQna_number());
		return forward;
	}
}
