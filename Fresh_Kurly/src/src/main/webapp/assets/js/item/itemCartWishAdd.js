// 아이템페이지 - 장바구니, 찜한상품
$(function(){
	
	/*
		1. itempage.jsp에 장바구니 버튼 추가, 찜하기 버튼 추가
		<button type="button" class="btn btn-primary btn-lg" id="itemCartAdd">장바구니</button> <!-- 클릭 시 장바구니에 담김 --> <!-- 백현능: 장바구니 기능 추가 -->
	    <button type="button" class="btn btn-primary btn-lg" id="itemWishAdd">♥</button> <!-- 클릭 시 찜한 목록에 담김 --> <!-- 백현능: 찜하기 기능 추가 -->
		
		2. input hidden에 item_id 값 추가
		3. 제이쿼리, itemCartWishAdd.js 스크립트 추가 
	*/
	
	// 장바구니에 아이템 추가
	$("#itemCartAdd").click(function(){
		$.ajax({
			type : "POST",
			url: "myItemToCart.my",
			data : { "item_id": $("#item_id").val() },
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
					} /*else { // 비회원 기능 이용 못하는거 서블릿에서 안 되면 여기서 알럿창 발생하게 하기
						alert("로그인하셔야 본 서비스를 이용하실 수 있습니다.");
						location.href = "login.net";
					}*/
				}, // success end
				error : function(error){
					alert("장바구니 담기 에러입니다. 관리자에게 문의해주세요.");
					console.log(error);
				}
		}) // ajax end
	}) // 장바구니 end
	
	
	// 찜한상품에 아이템 추가
	$("#itemWishAdd").click(function(){
		$.ajax({
			type : "POST",
			url: "myWishItemAdd.my",
			data : { "item_id": $("#item_id").val() },
			success : function(result) {
					// result : 찜한상품에 잘 담기면 1, 기존에 있어서 못담으면 0, 에러나면 -1
					if(result == 1) { // 찜한상품 담기 성공
						alert('해당 상품이 찜한상품에 추가되었습니다');
					} else if (result == 0) {
						if(confirm("해당 상품이 찜한상품에 존재합니다. 찜한상품 페이지로 이동하시겠습니까?")) {
							location.href = "myWish.my";
						}
					} else { // 비회원 기능 이용 못하는거 서블릿에서 안 되면 여기서 로그인으로 가게 하기
						alert("찜한상품 담기 에러입니다. 관리자에게 문의해주세요.");
						history.back();
					  /*else { // 비회원 기능 이용 못하는거 서블릿에서 안 되면 여기서 알럿창 발생하게 하기
						alert("로그인하셔야 본 서비스를 이용하실 수 있습니다.");
						location.href = "login.net";
					}*/		
					}
				}, // success end
				error : function(error){
					alert("찜한상품 담기 에러입니다. 관리자에게 문의해주세요.");
					console.log(error);
				}
		}) // ajax end
	}) // 찜한상품 end
	
	
}) // ready end 