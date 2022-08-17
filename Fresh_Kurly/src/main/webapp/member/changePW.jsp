<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>비밀번호 변경하기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../assets/js/member/changePW.js"></script> 
<style>
body {text-align:center}
.sbmbtn {
display: inline-block;
    margin-bottom: 0;
    font-weight: 600;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    background-image: none;
    border: 1px solid transparent;
    padding: 10px 25px;
    font-size: 14px;
    border-radius: 2px;
    background-color: #8BC34A;
    color: #fff;
    text-transform: uppercase;
    -webkit-transition: all 0.5s;
    -o-transition: all 0.5s;
    -ms-transition: all 0.5s;
    -moz-transition: all 0.5s;
    transition: all 0.5s;
    letter-spacing: 0.5;
    outline: 0px;
    font-family: "Rubik", sans-serif;
    border: 0;
}
</style>
</head>
<body>

<span>${id_changePW }</span>님의 아이디 변경<hr>
<form method="post" action="changePassProccess.net" id="changePW" style="text-align:center">
<label for="new_password">새로운 비밀번호</label>
<input type="password" id="new_password" name="new_password">
<br>
<label for="confirm_password">비밀번호 확인</label>
<input type="password" id="confirm_password" name="confirm_password">
<br><br>
<input id="sbmbtn" class="sbmbtn" type="submit" value="변경하기">
</form>

</body>
</html>