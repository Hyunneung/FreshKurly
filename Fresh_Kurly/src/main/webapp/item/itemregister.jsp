<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>상품관리 시스템 관리자모드</title>
<style>
#form-control{
	height: 41px;
}

#btn-ins {
float: right;
	
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

#boardlist {
	margin: 0 auto;
	width: 80%;
	text-align: center
}

#viewcount {
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	outline: none;
}

#mycontainer {
	padding-top: 150px;
	width: 60%
}

.input-group {
	margin-bottom: 3em
}
</style>
<jsp:include page="../mainpage/header.jsp"/>
<script>
	$(function() {
		//검색 클릭 후 응답화면에는 검색 시 선택한 필드가 선택되도록 합니다.
		var selectedValue = "${search_field}"
		if (selectedValue != '-1') {
			$("#viewcount").val(selectedValue);
		}
		
		//검색 버튼 클릭한 경우
		$("#search").click(function() {
			//검색어 공백 유효성 검사합니다.
			if ($("form>div>input").val() == '') {
				alert("검색어를 입력하세요");
				$("form>div>input").focus();
				return false;
			}
		}); // button click end
		
		
		// 검색어 입력창에 palceholder 나타나도록 합니다.
		$("#viewcount").change(function() {
			selectedValue = $(this).val();
			$("input").val();
			message = [ "상품번호", "상품명", "카테고리"]
			$("form>div>input").attr("placeholder", message[selectedValue] + " 입력하세요");
		}) // $("#viewcount").change end
		
		// 회원 목록의 삭제를 클릭한 경우
		$("tr > td:nth-child(5) > a").click(function(event) {
			var answer = confirm("정말 삭제하시겠습니까?");
			console.log(answer); // 취소를 클릭한 경우 false;
			if (!answer) { // 취소를 클릭한 경우
				event.preventDefault(); // 이동하지 않습니다.
			}
		}); // 삭제 클릭 end
		
		// 수정 클릭한 경우
		$("tr > td:nth-child(4) > a").click(function(event) {
			var answer = confirm("정말 수정하시겠습니까?");
			console.log(answer); // 취소를 클릭한 경우 false;
			if (!answer) { // 취소를 클릭한 경우
				event.preventDefault(); // 이동하지 않습니다.
			}
		}); // 삭제 클릭 end
		
		$("#btn-ins").click(function() {
			location.href="itemInsert.item";
		})// 등록하기 버튼 클릭 시 물품 등록하기
	}); // ready end
</script>
</head>
<body>
<div id="mycontainer"class="container">
  <form id="boardlist" action="itemList.item" method="post">
  	<div class="input-group">
  		<select id="viewcount" name="search_field">
  			<option value="0" selected>상품번호</option>
  			<option value="1" >상품명</option>
  			<option value="2" >카테고리</option>
  		</select>
  			<input id="form-control" name="search_word" type="text" class="form-control"
  					placeholder="상품번호를 입력하세요" value="${search_word }">
  			<button id="search" class="btn btn-primary" type="submit">검색</button> 
  	</div>
  </form>
  <c:if test="${listcount > 0 }">
  	<%-- 회원이 있는 경우 --%>
  	<table class="table table-striped">
  		<thead>
  			<tr>
  				<th colspan="2">상품 정보 list</th>
  				<th><font size=3>등록 수 : ${listcount }</font></th>
  			</tr>
  			<tr>
  				<td>상품번호</td>
  				<td>상품명</td>
  				<td>카테고리</td>
  				<td>수정</td>
  				<td>삭제</td>
  			</tr>
  		</thead>
  		<tbody>
  			<c:forEach var="m" items="${totallist }">
  				<tr>
  					<td>${m.item_id }</td>
  					<td><a href="itemInfo.item?item_id=${m.item_id }">${m.item_name }</a></td>
  					<td>${m.item_category }</td>
  					<td><a href="itemUpdate.item?item_id=${m.item_id }">수정</a></td>
  					<td><a href="itemDelete.item?item_id=${m.item_id }">삭제</a></td>
  				</tr>
  			</c:forEach>
  		</tbody>
  	</table>
  	<ul class="pagination justify-content-center">
  		<c:if test="${page <= 1 }">
  			<li class="page-item">
  				<a class="page-link gray">이전&nbsp;</a>
  			</li>
  		</c:if>
  		<c:if test="${page > 1 }">
  			<li class="page-item">
<a href="itemList.item?page=${page-1}&search_field=${search_field}&search_word=${search_word}"
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
  			<c:url var="go" value="itemList.item">
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
  	 	<c:url var="next" value="itemList.item">
  				<c:param name="search_field" value="${search_field }"/>
  				<c:param name="search_word"  value="${search_word}"/>
  				<c:param name="page" 		 value="${page+1}"/>
  			</c:url>
  	 	<li class="page-item">
  	 		<a href="${next}" class="page-link">&nbsp;다음</a>
  	 	</li>
  	 </c:if>
  	</ul>
   </c:if>
  
  <%-- 회원이 없는 경우 --%>
  <c:if test="${listcount == 0 && empty search_word }">
  	<h1>회원이 없습니다.</h1>
  </c:if>
<c:if test="${listcount == 0 && !empty search_word}">
	<h1>검색결과가 없습니다.</h1>
</c:if>
<button id="btn-ins" type="button" class="btn">등록하기</button>
</div>
<div></div>
</body>
</html>