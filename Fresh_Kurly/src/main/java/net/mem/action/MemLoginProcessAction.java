package net.mem.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mem.db.MemDAO;

public class MemLoginProcessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		MemDAO mdao = new MemDAO();
		int result = mdao.isId(id, pass); // id, pass 맞는지 확인 - id, pass 일치하는 경우 1, 아닌 경우 0 (DB에 해당 id가 없는 경우 -1)
		System.out.println("결과는 " + result + "(id, pass 일치하는 경우 1, 아닌 경우 0 / DB에 해당 id가 없는 경우 -1)");

		// 로그인 성공
		if (result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);

			String IDStore = request.getParameter("remember"); // ID기억하기
			Cookie cookie = new Cookie("id", id);

			// ID기억하기 체크한 경우
			if (IDStore != null && IDStore.equals("store")) {
				cookie.setMaxAge(2 * 60); // cookie.setMaxAge(60*60*24); - 쿠키 유효시간을 24시간으로 설정
				response.addCookie(cookie); // 클라이언트로 쿠키값 전송
			} else {
				cookie.setMaxAge(0); // ID기억하기 체크하지 않으면 쿠키 저장하지 않음
				response.addCookie(cookie);
			}

			forward.setRedirect(true);
			forward.setPath("mainPage.main"); // 임시 메인페이지로 이동 // MainPage.main
			return forward;
		} else { // 로그인 실패
			String message = "비밀번호가 일치하지 않습니다.";
			if (result == -1) {
				message = "아이디가 존재하지 않습니다.";
			}
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('" + message + "');");
			out.println("location.href='login.net';"); // 로그인 페이지로 이동
			out.println("</script>");
			out.close();
			return null;
		}
	}
}
