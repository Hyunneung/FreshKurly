<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	<%-- core 라이브러리 등록 --%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입 완료 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<style>
	button {background:#8BC34A; font-weight:bold; color: white;
	padding-top:10px; padding-bottom:10px;
	border:0; border-radius: 12px; width:400px}
	
	.clearfix {
		position: absolute;
		left:38%;
	}
	
	span{margin:10px}
	
	form {margin:50px}
</style>
</head>
<body>
<header>
	<jsp:include page="../mainpage/header.jsp"/>
</header>
	<div class="container">
		<form action="myOrder.my" method="post">
			<h1>회원가입이 완료되었습니다</h1>
			<span></span>
			<table class="table table-border">
				<tr>
					<td style="width:15%;">아이디</td>
					<td>${id}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${name}</td>
				<tr>
					<td>이메일</td>
					<td>${email}</td>
				</tr>
			</table>
			
			<hr><span></span>
			<div class="clearfix">
				<button type="submit" class="submitbtn">마이페이지로 이동</button>
			</div>
		</form>
	</div>
</body>
</html>