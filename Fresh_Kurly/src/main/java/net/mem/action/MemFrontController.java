package net.mem.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.net") // 모든 .net 브라우저 관리
public class MemFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// doGet(), doPost() 처리
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// 주소 확인
		String RequestURI = request.getRequestURI();
		System.out.println("RequestURI = " + RequestURI); // URI 출력
		String contextPath = request.getContextPath();
		System.out.println("contextPath = " + contextPath); // 컨텍스트 경로 출력
		String command = RequestURI.substring(contextPath.length());
		System.out.println("command = " + command); // RequestURI에서 컨텍스트 경로 길이 값의 인텍스 위치의 문자부터 마지막 위치 문자까지 출력
		
		// 초기화
		Action action = null;
		ActionForward forward = null;
		
		// 각각 .net 페이지 관리
		switch(command) {
		case "/joinProcess.net" :
			action = new MemJoinProcessAction();
			break;
		case "/login.net" :
			action = new MemLoginAction();
			break;
		case "/loginProcess.net" :
			action = new MemLoginProcessAction();
			break;	
		case "/join.net" :
			action = new MemJoinAction();
			break;
		case "/idcheck.net" :
			action = new MemIdCheckAction();
			break;
		case "/phonecheck.net" :
			action = new MemPhoneCheckAction();
			break;
		case "/joinSocialProcess.net" :
			action = new MemJoinSocialProcessAction();
			break;
		case "/emailcheck.net" :
			action = new MemEmailCheckAction();
			break;
		case "/emailcheck2.net" : // 이메일 중복검사
			action = new MemEmailCheckAction2();
			break;	
		case "/logout.net" :
			action = new MemLogoutAction();
			break;
		case "/idFind.net":
			action = new MemIdFindAction();
			break;
		case "/idFindProcess.net":
			action = new MemIdFindProccess();
			break;
		case "/passwordFind.net":
			action = new MemPasswordFindAction();
			break;
		case "/passwordFindProcess.net":
			action = new MemPasswordFindProccess();
			break;
		case "/member/changePassProccess.net":
			action = new MemChangePassProccess();
			break;
		case "/Withdraw.net":
			action = new gotoWithdrawpage();
			break;
		case "/WithdrawProccess_checkPW.net":
			action = new WithdrawProccess_checkPW();
			break;
		case "/WithdrawProccess_delete.net":
			action = new WithdrawProccess_delete();
			break;
		}
		
		// 포워딩 - forward는 포워딩 주소(path), 포워딩 방식(redirect) 가진다
		forward = action.execute(request, response); 
		if(forward != null) {
			if(forward.isRedirect()) { // redirect
				response.sendRedirect(forward.getPath()); // forward.getPath() - 주소
			} else { // dispatcher 
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath()); // forward.getPath() - 주소
				dispatcher.forward(request, response);
			}
		}
	} // doProcess() end
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8"); // post 방식 한글처리
		doProcess(request, response);
	}
}
