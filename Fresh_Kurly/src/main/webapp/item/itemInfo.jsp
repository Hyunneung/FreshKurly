<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  	<ul class="pagination justify-content-center">
  		<c:if test="${page <= 1 }">
  			<li class="page-item">
  				<a class="page-link gray">이전&nbsp;</a>
  			</li>
  		</c:if>
  		<c:if test="${page > 1 }">
  			<li class="page-item">
<a href="itemlist.item?page=${page-1}&search_field=${search_field}&search_word=${search_word}"
  				class="page-link">이전&nbsp;</a>
  			</li>
  		</c:if>
  	
  	 <c:forEach var="a" begin="${startpage }" end="${endpage }">
  		<c:if test="${a == page }">
  			<li class="page-item active">
  				<a class="page-link">${a }</a>
  			</li>
  		</c:if>
  		<c:if test="${a != page }">
  			<c:url var="go" value="itemlist.item">
  				<c:param name="search_field" value="${search_field }"/>
  				<c:param name="search_word"  value="${search_word}"/>
  				<c:param name="page" 		 value="${a}"/>
  			</c:url>
  			<li class="page-item">
  				<a href= "${go }" class="page-link">${a }</a>
  			</li>
  		</c:if>
  	 </c:forEach>
  	 
  	 <c:if test="${page >= maxpage }">
  	 	<li class="page-item">
  	 		<a class="page-link gray">&nbsp;다음</a>
  	 	</li>
  	 </c:if>
  	 <c:if test="${page < maxpage }">
  	 	<c:url var="next" value="itemlist.item">
  				<c:param name="search_field" value="${search_field }"/>
  				<c:param name="search_word"  value="${search_word}"/>
  				<c:param name="page" 		 value="${page+1}"/>
  			</c:url>
  	 	<li class="page-item">
  	 		<a href="${next}" class="page-link">&nbsp;다음</a>
  	 	</li>
  	 </c:if>
  	</ul>
</body>
</html>