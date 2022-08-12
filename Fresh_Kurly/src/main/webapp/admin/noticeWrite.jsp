<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<jsp:include page="../mainpage/header.jsp"/>
 <script src="assets/js/admin/noticewriteform.js"></script>
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
  <form action="NoticeAddAction.ad" method="post"  name="noticeform">
    <h1>공지사항 등록</h1>
    <div class="form-group">
    	<label for="notice_name">글쓴이</label>
    	<input name="notice_name" id="notice_name" value="${id}" readOnly
    		   type="text"		 class="form-control"
    		   placeholder="Enter board_name">
    		   
    </div>
    <div class="form-group">
      <label for="notice_pass">비밀번호</label>
      <input name="notice_pass" id="notice_pass"	type="password" maxlength="30" 
      		 class="form-control" placeholder="게시물의 비밀번호를 입력하세요">
    </div>
    <div class="form-group">
      <label for="notice_subject">제목</label>
      <input name="notice_subject" id="notice_subject" 	type="text" maxlength="100" 
      		 class="form-control" placeholder="게시물의 제목를 입력하세요">
    </div>
    <div class="form-group">
      <label for="notice_content">내용</label>
      <textarea name="notice_content" id="notice_content"		
      			rows="10" class="form-control" placeholder="내용를 입력하세요"></textarea>
    </div>
  <div class="form-group">
     <button type=submit class="btn btn-primary">등록</button>
     <button type=reset class="btn btn-danger">취소</button>
  </div>
  </form>
 </div>
</body>
</html>