package my.mypage.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.mypage.db.QnaDAO;

public class QnaDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		boolean result = false;
		boolean usercheck = false;
		
		int qna_number = Integer.parseInt(request.getParameter("qna_number")); // 글번호
		String qna_pass = request.getParameter("qna_pass"); // 글번호
		QnaDAO dao = new QnaDAO();
		
		// 글 삭제 명령을 요청한 사용자가 글을 작성한 사용자인지 판단하기 위해 입력한 비밀번호와 저장된 비밀번호를 비교하여 일치하면 삭제
		usercheck = dao.isQnaWriter(qna_number, qna_pass); // 비밀번호 맞으면 true, 틀리면 false
		 
		// 비밀번호 일치하지 않는 경우
		if(usercheck == false) {
			return null;
		}
		
		// 비밀번호 일치하는 경우 삭제 처리
		result = dao.qnaDelete(qna_number); // 문의 삭제 성공하면 true, 실패하면 false
		
		// 삭제 처리 성공한 경우 - 글 목록 보기 요청을 전송합니다.
		System.out.println("글 삭제 성공");
		System.out.println("result = " + result + " / qna_number = " + qna_number + " / qna_pass = " + qna_pass);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result); // ajax로 넘겨줄 데이터
		out.close();
		return null;
	}
}