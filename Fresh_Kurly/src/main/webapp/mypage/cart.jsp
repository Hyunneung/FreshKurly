<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<head>
<title>마이페이지 - 장바구니</title>
<style>
    tbody > tr:nth-child(1) > td:nth-child(2){width:10%}
    tbody > tr:nth-child(1) > td:nth-child(3){width:50%}
    tbody > tr:nth-child(1) > td:nth-child(4){width:20%}
    tbody > tr:nth-child(1) > td:nth-child(5){width:10%}
    tbody > tr:nth-child(1) > td:nth-child(6){width:10%}
    
    input { border:none; width:25px; text-align:center}
    #total {width:60px}
    input:focus {outline: none;}
    
    #cartItemMinus, #cartItemPlus, #cartItemDelete {cursor:pointer; width:10px; height:10px" }	
</style>
<script>
	$(function(){
		// url 쿼리스트링 제거
		history.replaceState({}, null, location.pathname);
		
		// 장바구니 상품 수량 1 감소
		$("body").on('click', '#cartItemMinus' , function(){
			var tr = $(this).parent().parent();
			var td1 = tr.find('td:nth-child(1)');
			var td4 = tr.find('td:nth-child(4)');
			var td5 = tr.find('td:nth-child(5)');
			var item_id = td1.find( 'input:nth-child(1)' ); // 아이템 아이디 .val()
			var item_price = td1.find( 'input:nth-child(2)' ); // 아이템 가격 .val()
			var cart_amount = td4.find( 'input:nth-child(2)' ); // 상품 수량 .val()
			var total = td5.find( 'input:nth-child(1)' ) ; // 아이템 총가격 - .val()
			if( cart_amount.val() == "1" ) { 
				alert("1개 미만의 수량은 선택할 수 없습니다.")
			} else {
				$.ajax({
					type : "POST",
					url: "myCartItemMinus.my",
					data: { "item_id": item_id.val()},
					success : function(data) { 
						if(data == 1) { // 수량 감소 성공
							// 화면에 보여지는 수량 감소
							var minusAmount = Number( cart_amount.val() )-1;
							cart_amount.val( minusAmount );
							// 화면에 보여지는 해당 상품 총액 감소
							var total = Number( total.val() ) - Number( item_price.val() );
							total.val( total );
						}
					},
					error : function(error){
						alert("수량 감소 에러 : " + error);
					}
				}) // ajax end
			}
		}) // 수량 감소 end
		
		// 장바구니 상품 수량 1 추가
		$("body").on('click', '#cartItemPlus', function(){
			var tr = $(this).parent().parent();
			var td1 = tr.find('td:nth-child(1)');
			var td4 = tr.find('td:nth-child(4)');
			var td5 = tr.find('td:nth-child(5)');
			var item_id = td1.find( 'input:nth-child(1)' ); // 아이템 아이디 .val()
			var item_price = td1.find( 'input:nth-child(2)' ); // 아이템 가격 .val()
			var cart_amount = td4.find( 'input:nth-child(2)' ); // 상품 수량 .val()
			var total = td5.find( 'input:nth-child(1)' ) ; // 아이템 총가격 - .val()
			$.ajax({
				type : "POST",
				url: "myCartItemPlus.my",
				data: { "item_id": item_id.val() },
				success : function(data) {
					if(data == 1) { // 수량 추가 성공
						// 화면에 보여지는 수량 증가
						var plusAmount =  Number( cart_amount.val() ) +1;
						cart_amount.val( plusAmount );
						// 화면에 보여지는 해당 상품 총액 증가
						var total = Number( total.val() ) + Number( item_price.val() );
						total.val( total );
					}	
				},
				error : function(error){
					alert("수량 추가 에러 : " + error);
				}
			}) // ajax end
		})
		
		// 장바구니 상품 완전 삭제
		$("body").on('click', '#cartItemDelete', function(){
			var tr = $(this).parent().parent();
			var td1 = tr.find('td:nth-child(1)');
			var item_id = td1.find( 'input:nth-child(1)' ); // 아이템 아이디 .val()
			if(confirm("정말 삭제하시겠습니까?")) {
				$.ajax({
					type : "POST",
					url: "myCartItemDelete.my",
					data: { "item_id": item_id.val() },
					success : function(data) {
						if(data == 1) { // 상품 삭제 성공
							alert('해당 상품이 삭제되었습니다.');
						}	
					}, // success end
					error : function(error){
						alert("상품 삭제 에러 : " + error);
					}
				}) // ajax end
			} // if(confirm) end
		}) // 장바구니 삭제 end
		
	}) // ready end
</script>
</head>
<body>
	<div class="row">
		<div class="col-md-8">
			<div class="myLeftCtn">
				<form class="text-center">
					<header style="font-size:18pt; margin-bottom:10px; margin-top:20px">장바구니</header>
					<h5>구매 금액 30,000원 이상 시 무료배송되며 30,000원 미만 구매 시 배송비 3,000원이 추가됩니다.</h5>
					<hr>
					
					<!-- 장바구니에 상품이 있는 경우 -->
					<c:if test="${listcount > 0}">
						<table class="table" frame=void>
							<tbody>
								<c:forEach var="c" items="${cartlist}">
									<tr>
										<td>
											<input type="hidden" name="item_id" id="item_id" value="${c.item_id}">
											<input type="hidden" name="item_price" id="item_price" value="${c.item_price}">
										</td>
										<td> <!-- 상품이미지 -->
											<img src="itemupload/${c.item_image}" style="width:80px; height:80px">
										</td> 
										<td> <!-- 상품명 -->
											${c.item_name}
										</td>
										<td> <!-- 상품수량 추가 제거 버튼 -->
											<input type="image" src="assets/image/mypage_cart/minus.png" id="cartItemMinus">
											<input type="text" name="cart_amount" id="cart_amount" value="${c.cart_amount}" readonly> <!-- 뷰 기능에 추가 : 수량이 1개이면 - 버튼 누르는거 비활성화 disabled -->
											<input type="image" src="assets/image/mypage_cart/plus.png" id="cartItemPlus">
										</td>	
										<td> <!-- 개별 상품 총가격 -->
											<input type="text" name="total" id="total" value="<fmt:formatNumber value="${c.item_price * c.cart_amount}" pattern="#,###"/>" readonly>
										</td> 
										<td> <!-- 상품 완전 삭제 버튼 -->
											<input type="image" src="assets/image/mypage_cart/cartdelete.png" id="cartItemDelete">
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
				
				
					<!-- 장바구니에 상품이 없는 경우 -->
					<c:if test="${listcount == 0}">
						<font size=5>장바구니에 담긴 상품이 없습니다.</font>
					</c:if>
				</form>
				
			</div>
		</div>
		
		
		<!-- 배송지 / 결제하기 -->
		<div class="col-md-4" style="width:800px">
			<aside>
				<jsp:include page="cart_right.jsp" />
			</aside>
		</div>
	</div>
</body>
</html>