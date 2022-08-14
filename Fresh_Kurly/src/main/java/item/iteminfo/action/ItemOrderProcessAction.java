package item.iteminfo.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my.mypage.db.Cart;
import my.mypage.db.CartDAO;
import net.mem.db.Mem;
import net.mem.db.MemDAO;

public class ItemOrderProcessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		String src = request.getParameter("receiverName");
		System.out.println(src); // 값이 안 불러와 짐
		
		
		CartDAO dao = new CartDAO();
		int listcount = 0; // 카트에 담긴 제품 리스트
		List<Cart> list = null; // 카트에 담긴 리스트
		listcount =dao.getCartListCount(id);
		list = dao.getCartList(id);
		request.setAttribute("listcount", listcount); // 카트에 담긴 각 제품 수
		request.setAttribute("cartlist", list); // 카트리스트를 cartlist라는 속성명으로 저장
		System.out.println(listcount);
		// 장바구니에 담긴 모든 상품 총액
		int totalAll = dao.getTotalAll(id);
		// 장바구니에 담긴 모든 상품 총액
		
		
		MemDAO mdao = new MemDAO();
		Mem m = mdao.selectInfo(id);
		request.setAttribute("m", m);
		String hp1 = m.getMember_phone().substring(3, 7);
		String hp2 = m.getMember_phone().substring(7, 11);
		String hp = "010-" + hp1 + "-" + hp2;
		System.out.println(hp);
		request.setAttribute("hp", hp);
		
		// 배송비 - 30000원 이상 무료배송
		int delivery = 3000;
		if (totalAll >= 30000) {
			delivery = 0;
		}
		// 배송비
		int ordertotal = totalAll + delivery;
		request.setAttribute("ordertotal", ordertotal);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("item/paymentGateway.jsp");
		return forward;
	}

}
