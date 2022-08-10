<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>마이페이지 - 장바구니</title>
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


							<form class="myForm text-center needs-validation" method="" action="">
								<header>장바구니</header>
								<span><input type="checkbox" name="selectAll" id="selectAll" value="전체선택"></span>
								<hr>
								
								<!-- 장바구니에 상품이 있는 경우 -->
								<c:if test="${listcount>0}">
								<c:forEach var="c" items="${cartlist}">
										<table>
											<tr>
												<td><input type="checkbox" name="select" id="select"></td> <!-- 상품 선택 -->

												<td>상품사진-${c.item_image }</td>
												<td>상품명-${c.item_name}</td>
												<!-- 상품수량 추가 제거 버튼 -->
												<td> <a href="장바구니 아이템 수량 빼기.my"><img src="경로경로경로/minus.png"></a>        
													 ${c.cart_amount}    
													 <a href="장바구니 아이템 수량 더하기.my"><img src="경로경로경로/plus.png"></a></td> 
												<td> <c:out value='${c.item_price * c.cart_amount}' /> </td>  <!-- 상품 총 가격 -->
												
												<td><a href="카트딜리트Action.my"><img src="엑스사진.png" style="width:0px;height:0px"></a></td> <!-- 제거 -->
											</tr>
										</table>
								</c:forEach>
								</c:if>

							
								<!-- 장바구니에 상품이 없는 경우 -->
								<c:if test="${listcount == 0}">
									<font size=5>장바구니에 담긴 상품이 없습니다.</font>
								</c:if>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>



	<!-- 배송지 / 결제하기 -->
	<div style="float: right; width:800px">
		<aside>
			<jsp:include page="cart_right.jsp" />
		</aside>
	</div>


</body>
</html>