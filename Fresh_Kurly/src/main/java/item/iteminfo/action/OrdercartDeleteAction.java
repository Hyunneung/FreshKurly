package item.iteminfo.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import item.iteminfo.db.Item;
import item.iteminfo.db.ItemDAO;
import my.mypage.db.OrderInfo;

public class OrdercartDeleteAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      HttpSession session = request.getSession();
      String member_id = (String) session.getAttribute("id");

      ItemDAO dao = new ItemDAO();
      /* List<OrderInfo> list = null; */
      
      int list = dao.orderinsert(member_id);
      
      if(list == 0) { 
          System.out.println("주문내역 전송 실패입니다.");
       }
      
      
      int result = dao.cartItemDelete(member_id);

      
       
       

      if (result == 0) {
         System.out.println("장바구니 삭제 실패입니다.");
      } else {
         response.setContentType("text/html;charset=utf-8");
         PrintWriter out = response.getWriter();

         out.println("<script>");
         out.println("location.href='myOrder.my';");
         out.print("</script>");
         out.close();

      }
      return null;
   }

}