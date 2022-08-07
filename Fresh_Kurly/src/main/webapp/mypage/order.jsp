<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<title>마이페이지 - 주문내역</title>
<script src="http://code.jquery.com/jquery-latest.js"></script> <!-- 제이쿼리 -->
<style>
	body {margin: 0 auto; }
	* {text-align: left}
	h6 {color:gray; font-weight:bold;}
	hr {
    border: 0;
    height: 2px;
    background: #ccc;}
    
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
							<form class="myForm text-center needs-validation" novalidate>
								<header>주문내역</header>
								<h6>지난 3년간의 주문 내역 조회가 가능합니다.</h6>
								<hr>
								<!-- 주문내역이 있는 경우 -->
								<c:if test="${listcount>0}">
								<c:forEach var="o" items="${orderlist }">
									<c:forEach var="on" items="${o.order_number}">
										<table>
											<tr>
												<th colspan="">주문번호 ${on}</th>
											</tr>
											<tr>
												<td>상품사진 ${on }</td>
												<td>상품명 ${on }<br>가격 ${on } | 수량 ${on }
												</td>
												<td>배송상태</td>
											</tr>

										</table>
									</c:forEach>
								</c:forEach>
								</c:if>

								<!-- 주문내역이 없는 경우 -->
								<c:if test="${listcount == 0}">
									<font size=5>주문 내역이 없습니다.</font>
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