package my.mypage.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.my") // 모든 .my브라우저 관리
public class MyPageFrontController extends HttpServlet {
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
		
		Action action = null;
		ActionForward forward = null;
		
		// 각각 .my 페이지 관리
		switch(command) {
		/* 삭제삭제삭제
		   case "/myPage.my" :
			action = new OrderInfoAction(); 
			break;*/
			
		// 주문내역	
		case "/myOrder.my" : // 마이페이지의 기본페이지는 주문내역 페이지
			action = new OrderInfoAction();
			break;
		// 장바구니	
		case "/myCart.my" :
			action = new CartAction();
			break;
		case "/myCartItemMinus.my" : // 장바구니 - 아이템 수량 1 감소
			action = new CartItemMinusAction();
			break;	
		case "/myCartItemPlus.my" : // 장바구니 - 아이템 수량 1 증가
			action = new CartItemPlusAction();
			break;
		case "/myCartItemDelete.my" : // 장바구니 - 아이템 수량 1 증가
			action = new CartItemDeleteAction();
			break;	
		// 찜한상품
		case "/myWish.my" :
			action = new WishAction();
			break;
		// 상품문의
		case "/myQna.my" :
			action = new QnaAction();
			break;
		// 개인정보 수정
		case "/myProfile.my" :
			action = new ProfileAction();
			break;
		// 개인정보 수정 - 비번 확인
		case "/myProfileCheck.my" :
			action = new ProfileCheckAction();
			break;
		// 개인정보 수정 - 수정 완료	
		case "/myProfileUpdate.my" :
			action = new ProfileUpdateAction();
			break;	
		}
		
		// 포워딩 - forward는 포워딩 주소(path), redirect/forward 방식 가진다
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
