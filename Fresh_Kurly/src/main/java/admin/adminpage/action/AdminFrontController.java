package admin.adminpage.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.ad")
public class AdminFrontController extends javax.servlet.http.HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String RequestURI = request.getRequestURI();
		System.out.println("RequestURI = " + RequestURI);
		
		String contextPath = request.getContextPath();
		System.out.println("contextPath = " + contextPath);
		
		String command = RequestURI.substring(contextPath.length());
		System.out.println("command = " + command);
		
		//초기화
		ActionForward forward = null;
		Action action = null;
		
		switch (command) {
			case "/NoticeList.ad":
				action = new NoticeListAction();
				break;
			case "/NoticeWrite.ad":
				action = new NoticeWriteAction();
				break;
			case "/NoticeAddAction.ad":
				action = new NoticeAddAction();
				break;
			case "/NoticeDetailAction.ad":
				action = new NoticeDetailAction();
				break;
			case "/NoticeModifyView.ad":
				action = new NoticeModifyView();
				break;
			case "/NoticeModifyAction.ad":
				action = new NoticeModifyAction();
				break;
			case "/NoticeDeleteAction.ad":
				action = new NoticeDeleteAction();
				break;
			case "/QnaList.ad":
				action = new QnaListAction();
				break;
			case "/QnaDetailAction.ad":
				action = new QnaDetailAction();
				break;
			case "/QnaDeleteAction.ad":
				action = new QnaDeleteAction();
				break;
			case "/MemberList.ad":
		         action = new MemberSearchAction();
		         break;
			case "/MemberInfo.ad":
		         action = new MemberInfoAction();
		         break;
			case "/MemberDelete.ad":
		         action = new MemberDeleteAction();
		         break;
			case "/CommentList.ad":
				action = new CommentList();
				break;
			case "/CommentAdd.ad":
				action = new CommentAdd();
				break;
			case "/CommentDelete.ad":
				action = new CommentDelete();
				break;
			case "/CommentUpdate.ad":
				action = new CommentUpdate();
				break;
			case "/CommentReply.ad":
				action = new CommentReply();
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
