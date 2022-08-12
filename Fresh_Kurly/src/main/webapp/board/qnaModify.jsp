<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>	
<title>MVC 게시판</title>	
<jsp:include page="../mainpage/header.jsp"/>
<script src="/assets/js/qnamodifyform.js"></script>
<style>
.container{width:60%}
h1{font-size:1.5rem; text-align:center; color:#1a92b9}
#upfile{display:none}
</style>
</head>
<body>
	<!-- 게시판 수정 -->
	<div class="container">
		<form action="QnaModifyAction.bo" method="post" name="modifyform">
			<input type="hidden" name="qna_number" value="${qnadata.qna_number}">
			<h1>문의하기 게시글 - 수정</h1>	
			<div class="form-group">
				<label class="qna_name">글쓴이</label>
				<input type="text" class="form-control"
					   value="${qnadata.qna_name}" readOnly>
			</div>
			
			<div class="form-group">
				<label class="qna_subject">제목</label>
				<textarea name="qna_subject" id="qna_subject" rows="1"
					      class="form-control" maxlength="100">${qnadata.qna_subject}</textarea>
			</div>		      
			<div class="form-group">
				<label class="qna_content">내용</label>
				<textarea name="qna_content" id="qna_content"
					      class="form-control" rows="15">${qnadata.qna_content}</textarea>
			</div>
		
		<div class="form-group">
			<label for="qna_pass">비밀번호</label>
			<input name="qna_pass"
				   id="qna_pass" type="password" size="10" maxlength="30"
				   class="form-control" placeholder="Enter password">
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
