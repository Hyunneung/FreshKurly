<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Fresh Kurly</title>
<meta charset="utf-8">
<%@ include file="header.jsp" %>

<script>
$(function () {
	
    // 찜한상품
    $("body").on('click', '.addWish', function(){
    	var li = $(this).parent();
		var item_id = li.find('input:nth-child(1)'); // 아이템 아이디 .val()
		//var item_id = td1.find( 'input:nth-child(1)' ); // 아이템 아이디 .val()
		//var item_id = $('input[type=hidden]');
    	
    	$.ajax({
				type : "POST",
				url: "myWishItemAdd.my",
				data: { "item_id": item_id.val() },
				success : function(result) {
					// result : 장바구니에 잘 담기면 1, 기존에 있어서 못담으면 0, 에러나면 -1
					if(result == 1) { // 장바구니 담기 성공
						if(confirm("해당 상품이 찜한상품에 추가되었습니다. 찜한상품으로 이동하시겠습니까?")) {
							location.href = "myWish.my";
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
		
})

</script>
</head>
<body>
	
	
	<!-----------slider start------------>
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

	<!--------------- slider End ------------>
	
	
	<!-----------start fresh fruit area----------->
	<section id="fresh-fruit" class="tb-fruit">
		<div class="container">
			<div class="row">
				
				<!-- 만두 행사 -->
				<div class=" col-md-6 text-center ">
					<div class="tb-effect-one">
						<img src="assets\image\event-top\mandu_event.jpg" alt="Avatar" class="image">
						<div class="overlay">
							<div class="text">
								<h2>씹는 맛이 살아있는 만두</h2>
								<p>20% 할인 행사중</p>
								<a href="#" class="btn">살펴보기</a>
							</div>
						</div>
					</div>
				</div>
				<!-- 만두행사 끝 -->
				
				<!-- 우유행사  -->
				<div class=" col-md-6 text-center ">
					<div class="tb-effect-two">
						<img src="assets\image\event-top\milk_event.jpg" alt="Avatar" class="image">
						<div class="overlay">
							<div class="text">
								<h2>다 같은 우유가 아니다!</h2>
								<p>30% 할인 행사중</p>
								<a href="#" class="btn">살펴보기</a>
							</div>
						</div>
					</div>
				</div>
				<!-- 우유행사 끝 -->
				
			</div>
		</div>
	</section>
	<!----------end------------->
	
<!----야채------>
<%@include file="mainList.jsp" %>
<%---- 야채 section end------%>
	

<!-- Footer Section -->
	<!-- 맨 위로 올라가는 단추, 푸터가 들었어요 -->
	<footer id="footer">
		<jsp:include page="footer.jsp" />
	</footer>
	<!-- Footer Section End -->
	
	
	<!-- script files -->
	
	<!---- 상품 슬라이더 start---->
	<script>
$(document).ready(function(){
	$('.pro').owlCarousel({
		items: 4,
		itemsDesktop:[1199,4],
		itemsDesktopSmall:[992,3],
		itemsTablet:[768,2],
		itemsMobile:[450,1],
		autoPlay: 6000,
		pagination: true,
		navigation: true,
		navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>']
		});

});

</script>
	<!-------상품 슬라이더 end----->
	



	<script src="assets/vendor/bootstrap/js/moment.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap-datetimepicker.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/custom.js"></script>

	<!-- script files -->
</body>
</html>
