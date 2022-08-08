package net.mem.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mem.db.MemDAO;

public class MemEmailCheckAction2 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemDAO dao = new MemDAO();
		String email = request.getParameter("email"); // 이메일 폼 인풋 히든의 값 가져오기
		int result = dao.overlapEmail(email); // DB에 email 있으면 1, 없으면 0
		response.getWriter().print(result);
		System.out.println("result = " + result + "(DB에 Email 있으면 1, 없으면 0)");
		
		
		return null;
	}

}
