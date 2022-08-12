package admin.adminpage.action; 

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import board.boardpage.db.CommentDAO;

public class CommentList implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServerException, IOException {
		CommentDAO dao = new CommentDAO();
		
		int comment_qna_number = Integer.parseInt(request.getParameter("comment_qna_number"));
		System.out.println(comment_qna_number);
		int state = Integer.parseInt(request.getParameter("state"));
		int listcount=dao.getListCount(comment_qna_number);
		
		JsonObject object = new JsonObject();
		JsonArray jarray = dao.getCommentList(comment_qna_number, state);
		object.addProperty("listcount", listcount);
		
		JsonElement je = new Gson().toJsonTree(jarray);
		object.add("qnalist", je);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(object.toString());
		System.out.println(object.toString());
		return null;
	}
}
