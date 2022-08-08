<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="mainpage/header.jsp"/>
<title>item-page</title>
<style>
#buybtn {
 position: relative;
 bottom: 0px;
 left: 200px;
 width: 200px;
}
 #totalprice {
 float: left;
 }
 .수량조절기 {
 border: 0px;
 }
 .수량조절 {
 
 }
 .tdtitle {
 background: #f7f7f7;
 width: 15%;
 }
 .tdinfo {
 line-height: 110%;
 width: 35%;
 }
 td {
 padding: 18px;
 }
</style>
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
                          <div class="tab-pane active" id="pic-1"><img src="assets/image/fruits/깻잎.jpg" /></div>
                          <!-- 상품 사진 URI item_image -->
                        </div>
                    </div>
                    <div class="details col-md-6">
                        <h3 class="product-title">친환경 잎채소 깻잎 30g</h3> <!-- 제품 이름 item_name -->
                            <p class="product-description">상큼하고 쌉쌀한 향기 (1봉/30g)</p> <!-- 제품설명 item_intro -->
                            <h3 class="price"><span>1,590</span><span>원</span></h3>
                        <div class="action">
                            <a href="checkout.html" class="btn">장바구니</a> <!-- 클릭 시 장바구니에 담김 -->
                            <a href="checkout.html" class="btn"><span class="fa fa-heart"></span></a> <!-- 클릭 시 찜한 목록에 담김 -->
                            <hr class="col-md-12">
                            <span>구매수량</span><span class="수량조절">
                            <button class="수량조절기">-</button>
                            <span>0</span>
                            <button class="수량조절기">+</button>
                            </span>
                            <hr class="col-md-12">
                            <div>총 상품금액</div>
                            <h1 id="totalprice" class="price"><span>1,590</span><span>원</span></h1> <!-- 수량에 따라 값이 변함 -->
                            <a id="buybtn" href="checkout.html" class="btn">구매하기</a> <!-- 클릭 시 결제 api -->
                        </div>
                    </div>
                        <div class="col-sm-12 reviews_padding">
            <div class="reviews_wrapper">
			<hr>
			<table class="item_info">
			 <tr>
			 	<td class="tdtitle">배송</td>
			 	<td class="tdinfo">샛별배송<br>
			 	23시 전 주문시 내일 아침 7시 전 도착</td>
			 	<td class="tdtitle">판매단위</td>
			 	<td class="tdinfo">1봉</td>
			 </tr>
			 <tr>
			 	<td class="tdtitle">판매자</td>
			 	<td class="tdinfo">프레쉬컬리</td>
			 	<td class="tdtitle">중량/용량</td>
			 	<td class="tdinfo">30g</td>
			 </tr>
			 <tr>
			 	<td class="tdtitle">포장타입</td>
			 	<td class="tdinfo">냉장(종이포장)</td>
			 	<td class="tdtitle">유통기한</td>
			 	<td class="tdinfo">농산물로 별도의 유통기한은 없으나 가급적 빠르게 드시기 바랍니다.</td>
			 </tr>
			</table>
            </div>
        </div>
                     </div>
                    </div>
                </div>
            </div>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>