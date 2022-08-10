package net.mem.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mem.db.Mem;
import net.mem.db.MemDAO;

public class MemJoinProcessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 회원가입시 DB에 저장할 데이터 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8"); 
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String jumin = request.getParameter("jumin1") + "-" + request.getParameter("jumin2");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String post = request.getParameter("post");
		String address = request.getParameter("address");
		String gender = request.getParameter("gender");
		
		Mem m = new Mem();
		m.setMember_id(id);
		m.setMember_pass(pass);
		m.setMember_name(name);
		m.setMember_email(email);
		m.setMember_phone(phone);
		m.setMember_post(post);
		m.setMember_address(address);
		m.setMember_gender(gender);
		m.setMember_jumin(jumin);
		
		response.setContentType("text/html;charset=utf-8");
		
		MemDAO dao = new MemDAO();
		int result = dao.insert(m); // 삽입 성공하면 1, 실패하면 0

		//테스트용
		System.out.println("가입상태: result = " + result + "(성공하면 1, 실패하면 0)"); // test
		
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
		if(result == 1) { // 회원가입(데이터 삽입) 성공
			
			// 회원가입완료 페이지(joinComplete.jsp)에 보여줄 데이터들
			HttpSession session = request.getSession();
			session.setAttribute("id", id); // 회원가입 성공 시 해당 아이디로 자동 로그인 됨
			request.setAttribute("pass", pass);
			request.setAttribute("name", name);
			request.setAttribute("email", email);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false); // dispatcher 포워딩
			forward.setPath("member/joinComplete.jsp");
			
			out.println("alert('회원 가입을 축하합니다.')");
			return forward;
		} else if (result == -1) { // catch(java.sql.SQLIntegrityConstraintViolationException e)에 에러 잡히면 result=-1 된다
			out.println("alert('아이디가 중복되었습니다. 다시 입력하세요.');");
			// 새로고침되어 이전에 입력한 데이터가 나타나지 않습니다.
			// out.println("location.href='join.net'");
			out.println("history.back()"); // 비밀번호를 제외한 다른 데이터는 유지되어 있습니다.
		}
		out.println("</script>");
		out.close();
		return null;
	}
}
