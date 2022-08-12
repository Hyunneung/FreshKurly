<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>회원 목록 페이지</title>
<jsp:include page="../mainpage/header.jsp"/>
<script>
$(function() {
   //검색 클릭 후 응답화면에는 검색시 선택한 필드가 선택되도록 합니다.
   var selectedValue = '${search_field}'
   if (selectedValue != '-1')
      $("#viewcount").val(selectedValue);
      
   //검색 버튼 클릭한 경우
   $("form[action='MemberList.ad'] button").click(function() {
      //검색 버튼 클릭한 경우
      if ($("form[action='MemberList.ad'] input").val() == '') {
         alert("검색어를 입력하세요");
            $("form[action='MemberList.ad'] input").focus();
            return false;
      }
         
      var word = $(".input-group input").val();
      
   });//button click end
      
   //검색어 입력창에 selectedValue 나타나도록 합니다.
   $("#viewcount").change(function() {
      selectedValue = $(this).val();
      $("form[action='MemberList.ad'] input").val('');
      message = [ "아이디", "이름"]
      $("form[action='MemberList.ad'] input").attr("placeholder", message[selectedValue] + "입력하세요");
   })//$("#viewcount").change end
      
   //회원 목록의 삭제를 클릭한 경우
   $("tr > td:nth-child(3) > a").click(function(event){
      var answer = confirm("정말 삭제하시겠습니까?");
      console.log(answer); 
      if(!answer){//취소를 클릭한 경우-false
         event.preventDefault(); //이동하지 않습니다.   
      }
   })//삭제 클릭 end
      
});//ready end
</script>
<style>
table caption {
	caption-side: top;
	text-align: center
}

h1 {
	text-align: center
}

li .gray {
	color: gray;
}

body>div>table>tbody>tr>td:last-child>a {
	color: red
}

form {
	margin: 0 auto;
	width: 80%;
	text-align: center
}

select {
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	outline: none;
}

.container {
	width: 60%
}

td:nth-child(1) {
	width: 33%
}

.input-group {
	margin-bottom: 3em
}
</style>
</head>
<body>
	<div class="container">
	<br>
		<form action="MemberList.ad" method="post">
			<div class="input-group">
				<select id="viewcount" name="search_field">
					<option value="0" selected>아이디</option>
					<option value="1">이름</option>
				</select>
					<input name="search_word" type="text" class="form-control"
						   placeholder="아이디 입력하세요" 	  value="${search_word}">
					<button class="btn btn-primary" type="submit">검색</button>	   
			</div>
		</form>
		<c:if test="${listcount > 0 }">
			<%-- 회원이 있는 경우 --%>
			<table class="table table-striped">
				<caption style="font-weight: bold">회원 목록</caption>
				<thead>
					<tr>
						<th colspan="2">MVC 게시판 - 회원 정보 list</th>
						<th><font size=3>회원 수 : ${listcount }</font></th>
					</tr>
					<tr>
						<td>아이디</td>	
						<td>이름</td>	
						<td>삭제</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="m" items="${totallist}">
						<tr>
							<td><a href="MemberInfo.ad?id=${m.member_id}">${m.member_id}</a></td>
							<td>${m.member_name}</td>
							<td><a href="MemberDelete.ad?id=${m.member_id}">삭제</a></td>
						</tr>	
					</c:forEach>
				</tbody>			
			</table>
		<div>
				<ul class="pagination justify-content-center">
					<c:if test="${page <= 1 }">
						<li class="page-item">
						  <a class="page-link gray">이전&nbsp;</a>
					</c:if>
					<c:if test="${page > 1 }">
						<li class="page-item">
			<a href="MemberList.ad?page=${page-1}&search_field=${search_field}&search_word=${sear_word}"
							class="page-link">이전</a>&nbsp;
						</li>
					</c:if>
				
					<c:forEach var="a" begin="${startpage}" end="${endpage}">
						<c:if test="${a == page }">
							<li class="page-item active">
								<a class="page-link">${a}</a>
							</li>
						</c:if>
						<c:if test="${a != page }">		
							<c:url var="go" value="MemberList.ad">
								<c:param name="serarch_field" value="${search_field}" />
								<c:param name="serarch_word"  value="${search_word}" />
								<c:param name="page" 		  value="${a}" />
							</c:url>
							<li class="page-item">
								<a href="${go}" class="page-link">${a}</a>
							</li>
						</c:if>			
					</c:forEach>
					
					<c:if test="${page >= maxpage }">
						<li class="page-item">
							<a class="page-link gray">&nbsp;다음</a>
						</li>	
					</c:if>
					<c:if test="${page < maxpage }">
						<c:url var="next" value="MemberList.ad">
							<c:param name="serarch_field" value="${search_field}" />
							<c:param name="serarch_word"  value="${search_word}" />
							<c:param name="page" 		  value="${page+1}" />
						</c:url>				
						
						<li class="page-item">
							<a href="${next}" class="page-link">&nbsp;다음</a>
						</li>
						
					</c:if>	
				</ul>
			</div>
		</c:if>
	</div>
	
	<%-- 회원이 없는 경우 --%>
	<c:if test="${listcount == 0 && empty search_word}">
      <h1>회원이 없습니다.</h1>
   </c:if>
   
   <c:if test="${listcount == 0 && !empty search_word}">
      <h1>검색 결과가 없습니다.</h1>
   </c:if>
   <script src="assets/js/custom.js"></script>
	<footer id="footer">  
		<jsp:include page="../mainpage/footer.jsp"/>
	</footer> 
</body>
</html>