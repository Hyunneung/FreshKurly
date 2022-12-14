package board.boardpage.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.boardpage.db.Comment;
import board.boardpage.db.CommentDAO;


public class CommentUpdate implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		CommentDAO dao = new CommentDAO();
		Comment co = new Comment();
		co.setContent(request.getParameter("content"));
		System.out.println("content=" + co.getContent());
		
		co.setNum(Integer.parseInt(request.getParameter("num")));

		int ok = dao.commentsUpdate(co);
		response.getWriter().print(ok);
		
		
		return null;
	}
}
