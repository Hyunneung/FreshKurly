package net.mem.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mem.db.MemDAO;

public class MemIdFindProccess implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemDAO dao = new MemDAO();
		int result = dao.isEmail(request.getParameter("email"));
		response.getWriter().append(Integer.toString(result));
		System.out.println(result);
		return null;
	}

}
