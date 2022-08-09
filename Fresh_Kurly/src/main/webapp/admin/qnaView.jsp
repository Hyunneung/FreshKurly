<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>문의하기 - view</title>
<jsp:include page="../mainpage/header.jsp"/>
<script src="js/view.js"></script>
<link rel="stylesheet" href="css/view.css">
</head>
<body>
<input type = "hidden" id = "loginid" value="${id}" name="loginid">
<div class="container">
   <table class="table">
      <tr>
         <th colspan="2">문의하기-view페이지</th>
      </tr>
      <tr>
         <td><div>글쓴이</div></td>
         <td><div>${qnadata.qna_name}</div></td>
      </tr>
      <tr>
         <td><div>제목</div></td>
         <td><c:out value="${qnadata.qna_subject}"/></td>
      </tr>
      <tr>
         <td><div>내용</div></td>
         <td style="padding-right: 0px">
            <textarea class="form-control" 
            		  rows="5" readOnly>${qnadata.qna_content}</textarea></td>
      </tr>
      
      <tr>
      	  <td colspan="2" class="center">
      	     <c:if test="${qnadata.qna_name == id || id  == 'admin' }">
      	     	<a href="QnaModifyView.ad?num=${qnadata.qna_num}">
      	     		<button class="btn btn-info">수정</button>
      	     	</a>
      	     	<%-- href의 주소를 #으로 설정합니다. --%>
      	     	<a href="#">
      	     		<button class="btn btn-danger" data-toggle="modal"
							data-target="#myModal">삭제</button>
      	     	</a>
      	     </c:if>
	      	     <a href="QnaList.ad">
	      	     		<button class="btn btn-warning">목록</button>
	      	     </a>
	      	     <a href="QnaReplyView.ad?num=${qnadata.qna_num}">
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
   					<form name="deleteForm" action="QnaDeleteAction.ad"   method="post">
   						 <input type="hidden" name="num" value="${param.num}" id="comment_qna_num">
                  		 <div class="form-group">
                    	 	 <label for="pwd">비밀번호</label>
                     		 <input type="password"
                           			class="form-control" placeholder="Enter password"
                           			name="qna_pass" id="qna_pass">                    
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