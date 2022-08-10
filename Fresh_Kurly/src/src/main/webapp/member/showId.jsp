<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>ID 찾기</title>
<style>
body {text-align:center}
span {color : #8BC34A; font-weight: bolder; font-size: 25px}
input {
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
아이디 : <span>${findId }</span><br>
잊어버리지 마세요!<br><br>
<input type="button" value="창닫기" onClick="self.close()">

</body>
</html>