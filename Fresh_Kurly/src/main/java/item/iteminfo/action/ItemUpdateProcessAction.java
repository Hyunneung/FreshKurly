package item.iteminfo.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import item.iteminfo.db.Item;
import item.iteminfo.db.ItemDAO;



public class ItemUpdateProcessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String realFolder = "";
		
		//webapp아래에 꼭 폴더 생성하세요.
		String saveFolder = "itemupload";
		
		int fileSize = 5 * 1024 * 1024; // 업로드할 파일의 최대 사이즈 5MB
		
		// 실제 경로를 저장합니다.
		//ServletContext sc = request.getServletContext();
		//realFolder = sc.getRealPath(saveFolder);
		realFolder = "C:\\Users\\jhta\\git\\Fresh_Kurly\\Fresh_Kurly\\src\\main\\webapp\\"
							+ saveFolder;
		System.out.println("realFolder=[ " + realFolder);
		try {
			MultipartRequest multi = new MultipartRequest(
							request,
							realFolder,
							fileSize,
							"utf-8",
							new DefaultFileRenamePolicy());
			
			int item_id = Integer.parseInt(multi.getParameter("item_id"));
			String item_name = multi.getParameter("item_name");
			int item_price = Integer.parseInt(multi.getParameter("item_price"));
			String item_image = multi.getFilesystemName("item_image");
			String item_deliver = multi.getParameter("item_deliver");
			String item_seller = multi.getParameter("item_seller");
			String item_package = multi.getParameter("item_package");
			String item_expiredate = multi.getParameter("item_expiredate");
			String item_unit = multi.getParameter("item_unit");
			String item_weight = multi.getParameter("item_weight");
			String item_category = multi.getParameter("item_category");
			String item_intro = multi.getParameter("item_intro");
			int item_stock = Integer.parseInt(multi.getParameter("item_stock"));
					
			
			
			Item i = new Item();
			i.setItem_id(item_id); i.setItem_name(item_name); i.setItem_price(item_price);
			i.setItem_image(item_image); i.setItem_deliver(item_deliver);
			i.setItem_seller(item_seller); i.setItem_package(item_package);
			i.setItem_expiredate(item_expiredate); i.setItem_unit(item_unit);
			i.setItem_weight(item_weight); i.setItem_category(item_category);
			i.setItem_intro(item_intro); i.setItem_stock(item_stock);
			
			ItemDAO mdao = new ItemDAO();
			int result = mdao.update(i);
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			// 삽입이 된 경우
			if (result == 1) {
				out.println("alert('수정되었습니다,');");
				out.println("location.href='itemList.item';");
			} else {
				out.println("alert('상품 수정에 실패했습니다.');");
				out.println("history.back()"); // 비밀번호를 제외한 다른 데이터는 유지 되어 있습니다.
			}
			out.println("</script>");
			out.close();
			return null;
			
		} catch (IOException e) {
			ActionForward forward = new ActionForward();
			forward.setPath("error/error.jsp");
			request.setAttribute("message", "프로필 사진 업로드 실패입니다.");
			forward.setRedirect(false);
			return forward;
		} // catch end
	}

}
