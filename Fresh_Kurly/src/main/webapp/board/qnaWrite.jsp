<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<jsp:include page="../mainpage/header.jsp"/>
 <script src="assets/js/board/qnawriteform.js"></script>
 <style>
 h1{font-size:1.5rem; text-align:center; color:#1a92b9}
 .container{width:60%}
 label{font-weight:bold}
 #upfile{display:none}
 img{width:20px}
 </style>
</head>
<body>
 <div class="container">
  <form action="QnaAddAction.bo" method="post" name="qnaform">
    <h1>문의하기-글쓰기 페이지</h1>
    
    <div class="form-group">
    	<label for="qna_name">글쓴이</label>
    	<input name="qna_name" id="qna_name" value="${id}" readOnly
    		   type="text"		 class="form-control"
    		   placeholder="Enter qna_name">
    		   
    </div>
    <div class="form-group">
      <label for="qna_pass">비밀번호</label>
      <input name="qna_pass" id="qna_pass"	type="password" maxlength="30" 
      		 class="form-control" placeholder="게시글에 대한 비밀번호를 입력하세요">
    </div>
    <div class="form-group">
      <label for="qna_subject">제목</label>
      <input name="qna_subject" id="qna_subject" 	type="text" maxlength="100" 
      		 class="form-control" placeholder="게시글에 대한 제목을 입력하세요">
    </div>
    <div class="form-group">
      <label for="qna_content">내용</label>
      <textarea name="qna_content" id="qna_content"		
      			rows="10" class="form-control" placeholder="게시글에 대한 내용을 입력하세요"></textarea>
    </div>
  <div class="form-group">
     <button type=submit class="btn btn-primary">등록</button>
     <button type=button class="btn btn-danger" onClick="history.go(-1)">취소</button>
  </div>
  </form>
 </div>
</body>
</html>