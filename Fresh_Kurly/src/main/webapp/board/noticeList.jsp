<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<html>
<head>
<script>
$(function() {
   //검색 클릭 후 응답화면에는 검색시 선택한 필드가 선택되도록 합니다.
   var selectedValue = '${search_field}'
   if (selectedValue != '-1')
      $("#viewcount").val(selectedValue);
      
   //검색 버튼 클릭한 경우
   $("form[name=search] button").click(function() {
      //검색 버튼 클릭한 경우
      if ($("input[name=search_word]").val() == '') {
         alert("검색어를 입력하세요");
            $("input[name=search_word]").focus();
            return false;
      }
         
      var word = $(".input-group input").val();
      
      
   });//button click end
      
   //검색어 입력창에 selectedValue 나타나도록 합니다.
   $("#viewcount").change(function() {
      selectedValue = $(this).val();
      $("input").val('');
      message = [ "제목", "내용" ]
      $("input").attr("placeholder", message[selectedValue] + "입력하세요");
   })//$("#viewcount").change end
      
});//ready end
</script>
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

body > div.container > table > tbody > tr > td:nth-child(1){
	width: 5%
}

body > div.container > table > tbody > tr > td:nth-child(2)
{
	width: 40%
}

body > div.container > table > tbody > tr > td:nth-child(3) {
	width: 10%
}

body > div.container > table > tbody > tr > td:nth-child(4) {
	width: 17%
}

body>div>table>thead>tr:nth-child(2)>th:nth-child(5) {
	width: 11%
}

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
<script src="assets/js/board/noticelist.js"></script>
<title>공지사항 게시판</title>
</head>
<jsp:include page="../mainpage/header.jsp" />
<body>
<br>

	<div class="container">
		<form name="search" action="NoticeList.bo" method="post">
			<div class="input-group">
			
				<select id="viewcount" name="search_field">
					<option value="0" selected>제목</option>
					<option value="1">내용</option>
				</select> <input name="search_word" type="text" class="form-control"
					placeholder="제목을 입력하세요" value="${search_word}">
				<button class="btn btn-primary" type="submit">검색</button>
			</div>
		</form>
			<%-- 게시글이 있는 경우 --%>
			<c:if test="${listcount > 0 }">
				<table class="table table">
					<caption style="font-weight: bold">공지사항 게시판</caption>
					<thead>
						<tr>
							<th colspan="3">공지사항 게시판 - list</th>
							<th colspan="2"><font size=3>글 개수 : ${listcount}</font></th>
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
						<c:set var="num" value="${listcount-(page-1)*limit}" />
						<!-- 글번호 1부터 -->
						<c:forEach var="b" items="${noticelist}">
							<tr>
								<td>
									<%-- 번호 --%> <c:out value="${num}" /> <%-- num 출력 --%> <c:set
										var="num" value="${num-1}" /> <%-- num=num-1; 의미 --%>
								</td>
								<td>
									<%-- 제목 --%>
									<div>
						

										<a href="NoticeDetailAction.bo?num=${b.notice_number}"> <c:if
												test="${b.notice_subject.length()>=20}">
												<c:out value="${b.notice_subject.substring(0,20)}..." />
											</c:if> <c:if test="${b.notice_subject.length()<20}">
												<c:out value="${b.notice_subject}" />
											</c:if>
										</a>
									</div>
								</td>
								<td><div>${b.notice_name}</div></td>
								<td><div>${b.notice_reg_date}</div></td>
								<td><div>${b.notice_view}</div></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="center-block">
					<ul class="pagination justify-content-center">
						<c:if test="${page <= 1 }">
							<li class="page-item"><a class="page-link gray">이전&nbsp;</a>
							</li>
						</c:if>
						<c:if test="${page > 1 }">
							<li class="page-item "><a
								href="NoticeList.ad?page=${page-1}" class="page-link">이전&nbsp;</a>
							</li>
						</c:if>

						<c:forEach var="a" begin="${startpage}" end="${endpage}">
							<c:if test="${ a == page }">
								<li class="page_item active"><a class="page-link">${a}</a>
								</li>
							</c:if>
							<c:if test="${a != page }">
								<c:url var="go" value="NoticeList.bo">
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
							<li class="page_item"><a class="page-link gray">&nbsp;다음</a>
							</li>
						</c:if>
						<c:if test="${page < maxpage }">
							<li class="page-item"><a href="NoticeList.ad?page=${page+1}"
								class="page-link">&nbsp;다음</a></li>
						</c:if>
					</ul>
				</div>
			</c:if>
			<%-- <c:if test="${listcount > 0 }"> end --%>

			<%-- 게시글이 없는 경우 --%>
			<c:if test="${listcount == 0 && empty search_word}">
				<h1>등록된 글이 없습니다.</h1>
			</c:if>
			
			<c:if test="${listcount == 0 && !empty search_word}">
		      <h1>검색 결과가 없습니다.</h1>
		   </c:if>

			
	</div>
</body>
</html>