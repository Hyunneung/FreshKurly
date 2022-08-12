<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../mainpage/header.jsp"/>
<title>item-page</title>
<style>
.item_amount {
text-align: center;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
button:focus {
	border: none;
    outline:none;
}
#buybtn {
 float: right;
 bottom: 0px;
 width: 150px;
}
 #tp {
 float: left;
 }
 .수량 {
 width: 3em;
 }
 .수량조절기 {
 border: 0px;
 }
 
.수량조절 input:focus {outline: none;}

 .tdtitle {
 background: #f7f7f7;
 width: 108px;
 }
 .tdinfo {
 line-height: 110%;
 width: 400px;
 }
 td {
 padding: 18px;
 }
</style>
<script>
$(function() {
    
    $(".plus").click(function() {
    	
    	x = parseInt($(".item_amount").val());
    	$(".item_amount").val(x+1);
    	total = parseInt($("#totalprice").text());
    	$("#totalprice").text(total+${iteminfo.item_price}); // 1590 대신 item_price
    	
    });
    
	$(".minus").click(function() {
    	
    	x = parseInt($(".item_amount").val());
    	if (x == 1) {
    	} else {
    		$(".item_amount").val(x-1);
    		total = parseInt($("#totalprice").text());
        	$("#totalprice").text(total-${iteminfo.item_price});
    	}
    	
    })
    
    $("#keyup_price").keyup(function() {
    	x = parseInt($(".item_amount").val());
    	total = parseInt($("#totalprice").text());
    	$("#totalprice").text(x*parseInt(${iteminfo.item_price}));
    	
    	check = /^[0-9]+$/;
    	if (!check.test($(".item_amount").val())) {    
    		alert("숫자만 입력 가능합니다.");
    		$(".item_amount").val("1");
    	}
    })
    
    
    // 백현능: 장바구니, 찜한상품 기능 추가 -----------------------------------------------------
    // 장바구니
    $("body").on('click', '#addCart', function(){
			var divparent = $(this).parent();
			var item_id = divparent.find( 'input:nth-child(1)' ); // 아이템 아이디 .val()
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
						alert("로그인하셔야 본 서비스를 이용하실 수 있습니다.");
						console.log("장바구니 담기 에러");
					}
				}, // success end
				error : function(error){
					alert("상품 -> 장바구니 담기 에러 : " + error);
				}
			}) // ajax end
		}) // 상품 장바구니에 담기 end
    
    // 찜한상품
    $("body").on('click', '#addWish', function(){
	    	var divparent = $(this).parent();
			var item_id = divparent.find( 'input:nth-child(1)' ); // 아이템 아이디 .val()
			$.ajax({
				type : "POST",
				url: "myWishItemAdd.my",
				data: { "item_id": item_id.val() },
				success : function(result) {
					// result : 장바구니에 잘 담기면 1, 기존에 있어서 못담으면 0, 에러나면 -1
					if(result == 1) { // 장바구니 담기 성공
						if(confirm("해당 상품이 찜한상품에 추가되었습니다. 찜한상품으로 이동하시겠습니까?")) {
							location.href = "myCart.my";
						} 
					} else if (result == 0) {
						if(confirm("해당 상품이 찜한상품에 존재합니다. 찜한상품에 이동하시겠습니까?")) {
							location.href = "myWish.my";
						} 
					} else {
						alert("로그인하셔야 본 서비스를 이용하실 수 있습니다.");
						console.log("찜한상품 담기 에러");
					}
				}, // success end
				error : function(error){
					alert("상품 -> 찜한상품 담기 에러 : " + error);
				}
			}) // ajax end
		}) // 상품 찜한상품에 담기 end
    
    
});
</script>
</head>
<body>
<div id="banner-category" style="background:#9f7e1c8c;">
<div class="container">
	<div class="col-md-12 text-center text-heading ">
		<h1>Product:</h1>
	</div>
</div>
       </div> 
<!-- START SECTION Fruit product -->
<section id="product-page">
		
	<div class="container">
        <div class="card">
            <div class="container-fliud">
                <div class="wrapper row">
                    <div class="preview col-md-6">
                        <div class="preview-pic tab-content">
                          <div class="tab-pane active" id="pic-1"><img src="../itemupload/${iteminfo.item_image }" /></div>
                          <!-- 상품 사진 URI item_image -->
                        </div>
                    </div>
                    <div class="details col-md-6">
                        <h3 class="product-title">${iteminfo.item_name}</h3> <!-- 제품 이름 iteminfo.item_name -->
                            <p class="product-description">${iteminfo.item_intro }</p> <!-- 제품설명 iteminfo.item_intro -->
                            <h3 class="price"><span>${iteminfo.item_price }</span><span>원</span></h3>
                        <div class="action">
                        	<input type="hidden" value="${iteminfo.item_id}">
                            <a href="#" id="addCart" class="btn">장바구니</a> <!-- 클릭 시 장바구니에 담김 -->
                            <a href="#" id="addWish" class="btn"><span class="fa fa-heart"></span></a> <!-- 클릭 시 찜한 목록에 담김 -->
                            <hr class="col-md-12">
                            <span>구매수량</span><span class="수량조절">
                            <button class="수량조절기 minus">-</button>
                            	<input id="keyup_price" type="number" class="item_amount" min="1" max="99" value="1">
                            <button class="수량조절기 plus">+</button>
                            </span>
                            <hr class="col-md-12">
                            <div>총 상품금액</div>
                            <h1 id="tp" class="price"><span id="totalprice">${iteminfo.item_price }</span><span>원</span></h1> <!-- 수량에 따라 값이 변함 -->
                            <a id="buybtn" href="checkout.html" class="btn">구매하기</a> <!-- 클릭 시 결제 api -->
                        </div>
                    </div>
                        <div class="col-sm-12 reviews_padding">
            <div class="reviews_wrapper">
			<hr>
			<table class="iteminfo.item_info">
			 <tr>
			 	<td class="tdtitle">배송</td>
			 	<td class="tdinfo">${iteminfo.item_deliver }</td>
			 	<td class="tdtitle">판매단위</td>
			 	<td class="tdinfo">${iteminfo.item_unit }</td>
			 </tr>
			 <tr>
			 	<td class="tdtitle">판매자</td>
			 	<td class="tdinfo">${iteminfo.item_seller }</td>
			 	<td class="tdtitle">중량/용량</td>
			 	<td class="tdinfo">${iteminfo.item_weight }</td>
			 </tr>
			 <tr>
			 	<td class="tdtitle">포장타입</td>
			 	<td class="tdinfo">${iteminfo.item_package }</td>
			 	<td class="tdtitle">유통기한</td>
			 	<td class="tdinfo">${iteminfo.item_expiredate }</td>
			 </tr>
			</table>
            </div>
        </div>
                     </div>
                    </div>
                </div>
            </div>
</section>
<%-- <jsp:include page="footer.jsp"/> --%>
</body>
</html>