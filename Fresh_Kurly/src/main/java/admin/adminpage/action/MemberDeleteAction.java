package admin.adminpage.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.adminpage.db.MemberDAO;


public class MemberDeleteAction implements Action {
	
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response)throws ServletException, IOException{
		MemberDAO mdao = new MemberDAO();
		String id = request.getParameter("id");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = mdao.delete(id);
		if(result == 1) {
			out.println("<script>");
			out.println("alert('���� �����Դϴ�.')");
			out.println("location.href='MemberList.ad'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('ȸ�� ���� �Դϴ�.')");
			out.println("history.back();");
			out.println("</script>");
		}
		out.close();
		return null;
		
	}
}