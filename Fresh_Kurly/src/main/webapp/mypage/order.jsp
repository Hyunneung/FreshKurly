<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<head>
<title>마이페이지 - 주문내역</title>
<style>
	tbody > tr:nth-child(1) > td:nth-child(1){width:20%}
    tbody > tr:nth-child(1) > td:nth-child(2){width:60%}
    tbody > tr:nth-child(1) > td:nth-child(3){width:20%}
</style>
</head>
<body>
	<div class="col-md-8">
		<div class="myLeftCtn">
			<form class="text-center">
				<header>주문내역</header>
				<hr>
				<!-- 주문내역이 있는 경우 -->
				<c:if test="${listcount > 0}">
					<c:forEach var="o" items="${orderlist }" varStatus="status">
						<table class="table" frame=void>
							<thead>
								<tr>
									<th colspan="3">주문번호 ${o.order_number}</th>
								</tr>
							</thead>
							<tbody>
								<tr style="border-bottom: hidden;">
									<td rowspan="3">
										<img src="itemupload/${o.item_image}" style="width:80px; height:80px">
									</td>
									<td>
										${o.item_name}
									</td>
									<td rowspan="3" style="vertical-align: middle"> 
										<c:set var="deliver" value="배송전" />
										<c:if test="${o.order_deliver eq 'Y'}"> <!-- o.order_deliver ='N'은 배송전, 'Y'는 배송완료  -->
											<c:set var="deliver" value="배송완료" />
										</c:if>
										${deliver}
									</td>
								</tr>
								<tr style="border-bottom: hidden;">	
									<td>
										<fmt:formatNumber value="${o.item_price}" pattern="#,###"/>원
									</td>
								</tr>
								<tr>
									<td>
										${o.order_amount}개 구매
									</td>
								</tr>
								<tr>
									<td colspan="3">
										총 주문금액 <fmt:formatNumber value="${o.item_price * o.order_amount}" pattern="#,###"/>원
									</td>
								</tr>
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
</body>
</html>