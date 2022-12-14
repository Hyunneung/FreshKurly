package board.boardpage.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("*.bo")
public class BoardFrontController extends javax.servlet.http.HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String RequestURI = request.getRequestURI();
		System.out.println("RequestURI = " + RequestURI);
		
		// getContextPath() : 컨텍스트 경로가 반환됩니다.
		String contextPath = request.getContextPath();
		System.out.println("contextPath = " + contextPath);
		
		// RequestURI에서 컨텍스트 영로 길이 값이 인텍스 위치의 문자부터
		// 마지막 위치 문자까지 추출합니다.
		String command = RequestURI.substring(contextPath.length());
		System.out.println("command = " + command);
		
		//초기화
		ActionForward forward = null;
		Action action = null;
		
		switch (command) {
			case "/NoticeList.bo":
				action = new NoticeListAction();
				break;
			case "/NoticeDetailAction.bo":
				action = new NoticeDetailAction();
				break;
			case "/QnaList.bo":
				action = new QnaListAction();
				break;
			case "/QnaWrite.bo":
				action = new QnaWriteAction();
				break;
			case "/QnaAddAction.bo":
				action = new QnaAddAction();
				break;
			case "/QnaDetailAction.bo":
				action = new QnaDetailAction();
				break;
			case "/QnaModifyView.bo":
				action = new QnaModifyView();
				break;
			case "/QnaModifyAction.bo":
				action = new QnaModifyAction();
				break;
			case "/QnaDeleteAction.bo":
				action = new QnaDeleteAction();
				break;	
			case "/CommentList.bo":
				action = new CommentList();
				break;
			case "/CommentDelete.bo":
				action = new CommentDelete();
				break;
			case "/CommentUpdate.bo":
				action = new CommentUpdate();
				break;
			case "/CommentReply.bo":
				action = new board.boardpage.action.CommentReply();
				break;		
		}// switch end
		
		forward = action.execute(request, response);
		
		if (forward != null) {
			if (forward.isRedirect()) { // 리다이렉트 됩니다.
				response.sendRedirect(forward.getPath());
			} else {// 포워딩 됩니다.
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}//doProcess() end
	
	// doProcess(requset, response)메서드를 구현하여 요청이 Get방식이든
	// POST방식으로 전송되어 오든 같은 메서드에서 요청을 처리할 수 있도록 하였습니다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doProcess(request, response);
	}
	
}
