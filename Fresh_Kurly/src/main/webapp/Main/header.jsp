<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
											<img src="assets/image/logo/logo.png" alt="logo" class="logodark">
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

									</ul>
								</div>
								
								<%-- 그와중에 세션에 id 값이 admin일 경우 보여줄 버튼 --%>
								<c:if test="${id =='admin'}">
								
								<div class="col-md-9 tb-lef-div text-right">
									<ul>
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

									</ul>
								</div>
								
								</c:if>
							
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


