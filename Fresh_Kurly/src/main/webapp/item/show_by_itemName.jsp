<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>"<%=request.getParameter("item_name")%>"의 검색결과</title>
<%@ include file="../mainpage/header.jsp" %>

<style>
.product img {
width: 200px!important;
height : 200px!important;
}
</style>
</head>
<body>

<!-- header -->




<section class="product">
		<div class="container">
			<div class="col-md-12 wow slideInLeft">
				<h1>"<%= request.getParameter("item_name") %>" 의 검색결과</h1>
				<hr class="col-md-12">
			</div>
		</div>
		<div class="container">
			<div class="row owlCarousel pro">
				
			<c:forEach var="i" items="${itemList}">
			<!-- 상품 부분 -->
				<div class="item">
					<div class="product-grid">
						
						<div class="product-image">
							<!-- 상품 이미지 a태그 -->
							<a href="itemInfo.item?item_id=${i.item_id}" class="image">
							<img class="pic-1" src="itemupload/${i.item_image }">
							</a>
							
							<!-- 할인 메세지 -->
							<!--
							<span class="product-discount-label"></span>
							-->
							
							
							<!-- 찜하기 버튼 -->
							<ul class="product-links">
								<li><a href="myWishItemAdd.my"><i class="fa fa-heart"></i></a></li>
							</ul>
						</div>
						
						<div class="product-content">
							
							<!-- 상품이름 -->
							<h3 class="title">
								<a href="#">${i.item_name }</a>
							</h3>
							
							<!-- 상품 가격 -->
							<div class="price">
							<div>${i.item_price}</div>원
						</div>
					</div>
				</div>
			</div>
			</c:forEach>	
				
			
			
			
			
		</div>
	</div>
</section>



<script src="../assets/js/custom.js"></script>
<!-- footer -->
<script src="assets/js/custom.js"></script>
   <footer id="footer">  
      <jsp:include page="../mainpage/footer.jsp"/>
   </footer>
<!-- footer end -->
</body>
</html>