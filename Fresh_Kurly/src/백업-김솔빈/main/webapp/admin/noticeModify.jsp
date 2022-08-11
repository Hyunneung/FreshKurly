<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>	
<title>MVC 게시판</title>	
<jsp:include page="../mainpage/header.jsp"/>
<script src="/assets/js/modifyform.js"></script>
<style>
.container{width:60%}
h1{font-size:1.5rem; text-align:center; color:#1a92b9}
#upfile{display:none}
</style>
</head>
<body>
	<!-- 게시판 수정 -->
	<div class="container">
		<form action="BoardModifyAction.bo" method="post" name="modifyform" enctype="multipart/form-data">
			<input type="hidden" name="board_num" value="${boarddata.board_num}">
			<h1>MVC 게시판 - 수정</h1>	
			<div class="form-group">
				<label class="board_name">글쓴이</label>
				<input type="text" class="form-control"
					   value="${boarddata.board_name}" readOnly>
			</div>
			
			<div class="form-group">
				<label class="board_subject">제목</label>
				<textarea name="board_subject" id="board_subject" rows="1"
					      class="form-control" maxlength="100">${boarddata.board_subject}</textarea>
			</div>		      
			<div class="form-group">
				<label class="board_content">내용</label>
				<textarea name="board_content" id="board_content"
					      class="form-control" rows="15">${boarddata.board_content}</textarea>
			</div>
		<div class="form-group">
			<label for="board_pass">비밀번호</label>
			<input name="board_pass"
				   id="board_pass" type="password" size="10" maxlength="30"
				   class="form-control" placeholder="Enter password">
		</div>
		<div class="form-group">
			<button type=submit class="btn btn-primary">수정</button>
			<button type=reset class="btn btn-danger">취소</button>
		</div>
			
		</form>
	</div><%-- class="container" end --%>
</body>
</html>
