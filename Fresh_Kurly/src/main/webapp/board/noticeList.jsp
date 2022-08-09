<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
 <jsp:include page="../mainpage/header.jsp" />
 <style>
select.form-control {
	width: auto;
	margin-bottom: 2em;
	display: inline-block
}

.rows {
	text-align: right;
}

.gray {
	color: gray;
}
	body > div > table > thead > tr:nth-child(2) > th:nth-child(1){width:8%}
	body > div > table > thead > tr:nth-child(2) > th:nth-child(2){width:50%}
	body > div > table > thead > tr:nth-child(2) > th:nth-child(3){width:14%}
	body > div > table > thead > tr:nth-child(2) > th:nth-child(4){width:17%}
	body > div > table > thead > tr:nth-child(2) > th:nth-child(5){width:11%}
	
 </style>
 <script src="assets/js/admin/noticelist.js"></script>
 <title>공지사항 게시판</title>
</head>
<body>
<div class="container">
 <%-- 게시글이 있는 경우 --%>
 <c:if test="${listcount > 0 }">
  <div class="rows">
   <span>줄보기</span>
   <select class="form-control" id="viewcount">
   	 <option value="1">1</option>
   	 <option value="3">3</option>
   	 <option value="5">5</option>
   	 <option value="7">7</option>
   	 <option value="10" selected>10</option>   	 
   </select>
 </div>
 <table class="table table">
  <thead>
  <tr>
  	<th colspan="3">공지사항 게시판 - list</th>
  	<th colspan="2">
  		<font size=3>글 개수 : ${listcount}</font>
  	</th>
  </tr>
  <tr>
  	   <th><div>번호</div></th>
  	   <th><div>제목</div></th>
  	   <th><div>작성자</div></th>
  	   <th><div>날짜</div></th>
  	   <th><div>조회수</div></th>
  </tr>	   
  </thead>
  <tbody>
   <c:set var="num" value="${listcount-(page-1)*limit}"/><!-- 글번호 1부터 -->
   <c:forEach var="b" items="${noticelist}">
   <tr>
     <td><%-- 번호 --%>
       <c:out value="${num}"/><%-- num 출력 --%>
       <c:set var="num" value="${num-1}"/> <%-- num=num-1; 의미 --%>
     </td>
     <td><%-- 제목 --%>
        <div>
       	 
       	  
       	   <a href="BoardDetailAction.bo?num=${b.notice_num}">
       	  	  <c:if test="${b.notice_subject.length()>=20}">
       	  	    <c:out value="${b.notice_subject.substring(0,20)}..." />
       	  	  </c:if>
       	  	  <c:if test="${b.notice_subject.length()<20}">
       	  	 	 <c:out value="${b.notice_subject}" />
       	  	  </c:if>
       	   </a>[${b.cnt}]	   		
        </div>
    </td>
    <td><div>${b.notice_name}</div></td>
    <td><div>${b.notice_date}</div></td>
    <td><div>${b.notice_view}</div></td>
    </tr>
   </c:forEach>      
  </tbody>
 </table>
 
 <div class="center-block">
      <ul class="pagination justify-content-center">
	     <c:if test="${page <= 1 }">
		 	<li class="page-item">
			   <a class="page-link gray">이전&nbsp;</a>
			</li>
		 </c:if>
 	  	 <c:if test="${page > 1 }">
 	  	    <li class="page-item ">
 	  	       <a href="BoardList.bo?page=${page-1}"
 	  	          class="page-link">이전&nbsp;</a>
 	  	    </li>      
 	  	 </c:if>
 	  	 
 	  	 <c:forEach var="a" begin="${startpage}" end="${endpage}">
 	  	 	 <c:if test="${ a == page }">
 	  	 	 	<li class="page_item active" >
 	  	 	 	   <a class="page-link">${a}</a>
 	  	 	 	</li>
 	  	 	 </c:if>
 	  	 	 <c:if test="${a != page }">
 	  	 	 	<li class="page-item">
 	  	 	 	   <a href="BoardList.bo?page=${a}"
 	  	 	 	   	  class="page-link">${a}</a>
 	  	 	 	</li>   	  
 	  	 	 </c:if>
 	  	 </c:forEach>
 	  	 
 	  	 <c:if test="${page >= maxpage }">
 			<li class="page_item">
 				<a class="page-link gray">&nbsp;다음</a>
 			</li>	
 		</c:if>
 		<c:if test="${page < maxpage }">
 			<li class="page-item">
 				<a href="BoardList.bo?page=${page+1}"
 				   class="page-link">&nbsp;다음</a>
 			</li>
 		</c:if>
 	  </ul>
 	</div>
 </c:if> <%-- <c:if test="${listcount > 0 }"> end --%>	
 	
<%-- 게시글이 없는 경우 --%>
<c:if test="${listcount == 0 }">
	<font size=5>등록된 글이 없습니다.</font>
</c:if>

	<button type="button" class="btn btn-info float-right">글 쓰 기</button>
</div>
</body>
</html>