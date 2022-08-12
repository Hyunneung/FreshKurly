<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>카테고리</title>

	<script src="assets/vendor/bootstrap/js/moment.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap-datetimepicker.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/custom.js"></script>
	
	
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




<script src="assets/js/custom.js"></script>
<!-- footer -->
<jsp:include page="../mainpage/footer.jsp"/>
<!-- footer end -->
</body>
</html>