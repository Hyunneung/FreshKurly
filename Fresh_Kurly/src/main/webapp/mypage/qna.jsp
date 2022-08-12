<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 코어라이브러리 사용 -->
<html>
<head>
<title>마이페이지 - 상품문의</title>
<script>
	$(function(){
		// url 쿼리스트링 제거
		history.replaceState({}, null, location.pathname);
		
		
		// 답변여부에 따라 문의 삭제 - 관리자 답변이 완료된 게시글은 삭제하지 못한다.
		$("body").on('click', '#deletebtn', function(){
			var tr = $(this).parent().parent();
			var td2 = tr.find('td:nth-child(2)');
			var td4 = tr.find('td:nth-child(4)');
			var qna_number = td2.find( 'input:nth-child(1)' ); // 글번호 .val()
			var commOK =  td4.find( 'input:nth-child(1)' ); // 답변여부 .val()
			
			if( commOK.val() == "답변대기" ) {
				if(confirm("정말 삭제하시겠습니까?")) {
					$.ajax({
						type : "POST",
						url: "myQnaDelete.my",
						data: { "qna_number": qna_number.val() },
						success : function(result) {
							if(result == 1) { // 문의 삭제 성공하면 1, 실패하면 0
								alert('문의내역이 삭제되었습니다.');
								location.href="myQna.my";
							} 
						}, // success end
						error : function(error){
							alert("문의 삭제 에러 : " + error);
						}
					}) // ajax end
				} // if(confirm) end
			} else {
				alert("답변이 완료된 게시글은 삭제할 수 없습니다.");
			}	
		}) // 답변 삭제 end
		
	})
</script>
</head>
<body>
	<div class="col-md-8"> 
		<div class="myLeftCtn">
			<form class="myForm text-center">
				<header>상품문의</header>
				<h4>상품문의 내역을 확인하는 공간입니다.</h4>
				<hr>

				<!-- 상품문의가 있는 경우 -->
				<c:if test="${listcount > 0}">
					<table class="table" frame=void>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>답변여부</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="num" value="${listcount - (page - 1)*limit }"/>
							<c:forEach var="q" items="${qnalist}">
								<tr>
									<td> <!-- 번호 -->
										<c:out value="${num}"/>  <!-- num 출력 -->
										<c:set var="num" value="${num-1}"/>  <!-- num=num-1; 의미 -->
									</td>
									<td> <!-- 글제목 -->
										<input type="hidden" value="${q.qna_number}"> <!-- 문의 삭제 ajax로 넘겨줄 hidden -->
										<a href="QnaDetailAction.bo?num=${q.qna_number}">${q.qna_subject}</a>
									</td>
								 	<td> <!-- 작성일 -->
										${q.qna_reg_date}
									</td>
									<td> <!-- 관리자 답변 여부 -->
										<c:if test="${q.cnt == 0}">
											<c:set var="commOK" value="답변대기" />
										</c:if>
										<c:if test="${q.cnt != 0}">
											<c:set var="commOK" value="답변완료" />
										</c:if>
										<input type="text" id="commOK" value="${commOK}" readonly>
									</td>
									<td> <!-- 문의 삭제 -->
										<button type="button" id="deletebtn">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<div class="center-block">
						<ul class="pagination justify-content-center">
							<!-- page는 현재 페이지 -->
							<c:if test="${page <= 1}">  
								<li class="page-item">
									<a class="page-link gray">이전&nbsp;</a> <!-- page(현재 페이지)가 1페이지보다 작은 경우 이동할 이전 페이지가 없다 -->
								</li>
							</c:if>
							<c:if test="${page > 1}"> 
								<li class="page-item">
									<a href="myQna.my?page=${page-1}" class="page-link">이전&nbsp;</a> <!-- page(현재 페이지)가 1페이지보다 크면 이동할 이전 페이지가 생긴다 -->
								</li>
							</c:if>
							
							<c:forEach var="a" begin="${startpage}" end="${endpage}">
								<c:if test="${a == page}">
									<li class="page-item active">
										<a class="page-link">${a}</a>
									</li>
								</c:if>
								<c:if test="${a != page}">
									<li class="page-item">
										<a href="myQna.my?page=${a}" class="page-link">${a}</a>
									</li>
								</c:if>
							</c:forEach>
							
							<c:if test="${page >= maxpage}">
								<li class="page-item">
									<a class="page-link gray">&nbsp;다음</a>
								</li>
							</c:if>	
							<c:if test="${page < maxpage}">
								<li class="page-item">
									<a href="myQna.my?page=${page+1}" class="page-link">&nbsp;다음</a>
								</li>
							</c:if>						
						</ul>
					</div>
				</c:if> <!-- 상품문의 있는 경우 end -->
				
				
				<!-- 상품문의가 없는 경우 -->
				<c:if test="${listcount == 0}">
					<font size=5>작성한 상품 문의가 없습니다.</font>
				</c:if>
			</form>
		</div>
	</div>
</body>
</html>