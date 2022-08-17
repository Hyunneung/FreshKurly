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
				<header style="font-size:18pt; margin-bottom:10px; margin-top:20px">주문내역</header>
				<hr>
				
				<!-- 주문내역이 있는 경우 -->
				<c:if test="${listcount > 0}">
					<c:forEach var="o" items="${orderNumber}"> <!-- 주문번호 -->
						<table class="table" frame=void>
							<thead>
								<tr>
									<th colspan="3">주문번호 ${o.order_number} </th>
								</tr>
							</thead>
							<tbody>
								<c:set var="sum" value="0" /> <!-- 각 주문번호에 해당하는 총 주문금액 -->
								<c:forEach var="ol" items="${orderlist}"> <!-- 각 주문번호에 해당하는 상품리스트 -->
									<c:if test="${o.order_number == ol.order_number}">
										<tr style="border-bottom: hidden;">
											<td rowspan="3">
												<a href="itemInfo.item?item_id=${ol.item_id}"> 
													<img src="itemupload/${ol.item_image}" style="width:80px; height:80px">
												</a>
											</td>
											<td>
												${ol.item_name}
											</td>
											<td rowspan="3" style="vertical-align: middle"> 
												<c:set var="deliver" value="배송전" />
												<c:if test="${ol.order_deliver eq 'Y'}"> <!-- o.order_deliver ='N'은 배송전, 'Y'는 배송완료  -->
													<c:set var="deliver" value="배송완료" />
												</c:if>
												${deliver}
											</td>
										</tr>
										<tr style="border-bottom: hidden;">	
											<td>
												<fmt:formatNumber value="${ol.item_price}" pattern="#,###"/>원
											</td>
										</tr>
										<tr>
											<td>
												${ol.order_amount}개 구매
											</td>
										</tr>
										<tr>
											<td colspan="3">
												상품 금액 <fmt:formatNumber value="${ol.item_price * ol.order_amount}" pattern="#,###"/>원
											</td>
										</tr>
									<c:set var="sum" value="${sum + (ol.item_price * ol.order_amount)}" />
									</c:if>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="3">
										<strong>총 주문금액 <fmt:formatNumber value="${sum}" pattern="#,###"/>원</strong>
									</td>
								</tr>
							</tfoot>
						</table>
					</c:forEach>
				</c:if>


				<!-- 주문내역이 없는 경우 -->
				<c:if test="${listcount == 0}">
					<h3 style="color:gray">주문 내역이 없습니다.</h3>
				</c:if>
			</form>
		</div>
	</div>
</body>
</html>