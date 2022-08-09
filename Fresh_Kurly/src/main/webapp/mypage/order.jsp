<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	    background: #ccc;
	    }
</style>
</head>
<body>
	<section id="login">
		<div class="container-fluid">
			<div class="myCard">
				<div class="row">
					<div class="col-md-10">
						<div class="myLeftCtn">
							<form class="myForm text-center" enctype="multipart/form-data">
								<header>주문내역</header>
								<h6>지난 3년간의 주문 내역 조회가 가능합니다.</h6>
								<hr>
								<!-- 주문내역이 있는 경우 -->
								<c:if test="${listcount > 0}">
									<c:forEach var="o" items="${orderlist }" varStatus="status">
										<table class="table table-border">
												<thead>
													<tr>
														<th colspan="3">주문번호 ${o.order_number}</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>${o.item_image }</td> <%-- <img src="폴더이름${o.item_image}" width="300px" height="400px"> --%>
														<td>${o.item_name}<br>가격 ${o.item_price } | 수량 ${o.order_amount}</td>
														<td>${o.order_deliver}</td>
													</tr>
													<tr>
														<td colspan="3">총 주문금액 <fmt:formatNumber value="${o.item_price * o.order_amount}" pattern="#,###"/></td>
													<tr>
												</tbody>
										</table>
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