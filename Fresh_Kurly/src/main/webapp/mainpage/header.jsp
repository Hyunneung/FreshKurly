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


<!-- 로고, 옆 버튼 부분 -->
		<div id="header-top" class="grocery-top">
			<div class="container">
				<div class="row">
					<nav class="navbar navbar-expand-md navbar-light  main-menu"
						style="box-shadow: none">
						<div class="container">
							<div class="row">
								<div class="col-md-3 tb-rght">
									<div class="logo">
										<a href="http://localhost:8088/Fresh_Kurly/">
											<img src="${pageContext.request.contextPath}/assets/image/logo/logo.png" alt="logo" class="logodark">
										</a>
									</div>
								</div>
								
							<%-- 세션에 id값이 없을경우 보여줄 버튼 --%>
							<c:if test="${empty id}">
								<div class="col-md-9 tb-lef-div text-right">
									<ul>										
										<li>
											<a href="login.net">
												<span>
												<i class="fa fa-user"></i>
												 로그인
												</span>
											</a>
										</li>
										
										<li>
											<a href="memberUpdate.net">
												<span>
												<i class="fa fa-pencil"></i>
												 회원가입
												</span>
											</a>
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
											<a href="찜한상품.html">
												<span>
												<i class="fa fa-heart"></i>
												찜한상품
												</span>
											</a>
										</li>
										
										<li>
											<a href="장바구니.html">
												<span> 
													<i class="fa fa-shopping-cart"></i>
													 장바구니
												</span>
											</a>
										</li>
								<%-- 그 와중 세션에 id 값이 admin일 경우 보여줄 버튼 --%>		
								<c:if test="${id=='admin'}">
									<li>
											<a href="회원리스트.html">
												<span>
												<i class="fa fa-forward"></i>
												회원리스트
												</span>
											</a>
										</li>
										
										<li>
											<a href="상품리스트.html">
												<span> 
													<i class="fa fa-product-hunt"></i>
													 상품리스트
												</span>
											</a>
										</li>
										
										<li>
											<a href="문의답변.html">
												<span> 
													<i class="fa fa-keyboard-o"></i>
													 문의 답변하기
												</span>
											</a>
										</li>
								</c:if>		
										
										<li>
											<a href="나의정보.html">
												<span> 
													<i class="fa fa-info-circle"></i>
													 나의 정보 수정하기
												</span>
											</a>
										</li>
										
										
										<li>
											<a href="logout.net">
												<span> 
													<i class="fa fa-sign-out"></i>
													 로그아웃
												</span>
											</a>
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
							<!--mobile Menu  -->

							<div id="mySidenav" class="sidenav">
								<div class="menu_slid_bg">
									<a href="javascript:void(0)" class="closebtn"
										onclick="closeNav()">×</a>

									<div class="col-sm-12" style="padding: 0px;">
										<h3>Menu</h3>

										<ul class="accordion" id="accordion-category">
											<li class="panel mobile_menu_li"><a href="index.jsp">
													Home</a></li>
											<li class="panel mobile_menu_li"><a href="category.html">Category</a>
											
											</li>
											<li class="panel mobile_menu_li"><a href="product.html">
													Product</a></li>
											<li class="panel mobile_menu_li"><a href="blog.html">
													Blog</a></li>
											<li class="panel mobile_menu_li"><a href="contact.html">contact</a>
											</li>
										</ul>
										<div class="clear"></div>
									</div>

								</div>
							</div>

							<span class="menu_open" onclick="openNav()">&#9776; Menu</span>
							<!-- mobile Menu  end-->
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
									<li class="nav-item active"><a href="index.jsp"
										class="nav-link">Home</a></li>

									<li class="nav-item dropdown-colr"><a href="#about"
										class="nav-link">전체 카테고리</a>
										<ul class="dropdown-menu">
											<li class="nav-item"><a href="category.html"
												class="nav-link">과일</a></li>
											<li class="nav-item"><a href="category.html"
												class="nav-link">야채</a></li>
											<li class="nav-item"><a href="category.html"
												class="nav-link">정육/계란</a></li>
											<li class="nav-item"><a href="category.html"
												class="nav-link">밀키트</a></li>
											<li class="nav-item"><a href="category.html"
												class="nav-link">냉장/냉동/간편식</a></li>
											<li class="nav-item"><a href="category.html"
												class="nav-link">통조림</a></li>
											<li class="nav-item"><a href="category.html"
												class="nav-link">수산/건어물</a></li>
											<li class="nav-item"><a href="category.html"
												class="nav-link">쌀/잡곡</a></li>
											<li class="nav-item"><a href="category.html"
												class="nav-link">우유/유제품</a></li>
											<li class="nav-item"><a href="category.html"
												class="nav-link">간식/떡/빙과</a></li>
											<li class="nav-item"><a href="category.html"
												class="nav-link">장/양념/소스</a></li>
										</ul></li>
									
									<li class="nav-item"><a href="blog.html" class="nav-link">공지사항</a></li>
									
									<li class="nav-item"><a href="contact.html"
										class="nav-link">상품 문의</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="collapse navbar-collapse">
								<form class="form-inline my-2 my-lg-0 mx-auto">
									<input class="form-control" type="search"
										placeholder="Search for products..." aria-label="Search">
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


