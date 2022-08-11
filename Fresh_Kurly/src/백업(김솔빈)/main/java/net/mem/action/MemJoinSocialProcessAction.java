package net.mem.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mem.db.Mem;
import net.mem.db.MemDAO;

public class MemJoinSocialProcessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 소셜 로그인 시 DB에 저장할 데이터 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8"); 
		
		HttpSession session = request.getSession();
		
		// 소셜로 받아온 id, name, email 저장
		String social = request.getParameter("social");
		String id = request.getParameter("socialId");
		String name = request.getParameter("socialName");
		String email = request.getParameter("socialEmail");
		
		Mem m = new Mem();
		m.setMember_id(id);
		m.setMember_name(name);
		m.setMember_email(email);
		System.out.println("소셜 로그인 정보 : " + id + "/" + name + "/" + email);
		
		response.setContentType("text/html;charset=utf-8");
		
		MemDAO dao = new MemDAO();
		int result = dao.insert(id, name, email); // 삽입 성공하면 1, 실패하면 0
		
		// 회원가입 실패
		if(result == 0) {
			System.out.println("회원 가입 실패입니다.");
			ActionForward forward = new ActionForward();
			forward.setRedirect(false); // dispatcher 포워딩
			request.setAttribute("message", "회원 가입 실패입니다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		
		// 회원가입 성공
		PrintWriter out = response.getWriter();
		out.println("<script>");
		
		if(result == 1) { // 삽입 성공
			// 회원가입 성공 시 해당 아이디로 자동 로그인 됨
			session.setAttribute("id", id);
			session.setAttribute("social", social); // 어떤 소셜로 로그인했는지 저장
			request.setAttribute("name", name);
			request.setAttribute("email", email);
			System.out.println("db저장성공");
			out.println("alert('회원 가입을 축하합니다.')");
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false); // dispatcher 포워딩
			forward.setPath("member/joinComplete.jsp");
			return forward;
			
		} else if (result == -1) { // catch(java.sql.SQLIntegrityConstraintViolationException e)에 에러 잡히면 result=-1 된다
			// ***** 이미 소셜 로그인 있으면 바로 로그인 되게 하기
			session.setAttribute("id", id);
			session.setAttribute("social", social); // 어떤 소셜로 로그인했는지 저장
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("http://localhost:8088/Fresh_Kurly/"); //초기화면으로 이동
			return forward;
		}
		out.println("</script>");
		out.close();
		return null;
	}
}
