<!-- 마이페이지 기본페이지는 주문내역페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title> 마이페이지 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script> <!-- 제이쿼리 -->
<style>
	.nav-item > .nav-item::active {
	   background-color: rgb(103,149,9) !important;
	}
	
	.nav-link > .nav-link::active {
	   background-color: rgb(103,149,9) !important;
	}
	
	#myPageName {font-size:15pt}
</style>
<script>
	$(function(){
		// 마이페이지에 따라 왼쪽 네비게이션에 해당 페이지가 선택된다
		var myPage = "${myPage}";
		var pageList = ["order", "cart", "wish", "qna", "profile"];
		
		for(var index = 0; index < pageList.length; index++) {
			if(myPage == pageList[index]){
				$('.nav-pills> .nav-item > .nav-link').eq(index).addClass('active'); 
				$('.nav-pills> .nav-item > .nav-link').eq(index).addClass('bg-success'); 
			} else {
				$('.nav-pills> .nav-item > .nav-link').eq(index).removeClass('active');
				$('.nav-pills> .nav-item > .nav-link').eq(index).removeClass('bg-success');
			}
		} // for end
	}) // ready end	
</script>
</head>
<body>
	<header>  
		<jsp:include page="../mainpage/header.jsp"/>
	</header>
	
	
	<!-- 왼쪽 네비게이션 -->
	<div class='container-fluid' style="margin-top:50px; margin-bottom:300px">
		<div class="row">
			<div class="col-md-2 col-xs-4">
				<aside>
					<h1>마이컬리</h1>
					<ul class="nav nav-pills flex-column" id="myPageName">
						<li class="nav-item"><a class="nav-link active bg-success" href="myOrder.my">주문내역</a></li>
	                  	<li class="nav-item"><a class="nav-link " href="myCart.my">장바구니</a></li>
	                  	<li class="nav-item"><a class="nav-link" href="myWish.my">찜한상품</a></li>
	                 	<li class="nav-item"><a class="nav-link" href="myQna.my">상품문의</a></li>
	                 	<li class="nav-item"><a class="nav-link" href="myProfile.my">개인정보수정</a></li>
               		</ul>
				</aside>
			</div>
			
			
			
			<div class="col-sm-8 col-xs-4">
				<style>
						* {text-align: left}
						h5 {color:gray; font-weight:bold;}
						hr { border: 0;
						     height: 2px;
						     background: #ccc;}
				</style>		
				<jsp:include page="${myPage}.jsp"/>
			</div>
		</div>
	</div>
	
	
	
	<script src="assets/js/custom.js"></script>
	<footer id="footer">  
		<jsp:include page="../mainpage/footer.jsp"/>
	</footer>
</body>
</html>