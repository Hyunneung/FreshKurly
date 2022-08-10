package net.mem.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mem.db.MemDAO;

public class WithdrawProccess_delete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MemDAO dao = new MemDAO();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("withdraw_id");
		int delete_result = dao.deleteUser(id); //아이디를 삭제하는 작업
		
		if(delete_result ==1) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('계정이 삭제되었습니다.');");
			out.println("location.href='logout.net'");
			out.println("</script>");
			out.close();
		} else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 실패입니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		return null;
	}
}
