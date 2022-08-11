package my.mypage.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mem.db.Mem;
import net.mem.db.MemDAO;

public class ProfileCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setAttribute("myPage", "profileUpdate");
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String pass = request.getParameter("pass");
		MemDAO dao = new MemDAO();
		int result = dao.isId(id, pass); // id, pass 맞는지 확인 - id, pass 일치하는 경우 1, 아닌 경우 0
		System.out.println("결과는 " + result + "(id, pass 일치하는 경우 1, 아닌 경우 0 / DB에 해당 id가 없는 경우 -1)");
		
		if(id != null && !id.equals("")) {
			// 비밀번호 일치 여부 확인
			if(result == 1) { // 비밀번호 일치
				Mem m = dao.selectInfo(id);
				request.setAttribute("member", m);
			
				forward.setRedirect(false);
				forward.setPath("mypage/myPage.jsp");
				return forward;
			} else { // 비밀번호 틀림
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('비밀번호가 일치하지 않습니다.');");
				out.println("history.back()");
				out.println("</script>");
				out.close();
				return null;
			}
		} else { // 세션의 속성 "id"가 존재하지 않는 경우 - 세션이 만료된 경우 (로그인 하고나서 시간 너무 많이 지났거나...)
			session.invalidate();
			forward.setRedirect(true);
			forward.setPath("login.jsp");
			return null;
		}
	}

}
