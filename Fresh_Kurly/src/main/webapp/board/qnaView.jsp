<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>문의하기 게시판</title>
<jsp:include page="../mainpage/header.jsp"/>
<script src="assets/js/board/qnaview.js"></script>
<script src="assets/js/board/popper.js"></script>
<script src="assets/js/board/bootstrap.js"></script>
<link rel="stylesheet" href="assets/css/view.css">
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
      	     <c:if test="${qnadata.qna_name == id }">
      	     	<a href="QnaModifyView.bo?num=${qnadata.qna_number}">
      	     		<button class="btn btn-info">수정</button>
      	     	</a>
      	     	<%-- href의 주소를 #으로 설정합니다. --%>
      	     	<a href="#">
      	     		<button class="btn btn-danger" data-toggle="modal"
							data-target="#myModal">삭제</button>
      	     	</a>
      	     </c:if>
	      	     <a href="QnaList.bo">
	      	     		<button class="btn btn-warning">목록</button>
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
   					<form name="deleteForm" action="QnaDeleteAction.bo"   method="post">
   						<%--http://localhost:8088/Qna.QnaDetailAction.bo?num=22
   								주소를 보면 num을 파라미터로 넘기고 있습니다.
   								이 값을 가져와서 ${param.num}를 사용
   								또는 ${qnadata.qna_number}
   						 --%>
   						 <input type="hidden" name="num" value="${param.num}" id="comment_qna_number">
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
	<%-- id="myModal" end --%>
	
	<div class="comment-area">
		<div class="comment-head">
			<h3 class="comment-count">
				댓글 <sup id="count"></sup><%-- superscript(윗첨자) --%>
			</h3>
			<div class="comment-order">
				<ul class="comment-order-list">
				</ul>
			</div>
		</div><!-- comment-head end -->
		<ul class="comment-list">
		</ul>
		<div class="commnet-write">
			<div class="comment-write-area">
				<b class="comment-write-area-name">${id }</b><span
					class="comment-write-area-count">0/200</span>
				<textarea placeholder="댓글을 남겨보세요" rows="1"
					class="comment-write-area-text" maxLength="200"></textarea>
					
			</div>
			<div class="register-box">
				<div class="button btn-cancel">취소</div><%-- 댓글의 취소는 display:none, 등록만 보이도록 합니다. --%>
				<div class="button btn-register" >등록</div>
			</div>
		</div><%-- commnet-write end --%>
	</div><%-- comment-area end --%>
</div><%-- class="container" end --%>
</body>
</html>