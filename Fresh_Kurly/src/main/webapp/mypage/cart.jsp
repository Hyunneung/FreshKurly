<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    
    tbody > tr:nth-child(1) > td:nth-child(3){width:150px}
    tbody > tr:nth-child(1) > td:nth-child(4){width:150px}
    tbody > tr:nth-child(1) > td:nth-child(5){width:80px}
    
    input { border:none; width:25px; text-align:center}
    #total {width:60px}
    input:focus {outline: none;}
    
    #cartItemMinus, #cartItemPlus, #cartItemDelete {cursor:pointer; width:10px; height:10px" }
    
    
    /* #okbtn {background:#8BC34A; font-weight:bold; color: white;
		padding-top:10px; padding-bottom:10px; margin:3px;
		border:0; border-radius: 12px; width:300px}
  		} */	
</style>
<script>
$(function(){
	// url 쿼리스트링 제거 - ajax post 방식이 안 돼서...........
	history.replaceState({}, null, location.pathname);
	
	// 장바구니 상품 수량 1 감소
	$("body").on('click', '#cartItemMinus' , function(){
		var tr = $(this).parent().parent();
		var td1 = tr.find('td:nth-child(1)');
		var td5 = tr.find('td:nth-child(4)');
		var td6 = tr.find('td:nth-child(5)');
		var item_id = td1.find( 'input:nth-child(1)' ); // 아이템 아이디 .val()
		var item_price = td1.find( 'input:nth-child(2)' ); // 아이템 가격 .val()
		var cart_amount = td5.find( 'input:nth-child(2)' ); // 상품 수량 .val()
		var total = td6.find( 'input:nth-child(1)' ) ; // 아이템 총가격 - .val()
		//alert( cart_amount.val() + " / " + typeof(cart_amount.val()) + " / " + cart_amount + " / " + typeof(cart_amount))
		if( cart_amount.val() == "1" ) { // 상품 0개 선택 불가 - 왜 안돼 ㅠㅠㅠㅠㅠㅠㅠ ㅡㅡ ㅠㅠ 
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
		var td5 = tr.find('td:nth-child(4)');
		var td6 = tr.find('td:nth-child(5)');
		var item_id = td1.find( 'input:nth-child(1)' ); // 아이템 아이디 .val()
		var item_price = td1.find( 'input:nth-child(2)' ); // 아이템 가격 .val()
		var cart_amount = td5.find( 'input:nth-child(2)' ); // 상품 수량 .val()
		var total = td6.find( 'input:nth-child(1)' ) ; // 아이템 총가격 - .val()
		
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
		var td4 = tr.find('td:nth-child(4)');
		var td5 = tr.find('td:nth-child(5)');
		var item_id = td1.find( 'input:nth-child(1)' ); // 아이템 아이디 .val()
		var item_price = td1.find( 'input:nth-child(2)' ); // 아이템 가격 .val()
		var cart_amount = td4.find( 'input:nth-child(2)' ); // 상품 수량 .val()
		var total = td5.find( 'input:nth-child(1)' ) ; // 아이템 총가격 - .val()
		
		if(confirm("정말 삭제하시겠습니까?")) {
			$.ajax({
				type : "POST",
				url: "myCartItemDelete.my",
				data: { "item_id": item_id.val() },
				success : function(data) {
					if(data == 1) { // 수량 추가 성공
						alert('해당 상품이 삭제되었습니다.');
					}	
				},
				error : function(error){
					alert("수량 추가 에러 : " + error);
				}
			}) // ajax end
		} // if(confirm) end
	})
})
</script>


</head>
<body>
	<section id="login">
		<div class="container">
			<div class="myCard">
				<div class="row">
					<div class="col-md-10">
						<div class="myLeftCtn">
							<form class="myForm text-center needs-validation" method="" action=""> <!-- 결제기능 하면 결제 폼으로 넘어가게 하기~ -->
								<header>장바구니</header>
								<hr>
								
								<!-- 장바구니에 상품이 있는 경우 -->
								<c:if test="${listcount > 0}">
									<input type="checkbox" name="selectAll" id="selectAll" value="전체선택" style="float:right">
									<table>
										<tbody>
											<c:forEach var="c" items="${cartlist}" varStatus="status">
												<tr>
													<td>
														<input type="hidden" name="item_id" id="item_id" value="${c.item_id}">
														<input type="hidden" name="item_price" id="item_price" value="${c.item_price}">
													</td>
												
													<td><input type="checkbox" name="select" id="select"></td> <!-- 상품 선택 -->
													<td>상품사진-${c.item_image }</td>
													<td>상품명-${c.item_name}</td>
													<!-- 상품수량 추가 제거 버튼 -->
													<td> <input type="image" src="assets/image/mypage_cart/minus.png" id="cartItemMinus">
														 <input type="text" name="cart_amount" id="cart_amount" value="${c.cart_amount}" readonly> <!-- 뷰 기능에 추가 : 수량이 1개이면 - 버튼 누르는거 비활성화 disabled -->
														 <input type="image" src="assets/image/mypage_cart/plus.png" id="cartItemPlus">
													<td><input type="text" name="total" id="total" value="<fmt:formatNumber value="${c.item_price * c.cart_amount}" pattern="#,###"/>" readonly></td>  <!-- 개별 상품 총가격 -->
													<!-- 상품 완전 삭제 -->
													<td><input type="image" src="assets/image/mypage_cart/cartdelete.png" id="cartItemDelete"></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									
									<!-- 배송지 / 결제하기 -->
									<div style="float: right; width:800px">
										<aside>
											<jsp:include page="cart_right.jsp" />
										</aside>
									</div>
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



	


</body>
</html>