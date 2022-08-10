<!-- 마이페이지 기본페이지는 주문내역페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title> 마이페이지 </title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
.nav-item > .nav-item::active {
   background-color: rgb(103,149,9) !important;
}

.nav-link > .nav-link::active {
   background-color: rgb(103,149,9) !important;
} 
</style>
</head>

<body>
	<header>  
		<jsp:include page="../mainpage/header.jsp"/>
		<%-- <jsp:include page="header.jsp" /><br> <!-- 마이페이지 헤더 --> --%>
	</header>
	
	
	<!-- 왼쪽 네비게이션 -->
	<div class='container' style="margin-top:10px;">
		<div class="row">
			<div class="col-sm-4">
				<aside>
					<h1>마이컬리</h1>
					<ul class="nav nav-pills flex-column">
						<li class="nav-item"><a class="nav-link active bg-success" href="myOrder.my">주문내역</a></li>
	                  	<li class="nav-item"><a class="nav-link " href="myCart.my">장바구니</a></li>
	                  	<li class="nav-item"><a class="nav-link" href="myWish.my">찜한상품</a></li>
	                 	<li class="nav-item"><a class="nav-link" href="myQna.my">상품문의</a></li>
	                 	<li class="nav-item"><a class="nav-link" href="myProfile.my">개인정보수정</a></li>
               		</ul>
				</aside>
			</div>
			<div class="col-sm-8" style="margin-bottom:5rem">
				<section>
					<jsp:include page="${myPage}.jsp"/>
				</section>
			</div>
		</div>
	</div>
	
	<script>
		var myPage = "${myPage}";
		var pageList = ["order", "cart", "wish", "qna", "profile"];
		
		for(var index = 0; index < pageList.length; index++) {
			if(myPage == pageList[index]){
				$('.nav-pills> .nav-item').eq(index).addClass('active');
			} else {
				$('.nav-pills> .nav-item').eq(index).removeClass('active');
			}
		}
	</script>
</body>
</html>