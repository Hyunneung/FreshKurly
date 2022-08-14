<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!-- 필요한 CSS/스크립트 넣어놓은 부분 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap-datetimepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/owl.carousel/assets/owl.carousel.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/wow/animate.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/gallery/gallery.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/gallery/lightbox.min.css" />
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Satisfy&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/barebone/css/bare-bone-slider.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/barebone/css/bare-bone-slider.min.css">
<script src="${pageContext.request.contextPath}/assets/vendor/gallery/lightbox-plus-jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/wow/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/slider/js/jquery.xuSlider.js"></script>

<!-- 필요한 CSS/스크립트 넣어놓은 부분 끝 -->
<style>
    .accordion {
        background-color: #ffffff;
        cursor: pointer;
        padding: 16px;
        width: 100%;
        outline: none;
        border: none;
        text-align: left;
        font-size: 11px;
        transition: 0.4s;
    }
 
    .actived, .accordion:hover {
        background-color: #f5f5f5;
        font-weight: bold;
    }
 
    .accordion:after {
        font-weight: bold;
        float: right;
        margin-left: 5px;
    }
 
 
    .panel {
        padding: 0 16px;
        background-color: #ffffff;
        max-height: 0;
        overflow: hidden;
        transition: max-height 0.2s ease-out;
        border-bottom: 1px solid #eeeeee;
    }
    .panel a {
    	color : black;
    	text-decoration : none;
    }
    
    .panel a:hover{
    	color : #8BC34A;
    }
</style>

<!-- 로고, 옆 버튼 부분 -->
		<div id="header-top" class="grocery-top">
			<div class="container">
				<div class="row">
					<nav class="navbar navbar-expand-md navbar-light  main-menu"
						style="box-shadow: none">
						<div class="container">
							<div class="row" style="padding-left:500px;">
								<div class="col-md-3 tb-rght">
									<div class="logo">
										<a href="http://localhost:8088/Fresh_Kurly/">
											<img src="${pageContext.request.contextPath}/assets/image/logo/logo.png"
											alt="logo" class="logodark" style="width:200px; height:100px">
										</a>
									</div>
								</div>
								
							<%-- 세션에 id값이 없을경우 보여줄 버튼 --%>
							<c:if test="${empty id}">
								<div class="col-md-9 tb-lef-div text-right">
									<ul>										
										<li>
											<button class="accordion" onClick="location.href='login.net'"
											style="color:black">
												<i class="fa fa-sign-in"></i>
													로그인 
											</button>
											<div class="panel">
											</div>
										</li>
										
										<li>
											<button class="accordion" onClick="location.href='join.net'"
											style="color:black">
												<i class="fa fa-pencil"></i>
													회원가입 
											</button>
											<div class="panel">
											</div>
										</li>
										
									</ul>
								</div>
							</c:if>
							
							<%-- 세션에 id 값이 있을경우 보여줄 버튼 --%>
							<c:if test="${!empty id}">
								<div class="col-md-9 tb-lef-div text-right">
									어서오세요, ${id }님 환영합니다!
									<ul>
										<li>
											<button class="accordion">
												<i class="fa fa-user"></i>
													마이페이지 
											</button>
											<div class="panel">
												<p><a href="myOrder.my">나의 주문내역</a></p>
												<p><a href="myCart.my">장바구니</a></p>
												<p><a href="myWish.my">찜한상품</a></p>
												<p><a href="myQna.my">상품문의</a></p>
												<p><a href="myProfile.my">개인정보수정</a></p>
												<p><a href="Withdraw.net">회원탈퇴</a></p>
											</div>
										</li>
										
								<%-- 그 와중 세션에 id 값이 admin일 경우 보여줄 버튼 --%>		
								<c:if test="${id=='admin'}">
									<li>
										<button class="accordion">
											<i class="fa fa-wrench"></i>
											관리자페이지
										</button>
											<div class="panel">
												<p><a href="NoticeList.ad">공지사항 관리</a></p>
												<p><a href="QnaList.ad">문의 응답하기</a></p>
												<p><a href="MemberList.ad">회원 리스트</a></p>
												<p><a href="itemList.item">상품 리스트</a></p>
											</div>
									</li>
								</c:if>		
								<%-- 세션 아이디 admin end --%>
								
										<li>
											<button class="accordion" onClick="location.href='logout.net'">
												<i class="fa fa-sign-out"></i>
												로그아웃 
											</button>
											<div class="panel">
											</div>
										</li>

									</ul>
								</div>
							</c:if>

							</div>
						</div>
					</nav>
				</div>
			</div>
		</div>
		<!-- 로고, 옆 버튼부분 끝 -->
		
		
		<!-- Start Navbar Area -->
		<div class="navbar-area">
			<div class="tb-responsive-nav">
				<div class="container">
					<div class="row">
						<div class="tb-responsive-menu">
							<div class="logo">
								<a href="index.jsp"> <img src="../assets/image/logo/logo.png"
									alt="logo" class="logodark">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tb-nav">
				<div class="container">

					<nav class="navbar navbar-expand-md ">
						<div class="row">
							<div class="col-sm-9 tb-menu-with">
								<ul id="nav-menu" class="navbar-nav">
									<li class="nav-item"><a href="index.jsp"
										class="nav-link">Home</a></li>

									<li class="nav-item dropdown-colr"><a href="#about"
										class="nav-link">전체 카테고리</a>
										<ul class="dropdown-menu">
											<li class="nav-item">
												<a href="show_by_category.item?category=과일"class="nav-link">과일</a>
											</li>
											<li class="nav-item">
												<a href="show_by_category.item?category=야채"class="nav-link">야채</a>
											</li>
											<li class="nav-item">
												<a href="show_by_category.item?category=정육/계란" class="nav-link">정육/계란</a>
											</li>
											<li class="nav-item">
												<a href="show_by_category.item?category=밀키트" class="nav-link">밀키트</a>
											</li>
											<li class="nav-item">
												<a href="show_by_category.item?category=냉장/냉동/간편식" class="nav-link">냉장/냉동/간편식</a>
											</li>
											<li class="nav-item">
												<a href="show_by_category.item?category=통조림" class="nav-link">통조림</a>
											</li>
											<li class="nav-item">
												<a href="show_by_category.item?category=수산/건어물" class="nav-link">수산/건어물</a>
											</li>
											<li class="nav-item">
												<a href="show_by_category.item?category=쌀/잡곡" class="nav-link">쌀/잡곡</a>
											</li>
											<li class="nav-item">
												<a href="show_by_category.item?category=우유/유제품" class="nav-link">우유/유제품</a>
											</li>
											<li class="nav-item">
												<a href="show_by_category.item?category=간식/떡/빙과" class="nav-link">간식/떡/빙과</a>
											</li>
											<li class="nav-item">
												<a href="show_by_category.item?category=장/양념/소스">장/양념/소스</a>
											</li>
										</ul>
									</li>
									
									<li class="nav-item">
										<a href="NoticeList.bo" class="nav-link">공지사항</a>
									</li>
									
									<li class="nav-item">
										<a href="QnaList.bo" class="nav-link">상품 문의</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="collapse navbar-collapse">
								<form class="form-inline my-2 my-lg-0 mx-auto" action="show_by_itemName.item" method="post">
									<input class="form-control" type="search"
										placeholder="검색어를 입력해주세요" aria-label="Search" name="item_name">
									<button class="tb-btn btn-success my-2 my-sm-0" type="submit">
										<i class="fa fa-search"></i>
									</button>
								</form>
							</div>
						</div>
					</nav>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<!-- End Navbar Area -->

<script>
    var acc = document.getElementsByClassName("accordion");
    var i;
 
    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function () {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.maxHeight) {
                panel.style.maxHeight = null;
            } else {
                panel.style.maxHeight = panel.scrollHeight + "px";
            }
        });
    }
    

</script>
