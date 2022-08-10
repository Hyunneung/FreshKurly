package net.mem.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mem.db.MemDAO;

public class WithdrawProccess_checkPW implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ActionForward forward = new ActionForward();

		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

		MemDAO dao = new MemDAO();
		int result = dao.isId(id, pass);

		// 비밀번호 일치 여부 확인
		if (result == 1) { // 비밀번호 일치
			response.setContentType("text/html;charset=utf-8");
			//세션에 삭제할 아이디 값 저장
			HttpSession session = request.getSession();
			session.setAttribute("withdraw_id", id);
			forward.setRedirect(false);
			forward.setPath("/WithdrawProccess_delete.net");
			return forward;
		} else {
			return null;
		}
	}
}
