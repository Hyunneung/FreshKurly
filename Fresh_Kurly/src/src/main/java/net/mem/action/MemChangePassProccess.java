package net.mem.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;

import net.mem.db.MemDAO;

public class MemChangePassProccess implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // post 방식 한글처리
		
		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("id_changePW");
		String new_password = request.getParameter("new_password");
		
		
		MemDAO dao = new MemDAO();
		int result = dao.changePW(id, new_password); //수정 성공 =1 아니면 0
		
		response.setContentType("text/html;charset=utf-8");
		JsonObject jobj = new JsonObject();
		//비밀번호 수정 실패
		if (result ==0 ) {
			System.out.println("Servlet - 비밀번호 수정 실패");
			jobj.addProperty("message", "비밀번호 수정 실패");
			response.getWriter().append(jobj.toString());
		} else if (result == 1) {
			System.out.println("Servlet - 비밀번호 수정 성공");
			jobj.addProperty("message", "비밀번호 수정 성공");
			response.getWriter().append(jobj.toString());
		}
		return null;
	}
}
