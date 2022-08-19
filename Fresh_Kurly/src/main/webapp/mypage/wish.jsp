<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<head>
<title>마이페이지 - 찜한상품</title>
<style>
	tbody > tr:nth-child(1) > td:nth-child(2){width:20%}
    tbody > tr:nth-child(1) > td:nth-child(3){width:30%}
    tbody > tr:nth-child(1) > td:nth-child(4){width:30%}
    tbody > tr:nth-child(1) > td:nth-child(5){width:20%}
	
	input { border:none; width:25px; text-align:center}
	input:focus {outline: none;}    
	#item_price{width:60px}
    
	input[type=button] {width:80px; height:35px; color: white; border-radius: 12px; margin:5px; border:none}
	#addbtn {background:#28a745;}
	#deletebtn {background:#ffa807;}
</style>
<script>
	$(function(){
		// url 쿼리스트링 제거
		history.replaceState({}, null, location.pathname);
		
		// 찜한상품 장바구니에 담기
		$("body").on('click', '#addbtn', function(){
			var tr = $(this).parent().parent();
			var td1 = tr.find('td:nth-child(1)');
			var item_id = td1.find( 'input:nth-child(1)' ); // 아이템 아이디 .val()
			$.ajax({
				type : "POST",
				url: "myItemToCart.my",
				data: { "item_id": item_id.val() },
				success : function(result) {
					// result : 장바구니에 잘 담기면 1, 기존에 있어서 못담으면 0, 에러나면 -1
					if(result == 1) { // 장바구니 담기 성공
						if(confirm("해당 상품이 장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?")) {
							location.href = "myCart.my";
						} 
					} else if (result == 0) {
						if(confirm("해당 상품이 장바구니에 존재합니다. 장바구니로 이동하시겠습니까?")) {
							location.href = "myCart.my";
						} 
					} else {
						alert("장바구니 담기 에러입니다. 관리자에게 문의해주세요.")
					}
				}, // success end
				error : function(error){
					alert("찜한상품 -> 장바구니 담기 에러 : " + error);
				}
			}) // ajax end
		}) // 찜한상품 장바구니에 담기 end
		
		
		// 찜한 상품 삭제
		$("body").on('click', '#deletebtn', function(){
			var tr = $(this).parent().parent();
			var td1 = tr.find('td:nth-child(1)');
			var item_id = td1.find( 'input:nth-child(1)' ); // 아이템 아이디 .val()
			if(confirm("정말 삭제하시겠습니까?")) {
				$.ajax({
					type : "POST",
					url: "myWishItemDelete.my",
					data: { "item_id": item_id.val() },
					success : function(data) {
						if(data == 1) { // 상품 삭제 성공
							alert('해당 상품이 삭제되었습니다.');
							location.href="myWish.my";
						}
					}, // success end
					error : function(error){
						alert("상품 삭제 에러 : " + error);
					}
				}) // ajax end
			} // if(confirm) end
		}) // 찜한상품 삭제 end
		
	}) // ready end
</script>
</head>
<body>
<div class="col-md-8">
		<div class="myLeftCtn">
		<form class="text-center">
			<header style="font-size:18pt; margin-bottom:10px; margin-top:20px">찜한상품</header>
			<hr>
						
			<!-- 찜한상품이 있는 경우 -->
			<c:if test="${listcount > 0}">
				<table class="table" frame=void>
					<tbody>
						<c:forEach var="w" items="${wishlist}">
							<tr>
								<td>
									<input type="hidden" name="item_id" id="item_id" value="${w.item_id}">
								</td>
								<td> <!-- 상품이미지 -->
									<a href="itemInfo.item?item_id=${w.item_id}">
										<img src="itemupload/${w.item_image}" style="width:100px; height:100px">
									</a>
								</td>
								<td> <!-- 상품명 -->
									${w.item_name}
								</td>
								<td> <!-- 상품가격 -->
									<input type="text" name="item_price" id="item_price" value="<fmt:formatNumber value="${w.item_price}" pattern="#,###"/>" readonly>
								</td>
								<td> <!-- 찜한상품 장바구니 담기/삭제 버튼 -->
									<input type="button" name="addbtn" id="addbtn" value="담기"><br>
									<input type="button" name="deletebtn" id="deletebtn" value="삭제">
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
	
	
			<!-- 찜한상품이 없는 경우 -->
			<c:if test="${listcount == 0}">
				<h3 style="color:gray">찜한 상품이 없습니다.</h3>
			</c:if>
		</form>
	</div>
</div>		
</body>
</html>