<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>카테고리</title>
</head>
<body>

<!-- header -->
<header>
<jsp:include page="../mainpage/header.jsp"/>
</header>
<!-- header end -->

<table>
<c:forEach var="i" items="${totallist }">
  				<tr>
  					<td>${i.item_id }</td>
  					<td><a href="itemInfo.item?id=${i.item_id }">${i.item_name }</a></td>
  					<td>${i.item_category }</td>
  				</tr>
</c:forEach>
</table>






<!-- footer -->
<jsp:include page="../mainpage/footer.jsp"/>
<!-- footer end -->
</body>
</html>