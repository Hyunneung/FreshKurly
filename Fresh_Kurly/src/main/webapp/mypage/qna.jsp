<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>마이페이지 - 상품문의</title>
<style>
	.btn-red {
	  	padding: 0.5rem 1rem;
	  	display: inline-block;
	  	border: none;
	  	border-radius: 4px;
	  	
	  	background: #dc3545;
	  	color: white;
	}
	.btn-ok {
	  	padding: 0.5rem 1rem;
	  	display: inline-block;
	  	border: none;
	  	border-radius: 4px;
	  	
	  	background: #28a745;
	  	color: white;
	}
	
	input { border:none; width:80px; text-align:center}
    input:focus {outline: none;}

</style>
<script>
	$(function(){
		// 문의 삭제 - 문의내역 비밀번호 입력하지 않았을 떼
		$('form[name="deleteForm"]').submit(function(){
			if($("#qna_pass").val() == ''){
				alert('비밀번호를 입력하세요');
				$("#qna_pass").focus();
				return false;
			}
		}) // form 제출 end
	}) // ready end
</script>
</head>
<body>
	<div class="col-md-8"> 
		<div class="myLeftCtn">
			<header style="font-size:18pt; margin-bottom:10px; margin-top:20px">상품문의</header>
			<h5>상품문의 내역을 확인하는 공간입니다.</h5>
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
									<!-- <button type="button" id="deletebtn">삭제</button> -->
									<c:if test="${q.qna_name == id || id == 'admin'}">
										<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
										<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
										<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
										
										<a href="#">
											<button class="btn-red" data-toggle="modal" data-target="#deleteModal${q.qna_number}">삭제</button>
										</a>
										
										<!-- 삭제 모달 시작 -->
										<div class="modal" id="deleteModal${q.qna_number}">
											<div class="modal-dialog">
												<div class="modal-content">
													<%-- Modal body --%>
													<div class="modal-body">
														<c:if test="${commOK == '답변완료'}"> <!-- 관리자 답변 완료인 경우 삭제 불가 -->
															<form>
																<div class="modal-header">
															        <h5 class="modal-title">답변이 완료된 게시글은 삭제할 수 없습니다.</h5>
															        <button type="button" class="close" data-dismiss="modal">&times;</button>
														        </div>
															</form>
														</c:if>
														
														<c:if test="${commOK == '답변대기'}">
															<form name="deleteForm" action="myQnaDelete.my" method="post">
																<input type="hidden" name="qna_number" id="qna_number" value="${q.qna_number}"> <!-- 삭제할 글의 글번호를 hidden으로 가져온다 -->
																<div class="modal-header">
															        <h5 class="modal-title">삭제를 위해 글 비밀번호를 입력해주세요.</h5>
															        <button type="button" class="close" data-dismiss="modal">&times;</button>
														        </div>
														        <div class="modal-body">
																	<div class="form-group">
																		<label for="pwd">비밀번호</label>
																		<input type="password" class="form-control" placeholder="Enter password" name="qna_pass" id="qna_pass">
																	</div>
																</div>
																<button type="submit" class="btn-ok">삭제</button>
																<button type="button" class="btn-red" data-dismiss="modal">취소</button>
															</form>
														</c:if>
													</div>
												</div>
											</div>
										</div>
									</c:if>	
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
		</div>
	</div>
</body>
</html>