<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 확인 페이지</title>
<jsp:include page="../mainpage/header.jsp"/>
<style>
  tr>td:nth-child(odd){font-weight: bold}
  td{text-align:center}
  .container{width:50%}
</style>

</head>
<body>

<div class="container">
<br>
	<table class="table table-bordered">
		<tr>
			<td>아이디</td>
			<td>${memberinfo.member_id}</td><%-- Member클래스의 getMember_id()메서드 호출 --%>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>${memberinfo.member_pass}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${memberinfo.member_name}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${memberinfo.member_email}</td>
		</tr>
		<tr>
			<td>휴대폰번호</td>
			<td>${memberinfo.member_phone}</td>
		</tr>
		<tr>
			<td>우편번호</td>
			<td>${memberinfo.member_post}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${memberinfo.member_address}</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>${memberinfo.member_gender}</td>
		</tr>
		<tr>
			<td>주민번호</td>
			<td>${memberinfo.member_jumin}</td>
		</tr>
		<tr>
			<td>가입날짜</td>
			<td>${memberinfo.member_reg_date}</td>
		</tr>
		<tr>
			<td colspan=2>
			<a href="MemberList.ad">리스트로 돌아가기</a></td>			
		</tr>
	</table>
</div>
<script src="assets/js/custom.js"></script>
	<footer id="footer">  
		<jsp:include page="../mainpage/footer.jsp"/>
	</footer>
</body>
</html>