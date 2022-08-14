package item.iteminfo.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my.mypage.db.Cart;
import my.mypage.db.CartDAO;
import net.mem.db.Mem;
import net.mem.db.MemDAO;

public class ItemOrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
	

		if(id == null) { // 로그인 후 이용 가능
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인하고 해주세요');");
			out.println("location.href='member/login.jsp'");
			out.println("</script>");
			out.close();
			return null;
		} else {
			// 장바구니 페이지에 보여줄 아이템 정보
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
			request.setAttribute("totalAll", totalAll); // 장바구니에 담긴 모든 상품 총액
			MemDAO mdao = new MemDAO();
			Mem m = mdao.selectInfo(id);
			request.setAttribute("m", m);
			request.setAttribute("member_phone1", m.getMember_phone().substring(3, 7));
			request.setAttribute("member_phone2", m.getMember_phone().substring(7, 11));
			
			// 배송비 - 30000원 이상 무료배송
			int delivery = 3000;
			if (totalAll >= 30000) {
				delivery = 0;
			}
			request.setAttribute("delivery", delivery); // 배송비
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("item/item_order_Form.jsp");
			return forward;
		}
		
		
	}

}



