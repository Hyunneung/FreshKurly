package net.mem.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mem.db.MemDAO;

public class MemIdCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MemDAO dao = new MemDAO();
		String id = request.getParameter("id"); 
		int result = dao.overlapId(id); // DB에 ID 있으면 1, 없으면 0
		response.getWriter().print(result);
		System.out.println("result = " + result + "(DB에 ID 있으면 1, 없으면 0)");
		return null;
	}
}
