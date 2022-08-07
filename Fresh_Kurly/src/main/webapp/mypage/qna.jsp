<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 코어라이브러리 사용 -->
<html>
<head>
<title>마이페이지 - 상품문의</title>
<style>
body {
	margin: 0 auto;
}

* {
	text-align: left
}

h6 {
	color: gray;
	font-weight: bold;
}

hr {
	border: 0;
	height: 2px;
	background: #ccc;
}

/* #okbtn {background:#8BC34A; font-weight:bold; color: white;
		padding-top:10px; padding-bottom:10px; margin:3px;
		border:0; border-radius: 12px; width:300px}
  		} */
</style>
</head>
<body>
	<section id="login">
		<div class="container">
			<div class="myCard">
				<div class="row">
					<div class="col-md-10">
						<div class="myLeftCtn">
							<form>
								<header>상품문의</header>
								<h6>상품문의 내역을 확인하는 공간입니다.</h6>
								<hr>

								<!-- 상품문의가 있는 경우 -->
								<c:if test="${listcount>0}">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>제목</th>
												<th>작성일</th>
												<th>답변상태</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="q" items="${qnalist}">
												<c:forEach var="qn" items="${q.qna_number}">
													<tr>
														<td><a href="주소주소주소주소?num=${qn.qna_number}">${qn.qna_subject}</td>
														<!-- 글제목 -->
														<td>${qn.qna_reg_date}</td>
														<!-- 작성일 -->
														<td>${qn.qna_check}</td>
														<!-- 답변상태 -->
													</tr>
												</c:forEach>
											</c:forEach>
								
										</tbody>
									</table>
								</c:if>
								<!-- 상품문의가 없는 경우 -->
								<c:if test="${listcount == 0}">
									<font size=5>작성한 상품 문의가 없습니다.</font>
								</c:if>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>

</body>
</html>