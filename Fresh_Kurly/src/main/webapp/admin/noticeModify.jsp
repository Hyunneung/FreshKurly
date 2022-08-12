<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>	
<title>MVC 게시판</title>	
<jsp:include page="../mainpage/header.jsp"/>
<script src="/assets/js/admin/noticeModifyform.js"></script>
<style>
.container{width:60%}
h1{font-size:1.5rem; text-align:center; color:#1a92b9}
#upfile{display:none}
</style>
</head>
<body>
	<!-- 게시판 수정 -->
	<div class="container">
		<form action="NoticeModifyAction.ad" method="post" name="modifyform">
			<input type="hidden" name="notice_number" value="${noticedata.notice_number}">
			<h1>공지사항 게시글 - 수정</h1>	
			<div class="form-group">
				<label class="notice_name">글쓴이</label>
				<input type="text" class="form-control"
					   value="${noticedata.notice_name}" readOnly>
			</div>
			
			<div class="form-group">
				<label class="notice_subject">제목</label>
				<textarea name="notice_subject" id="notice_subject" rows="1"
					      class="form-control" maxlength="100">${noticedata.notice_subject}</textarea>
			</div>		      
			<div class="form-group">
				<label class="notice_content">내용</label>
				<textarea name="notice_content" id="notice_content"
					      class="form-control" rows="15">${noticedata.notice_content}</textarea>
			</div>
		<div class="form-group">
			<label for="notice_pass">비밀번호</label>
			<input name="notice_pass"
				   id="notice_pass" type="password" size="10" maxlength="30"
				   class="form-control" placeholder="비밀번호를 입력하세요">
		</div>
		<div class="form-group">
			<button type=submit class="btn btn-primary">수정</button>
			<button type=reset class="btn btn-danger" onClick="history.go(-1)">취소</button>
			
		</div>
			
		</form>
	</div><%-- class="container" end --%>
	<script src="assets/js/custom.js"></script>
	<footer id="footer">  
		<jsp:include page="../mainpage/footer.jsp"/>
	</footer> 
</body>
</html>
