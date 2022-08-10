package my.mypage.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mem.db.MemDAO;

public class ProfileUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8"); // post 방식 한글처리
		
		// 정보수정 폼에서 수정한 값을 request에 저장
		String id = request.getParameter("id"); // where로 찾을 id
		String pass = request.getParameter("pass");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		
		int result = -1;
		
		if( !pass.equals("") ) { // 비밀번호도 수정 했을 때
			MemDAO dao = new MemDAO ();
			result = dao.profileUpdate(id, pass, email, phone, postcode, address); // 수정 잘 되면 1, 아니면 0
		} else { // 비밀번호도 수정 안 했을 때
			MemDAO dao = new MemDAO ();
			result = dao.profileUpdate(id, email, phone, postcode, address); // 수정 잘 되면 1, 아니면 0
		}
		
		// 회원정보 수정 실패
		if (result == 0) { 
			System.out.println("회원 정보 수정 실패");
			ActionForward forward = new ActionForward();
			forward.setRedirect(false); // dispatcher
			request.setAttribute("message", "회원정보가 수정 오류입니다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		
		// 회원정보 수정 성공
		System.out.println("회원 정보 수정 성공=>" + result + "수정 잘 되면 1, 아니면 0, 이상하면 -1");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('회원정보가 수정되었습니다.');");
		out.println("history.go(-2)");
		//out.println("location.href='myPage.my';");
		out.println("</script>");
		out.close();
		return null;
	}

}
