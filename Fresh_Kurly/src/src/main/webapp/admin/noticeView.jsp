<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>MVC 게시판 - view</title>
<jsp:include page="../mainpage/header.jsp"/>
<script src="js/view.js"></script>
<link rel="stylesheet" href="css/view.css">
</head>
<body>
<input type = "hidden" id = "loginid" value="${id}" name="loginid">
<div class="container">
   <table class="table">
      <tr>
         <th colspan="2">MVC 게시판-view페이지</th>
      </tr>
      <tr>
         <td><div>글쓴이</div></td>
         <td><div>${noticedata.notice_name}</div></td>
      </tr>
      <tr>
         <td><div>제목</div></td>
         <td><c:out value="${noticedata.notice_subject}"/></td>
      </tr>
      <tr>
         <td><div>내용</div></td>
         <td style="padding-right: 0px">
            <textarea class="form-control" 
            		  rows="5" readOnly>${noticedata.notice_content}</textarea></td>
      </tr>
      
     
      <tr>
      	  <td colspan="2" class="center">
      	     <c:if test="${noticedata.notice_name == id || id  == 'admin' }">
      	     	<a href="NoticeModifyView.ad?num=${noticedata.notice_num}">
      	     		<button class="btn btn-info">수정</button>
      	     	</a>
      	     	<%-- href의 주소를 #으로 설정합니다. --%>
      	     	<a href="#">
      	     		<button class="btn btn-danger" data-toggle="modal"
							data-target="#myModal">삭제</button>
      	     	</a>
      	     </c:if>
	      	     <a href="BoardList.bo">
	      	     		<button class="btn btn-warning">목록</button>
	      	     </a>
	      	     <a href="BoardReplyView.bo?num=${noticedata.notice_num}">
	                <button class="btn btn-success">답변</button>
	             </a>
		 	</td>
	   </tr>	
   </table>
   <%-- 게시판 view end --%>
   
   <%-- modal 시작 --%>
   <div class="modal" id="myModal">
   		<div class="modal-dialog">
   			<div class="modal-content">
   				<%-- Modal body --%>
   				<div class="modal-body">
   					<form name="deleteForm" action="BoardDeleteAction.bo"   method="post">
   						<%--http://localhost:8088/Board.BoardDetailAction.bo?num=22
   								주소를 보면 num을 파라미터로 넘기고 있습니다.
   								이 값을 가져와서 ${param.num}를 사용
   								또는 ${noticedata.notice_num}
   						 --%>
   						 <input type="hidden" name="num" value="${param.num}" id="comment_notice_num">
                  		 <div class="form-group">
                    	 	 <label for="pwd">비밀번호</label>
                     		 <input type="password"
                           			class="form-control" placeholder="Enter password"
                           			name="notice_pass" id="notice_pass">                    
                  		</div>
                  		<button type="submit" class="btn btn-primary">전송</button>
                  		<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
   					</form>
   				</div>
   			</div>
   		</div>
   </div>
</div>
</body>
</html>