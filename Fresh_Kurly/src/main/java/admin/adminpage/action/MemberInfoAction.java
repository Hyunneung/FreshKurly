package admin.adminpage.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.adminpage.db.Member;
import admin.adminpage.db.MemberDAO;

public class MemberInfoAction implements Action {
   public ActionForward execute(HttpServletRequest request,
         HttpServletResponse response)throws ServletException, IOException{
      ActionForward forward = new ActionForward();
      String id = request.getParameter("id");
      MemberDAO mdao = new MemberDAO();
      Member m = mdao.member_info(id);
      
      if(m==null) {
         forward.setPath("error/error.jsp");
         forward.setRedirect(false);
         request.setAttribute("message","아이디에 해당하는 정보가 없습니다.");
         return forward;
      }
      
      forward.setPath("admin/memberInfo.jsp");
      forward.setRedirect(false);
      request.setAttribute("memberinfo", m);
      return forward;
   }
}