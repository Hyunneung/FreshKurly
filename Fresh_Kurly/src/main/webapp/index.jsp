<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Fresh Kurly</title>
<meta charset="utf-8">

</head>
<body>
	<header class="header-area">
		<%@ include file="mainpage/header.jsp" %>
	</header>
	<!-- Header End -->
	
	
	<!-----------slider strat------------>
	<div id="banner-slider" class="xuSlider">
		<div class="container">
			<ul class="sliders">
				<!-- 이미지를 누르면 행사 페이지로 가는 기능도 생각중 -->
				<li><img src="assets/image/slider/1.avif" alt="banner1"></li>
				<li><img src="assets/image/slider/2.avif" alt="banner2"></li>
				<li><img src="assets/image/slider/3.avif" alt="banner3"></li>
				<li><img src="assets/image/slider/4.avif" alt="banner4"></li>
				<li><img src="assets/image/slider/5.avif" alt="banner5"></li>
				<li><img src="assets/image/slider/6.avif" alt="banner6"></li>
			</ul>
			<div class="direction-nav">
				<a href="javascript:;" class="prev icon-circle-arrow-left icon-4x"><i>Previous</i></a>
				<a href="javascript:;" class="next icon-circle-arrow-right icon-4x"><i>Next</i></a>
			</div>
			<div class="control-nav">
				<!-- 이유를 모르겠는데 ul에 넣으면 마지막 배너에서 첫배너로 안돌아옴;;;; -->
				<li data-id="1"><a href="javascript:;">1</a></li>
				<li data-id="2"><a href="javascript:;">2</a></li>
				<li data-id="3"><a href="javascript:;">3</a></li>
				<li data-id="4"><a href="javascript:;">4</a></li>
				<li data-id="5"><a href="javascript:;">5</a></li>
				<li data-id="6"><a href="javascript:;">6</a></li>
				
			</div>
		</div>
	</div>

	<script>
	$('.xuSlider').xuSlider();
</script>
	<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

	<!--------------- silder End ------------>
	
	
	<!-----------start fresh fruit area----------->
	<section id="fresh-fruit" class="tb-fruit">
		<div class="container">
			<div class="row">
				<div class=" col-md-6 text-center ">
					<div class="tb-effect-one">
						<img src="assets\image\fresh-top\1.jpg" alt="Avatar" class="image">
						<div class="overlay">
							<div class="text">
								<h2>Fresh & Pure Vegetables</h2>
								<p>20% off</p>
								<a href="#" class="btn">Order Now</a>
							</div>
						</div>
					</div>
				</div>
				<div class=" col-md-6 text-center ">
					<div class="tb-effect-two">
						<img src="assets\image\fresh-top\2.jpg" alt="Avatar" class="image">
						<div class="overlay">
							<div class="text">
								<h2>Fresh & Pure Fruits</h2>
								<p>30% Off</p>
								<a href="#" class="btn">Order Now</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!----------end------------->
	<section id="featured">
		<div class="container">
			<div class="col-md-12 wow slideInLeft">
				<h1>Feature Product</h1>
				<hr class="col-md-12">
			</div>
		</div>
		<div class="container">
			<div id="feature-product" class="row owlCarousel">
				<div class="item">
					<div class="product-grid">
						<div class="product-image">
							<a href="#" class="image"> <img class="pic-1"
								src="assets/image/feature_product/9.jpg"> <img
								class="pic-2" src="assets/image/feature_product/10.jpg">
							</a> <span class="product-sale-label">sale</span>
							<ul class="social">
								<li><a href="" data-tip="Add to Wishlist"><i
										class="fa fa-heart" aria-hidden="true"></i></a></li>
								<li><a href="" data-tip="Compare"><i
										class="fa fa-random" aria-hidden="true"></i></a></li>
							</ul>
							<a href="add-to-cart.html" class="add-to-cart">add to cart</a> <a
								href="#" class="quick-view">quick view</a>
						</div>
						<div class="product-content">
							<h3 class="title">
								<a href="#">Patato & Chukander</a>
							</h3>
							<div class="price">
								<span>$22.30</span> $18.50
							</div>
						</div>
					</div>
				</div>

				<div class="item">
					<div class="product-grid">
						<div class="product-image">
							<a href="#" class="image"> <img class="pic-1"
								src="assets/image/feature_product/7.jpg"> <img
								class="pic-2" src="assets/image/feature_product/8.jpg">
							</a>
							<ul class="social">
								<li><a href="" data-tip="Add to Wishlist"><i
										class="fa fa-heart"></i></a></li>
								<li><a href="" data-tip="Compare"><i
										class="fa fa-random"></i></a></li>
							</ul>
							<a href="add-to-cart.html" class="add-to-cart">add to cart</a> <a
								href="#" class="quick-view">quick view</a>
						</div>
						<div class="product-content">
							<h3 class="title">
								<a href="#">Onion & Radish</a>
							</h3>
							<div class="price">$25.50</div>
						</div>
					</div>
				</div>

				<div class="item">
					<div class="product-grid">
						<div class="product-image">
							<a href="#" class="image"> <img class="pic-1"
								src="assets/image/feature_product/5.jpg"> <img
								class="pic-2" src="assets/image/feature_product/6.jpg">
							</a> <span class="product-sale-label">sale</span>
							<ul class="social">
								<li><a href="" data-tip="Add to Wishlist"><i
										class="fa fa-heart"></i></a></li>
								<li><a href="" data-tip="Compare"><i
										class="fa fa-random"></i></a></li>
							</ul>
							<a href="add-to-cart.html" class="add-to-cart">add to cart</a> <a
								href="#" class="quick-view">quick view</a>
						</div>
						<div class="product-content">
							<h3 class="title">
								<a href="#">Tomato & Orange</a>
							</h3>
							<div class="price">
								<span>$22.30</span> $18.50
							</div>
						</div>
					</div>
				</div>

				<div class="item">
					<div class="product-grid">
						<div class="product-image">
							<a href="#" class="image"> <img class="pic-1"
								src="assets/image/feature_product/3.jpg"> <img
								class="pic-2" src="assets/image/feature_product/4.jpg">
							</a> <span class="product-sale-label">sale</span>
							<ul class="social">
								<li><a href="" data-tip="Add to Wishlist"><i
										class="fa fa-heart"></i></a></li>
								<li><a href="" data-tip="Compare"><i
										class="fa fa-random"></i></a></li>
							</ul>
							<a href="add-to-cart.html" class="add-to-cart">add to cart</a> <a
								href="#" class="quick-view">quick view</a>
						</div>
						<div class="product-content">
							<h3 class="title">
								<a href="#">Fig & Aaru</a>
							</h3>
							<div class="price">
								<span>$22.30</span> $18.50
							</div>
						</div>
					</div>
				</div>

				<div class="item">
					<div class="product-grid">
						<div class="product-image">
							<a href="#" class="image"> <img class="pic-1"
								src="assets/image/feature_product/1.jpg"> <img
								class="pic-2" src="assets/image/feature_product/2.jpg">
							</a> <span class="product-sale-label">sale</span>
							<ul class="social">
								<li><a href="" data-tip="Add to Wishlist"><i
										class="fa fa-heart"></i></a></li>
								<li><a href="" data-tip="Compare"><i
										class="fa fa-random"></i></a></li>
							</ul>
							<a href="add-to-cart.html" class="add-to-cart">add to cart</a> <a
								href="#" class="quick-view">quick view</a>
						</div>
						<div class="product-content">
							<h3 class="title">
								<a href="#">Apple & Orange</a>
							</h3>
							<div class="price">
								<span>$22.30</span> $18.50
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!-----------featurs end------------>

	<!-- START SECTION Fruit product -->
	<section id="fruit-product">
		<div class="container">
			<div class="col-md-12 wow slideInLeft">
				<h1>Fresh Fruits</h1>
				<hr class="col-md-12">
			</div>
		</div>
		<div class="container">
			<div id="fruit-pro" class="row owlCarousel">
				<div class="item">
					<div class="product-grid">
						<div class="product-image">
							<a href="#" class="image"> <img class="pic-1"
								src="assets/image/fruits/1.jpg"> <img class="pic-2"
								src="assets/image/fruits/2.jpg">
							</a> <span class="product-discount-label">33% off</span>
							<ul class="product-links">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-search"></i></a></li>
								<li><a href="#"><i class="fa fa-random"></i></a></li>
							</ul>
						</div>
						<div class="product-content">
							<a class="add-to-cart" href="add-to-cart.html"><i
								class="fa fa-shopping-bag"></i> ADD TO CART</a>
							<h3 class="title">
								<a href="#">Banana</a>
							</h3>
							<ul class="rating">
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
							</ul>
							<div class="price">
								$66.00 <span>$99.00</span>
							</div>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="product-grid">
						<div class="product-image">
							<a href="#" class="image"> <img class="pic-1"
								src="assets/image/fruits/3.jpg"> <img class="pic-2"
								src="assets/image/fruits/4.jpg">
							</a> <span class="product-discount-label">33% off</span>
							<ul class="product-links">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-search"></i></a></li>
								<li><a href="#"><i class="fa fa-random"></i></a></li>
							</ul>
						</div>
						<div class="product-content">
							<a class="add-to-cart" href="add-to-cart.html"><i
								class="fa fa-shopping-bag"></i> ADD TO CART</a>
							<h3 class="title">
								<a href="#">Banana</a>
							</h3>
							<ul class="rating">
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
							</ul>
							<div class="price">
								$66.00 <span>$99.00</span>
							</div>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="product-grid">
						<div class="product-image">
							<a href="#" class="image"> <img class="pic-1"
								src="assets/image/fruits/5.jpg"> <img class="pic-2"
								src="assets/image/fruits/6.jpg">
							</a> <span class="product-discount-label">33% off</span>
							<ul class="product-links">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-search"></i></a></li>
								<li><a href="#"><i class="fa fa-random"></i></a></li>
							</ul>
						</div>
						<div class="product-content">
							<a class="add-to-cart" href="add-to-cart.html"><i
								class="fa fa-shopping-bag"></i> ADD TO CART</a>
							<h3 class="title">
								<a href="#">Banana</a>
							</h3>
							<ul class="rating">
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
							</ul>
							<div class="price">
								$66.00 <span>$99.00</span>
							</div>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="product-grid">
						<div class="product-image">
							<a href="#" class="image"> <img class="pic-1"
								src="assets/image/fruits/7.jpg"> <img class="pic-2"
								src="assets/image/fruits/8.jpg">
							</a> <span class="product-discount-label">33% off</span>
							<ul class="product-links">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-search"></i></a></li>
								<li><a href="#"><i class="fa fa-random"></i></a></li>
							</ul>
						</div>
						<div class="product-content">
							<a class="add-to-cart" href="add-to-cart.html"><i
								class="fa fa-shopping-bag"></i> ADD TO CART</a>
							<h3 class="title">
								<a href="#">Banana</a>
							</h3>
							<ul class="rating">
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
							</ul>
							<div class="price">
								$66.00 <span>$99.00</span>
							</div>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="product-grid">
						<div class="product-image">
							<a href="#" class="image"> <img class="pic-1"
								src="assets/image/fruits/9.jpg"> <img class="pic-2"
								src="assets/image/fruits/10.jpg">
							</a> <span class="product-discount-label">33% off</span>
							<ul class="product-links">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-search"></i></a></li>
								<li><a href="#"><i class="fa fa-random"></i></a></li>
							</ul>
						</div>
						<div class="product-content">
							<a class="add-to-cart" href="add-to-cart.html"><i
								class="fa fa-shopping-bag"></i> ADD TO CART</a>
							<h3 class="title">
								<a href="#">Banana</a>
							</h3>
							<ul class="rating">
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
							</ul>
							<div class="price">
								$66.00 <span>$99.00</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!-- fruits section end -->

	<!----Vegetable strat section------>
	<section id="vegetable-product">
		<div class="container">
			<div class="col-md-12 wow slideInLeft">
				<h1>Fresh Vegetables</h1>
				<hr class="col-md-12">
			</div>
		</div>
		<div class="container">
			<div id="vegetable-pro" class="row owlCarousel">
				<div class="item">
					<div class="product-grid">
						<div class="product-image">
							<a href="#" class="image"> <img class="pic-1"
								src="assets/image/vegetable/1.jpg"> <img class="pic-2"
								src="assets/image/vegetable/2.jpg">
							</a> <span class="product-discount-label">33% off</span>
							<ul class="product-links">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-search"></i></a></li>
								<li><a href="#"><i class="fa fa-random"></i></a></li>
							</ul>
						</div>
						<div class="product-content">
							<a class="add-to-cart" href="add-to-cart.html"><i
								class="fa fa-shopping-bag"></i> ADD TO CART</a>
							<h3 class="title">
								<a href="#">Banana</a>
							</h3>
							<ul class="rating">
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
							</ul>
							<div class="price">
								$66.00 <span>$99.00</span>
							</div>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="product-grid">
						<div class="product-image">
							<a href="#" class="image"> <img class="pic-1"
								src="assets/image/vegetable/3.jpg"> <img class="pic-2"
								src="assets/image/vegetable/4.jpg">
							</a> <span class="product-discount-label">33% off</span>
							<ul class="product-links">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-search"></i></a></li>
								<li><a href="#"><i class="fa fa-random"></i></a></li>
							</ul>
						</div>
						<div class="product-content">
							<a class="add-to-cart" href="add-to-cart.html"><i
								class="fa fa-shopping-bag"></i> ADD TO CART</a>
							<h3 class="title">
								<a href="#">Banana</a>
							</h3>
							<ul class="rating">
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
							</ul>
							<div class="price">
								$66.00 <span>$99.00</span>
							</div>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="product-grid">
						<div class="product-image">
							<a href="#" class="image"> <img class="pic-1"
								src="assets/image/vegetable/5.jpg"> <img class="pic-2"
								src="assets/image/vegetable/6.jpg">
							</a> <span class="product-discount-label">33% off</span>
							<ul class="product-links">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-search"></i></a></li>
								<li><a href="#"><i class="fa fa-random"></i></a></li>
							</ul>
						</div>
						<div class="product-content">
							<a class="add-to-cart" href="add-to-cart.html"><i
								class="fa fa-shopping-bag"></i> ADD TO CART</a>
							<h3 class="title">
								<a href="#">Banana</a>
							</h3>
							<ul class="rating">
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
							</ul>
							<div class="price">
								$66.00 <span>$99.00</span>
							</div>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="product-grid">
						<div class="product-image">
							<a href="#" class="image"> <img class="pic-1"
								src="assets/image/vegetable/7.jpg"> <img class="pic-2"
								src="assets/image/vegetable/8.jpg">
							</a> <span class="product-discount-label">33% off</span>
							<ul class="product-links">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-search"></i></a></li>
								<li><a href="#"><i class="fa fa-random"></i></a></li>
							</ul>
						</div>
						<div class="product-content">
							<a class="add-to-cart" href="add-to-cart.html"><i
								class="fa fa-shopping-bag"></i> ADD TO CART</a>
							<h3 class="title">
								<a href="#">Banana</a>
							</h3>
							<ul class="rating">
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
							</ul>
							<div class="price">
								$66.00 <span>$99.00</span>
							</div>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="product-grid">
						<div class="product-image">
							<a href="#" class="image"> <img class="pic-1"
								src="assets/image/vegetable/9.jpg"> <img class="pic-2"
								src="assets/image/vegetable/10.jpg">
							</a> <span class="product-discount-label">33% off</span>
							<ul class="product-links">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-search"></i></a></li>
								<li><a href="#"><i class="fa fa-random"></i></a></li>
							</ul>
						</div>
						<div class="product-content">
							<a class="add-to-cart" href="add-to-cart.html"><i
								class="fa fa-shopping-bag"></i> ADD TO CART</a>
							<h3 class="title">
								<a href="#">Banana</a>
							</h3>
							<ul class="rating">
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
								<li class="fa fa-star"></li>
							</ul>
							<div class="price">
								$66.00 <span>$99.00</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!---- end section------>





	<!-- Footer Section -->
	<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-12 colr-font">
					<div class="row">
						<div class="col-md-3 text-left">
							<h3>상품 카테고리</h3>
							<ul>
								<li><a href="#">과일</a></li>
								<li><a href="#">야채</a></li>
								<li><a href="#">정육/계란</a></li>
								<li><a href="#">밀키트</a></li>
								<li><a href="#">냉장/냉동/간편식</a></li>
								<li><a href="#">통조림</a></li>
								<li><a href="#">수산/건어물</a></li>
								<li><a href="#">쌀/잡곡</a></li>
								<li><a href="#">우유/유제품</a></li>
								<li><a href="#">간식/떡/빙과</a></li>
								<li><a href="#">장/양념/소스</a></li>
							</ul>
						</div>
						
						<div class="col-md-3 text-left">
							<h3>게시판</h3>
							<ul>
								<li><a href="#">공지사항</a></li>
								<li><a href="#">상품문의</a></li>
							</ul>
						</div>
						
						<div class="col-md-3 text-left">
							<h3>Menu</h3>
							<ul>
								<li><a href="index.jsp">홈</a></li>
								<li><a href="">공지사항</a></li>
								<li><a href="">상품문의</a></li>
								<li><a href="">전체 상품</a></li>
							</ul>
						</div>
						<div class="col-md-3 text-left">
							<h3>중앙HTA - 자바기반 풀스택 웹개발자 과정 L2반 4조 </h3>
							<p>서울특별시 종로구 율곡로10길 105 디아망 4F(봉익동 10-1 디아망 4F) TEL : 070-8240-3211~3 FAX : 02-777-5407<br><br>
							사업자등록번호 : 104-81-59383 통신판매업신고번호 : 중구 065325 중앙HTA㈜<br><br>
							COPYRIGHT(C) HTA CO., LTD. ALL RIGHTS RESERVED.
							</p>
							<div class="social-links">
								<ul>
									<li><a href="#"><i class="fa fa-facebook"></i> </a></li>
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
									<li><a href="#"><i class="fa fa-google-plus "></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</footer>

	<!-- Footer Section End -->
	<!-- back-to-top scrtion -->
	<div class="top_button">
		<a class="back-to-top" style="cursor: pointer;" id="top-scrolltop"><i
			class="fa fa-angle-up"></i></a>
	</div>
	<!-- back-to-top scrtion End-->
	<!-- script files -->
	<!-- home silder -->
	<!----fetur strat---->
	<script>
$(document).ready(function(){
$('#feature-product').owlCarousel({
items: 4,
itemsDesktop:[1199,4],
itemsDesktopSmall:[992,3],
itemsTablet:[768,2],
itemsMobile:[450,1],
autoPlay: 6000,
pagination: false,
navigation: true,
navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>']
});
});

</script>
	<!------end features------>
	<!----fruit strat---->
	<script>
$(document).ready(function(){
$('#fruit-pro').owlCarousel({
items: 4,
itemsDesktop:[1199,4],
itemsDesktopSmall:[992,3],
itemsTablet:[768,2],
itemsMobile:[450,1],
autoPlay: 6000,
pagination: false,
navigation: true,
navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>']
});
});

</script>
	<!-------end----->
	<script>
$(document).ready(function(){
$('#vegetable-pro').owlCarousel({
items: 4,
itemsDesktop:[1199,4],
itemsDesktopSmall:[992,3],
itemsTablet:[768,2],
itemsMobile:[450,1],
autoPlay: 6000,
pagination: false,
navigation: true,
navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>']
});
});

</script>
	<!-------end----->


	<script src="assets/vendor/bootstrap/js/moment.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap-datetimepicker.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/custom.js"></script>

	<!-- script files -->
</body>
</html>
