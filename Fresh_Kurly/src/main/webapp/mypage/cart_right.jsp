<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
<meta charset="utf-8">

<!-- 주소검색 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<title>cart - right</title>
</head>
<body>

	<!--Grid column-->
	<div class="col-md-4 mb-4" style="float:right">
		<!-- 배송지 -->
		<form action="" method="">
			<ul class="list-group margin-set z-depth-1">
				<li
					class="list-group-item d-flex justify-content-between lh-condensed">
					<div>
						<h6 class="my-0">배송지</h6>
						<small class="text-muted">주소</small>
						<%-- <c:forEach var="m" items="${member}"> ${} 사용해서 회원 주소 나오게 
							 또는 ${post} | ${address}--%>
						<br>
						<button type="submit" id="postcodebtn" class="btn btn-secondary btn-md waves-effect m-0">배송지변경</button>
						<input type="hidden" size="5" name="postcode" id="postcode" maxLength="5" disabled required><br>
						<input type="hidden" size="50" name="address" id="address" required>
						<input type="hidden" size="5" name="post" id="post"><br>
						<!-- 서블릿으로 넘겨줄 우편번호 input (∵ #postcode 넘기면 null 반환됨) -->
					</div>
				</li>
			</ul>
		</form>

		<!-- 금액 -->
		<!-- 서블릿에서 금액 3자리 단위마다 , 나오게 하기  -->
		<form action="" method="">
			<ul>
				<li class="list-group-item d-flex justify-content-between lh-condensed">
					<div>
						<small class="text-muted">상품 금액</small> <span class="text-muted">0원</span><br>
						<%-- ${} 사용해서 금액 가져오기 --%>
						<small class="text-muted">할인 금액</small> <span class="text-muted">0원</span><br>
						<small class="text-muted">배송비</small> <span class="text-muted">0원</span>
						<!-- 배송비 서울이면 3000, 도서산간지역이면 더 많이 받게 서블릿에서 if 해주기~ -->
					</div>
				</li>
			</ul>
		</form>

		<!-- 결제금액 결제하기 -->
		<form action="" method="">
			<ul>
				<li class="list-group-item d-flex justify-content-between">
					<div class="input-group">
						<div class="input-group-append">
							<span>결제 금액</span> <strong>0원</strong> <br>
							<button type="submit" id="paybtn"
								class="btn btn-secondary btn-md waves-effect m-0">결제하기</button>
						</div>
					</div>
				</li>
			</ul>
		</form>
		<!-- Cart -->
	</div>
	<!--Grid column-->
</body>
</html>