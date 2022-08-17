<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${not empty itemList1}">
<section class="product">
		<div class="container">
			<div class="col-md-12 wow slideInLeft">
				<h1>과일</h1>
				<hr class="col-md-12">
			</div>
		</div>
		<div class="container">
			<div class="row owlCarousel pro">
				
			<c:forEach var="i1" items="${itemList1}">
			<!-- 상품 부분 -->
				<div class="item">
					<div class="product-grid">
						
						<div class="product-image">
							<!-- 상품 이미지 a태그 -->
							<a href="itemInfo.item?item_id=${i1.item_id }" class="image">
							<img class="pic-1" src="itemupload/${i1.item_image }">
							</a>
							
							<!-- 할인 메세지 -->
							<!--
							<span class="product-discount-label"></span>
							-->
							
							
							<!-- 찜하기 버튼 -->
							
							<ul class="product-links">
								<li>
									<input type="hidden" value="${i1.item_id}">
									<a href="#" class="addWish">
									<i class="fa fa-heart"></i>
									</a>
								</li>
							</ul>
						</div>
						
						<div class="product-content">
							
							<!-- 상품이름 -->
							<h3 class="title">
								<a href="#">${i1.item_name }</a>
							</h3>
							
							<!-- 상품 가격 -->
							<div class="price">
							<div>
								<fmt:formatNumber value="${i1.item_price}" pattern="#,###"/>
							</div>원
						</div>
					</div>
				</div>
			</div>
			</c:forEach>	
				
		</div>
	</div>
</section>
</c:if>

<c:if test="${empty itemList1 }">
<section class="product">
		<div class="container">
			<div class="col-md-12 wow slideInLeft">
				<h1>과일은 해당 카테고리에 상품이 없습니다. 상품을 등록해주세요</h1>
				<hr class="col-md-12">
			</div>
		</div>
</section>
</c:if>





<c:if test="${not empty itemList2}">
<section class="product">
		<div class="container">
			<div class="col-md-12 wow slideInLeft">
				<h1>야채</h1>
				<hr class="col-md-12">
			</div>
		</div>
		<div class="container">
			<div class="row owlCarousel pro">
				
			<c:forEach var="i2" items="${itemList2}">
			<!-- 상품 부분 -->
				<div class="item">
					<div class="product-grid">
						
						<div class="product-image">
							<!-- 상품 이미지 a태그 -->
							<a href="itemInfo.item?item_id=${i2.item_id }" class="image">
							<img class="pic-1" src="itemupload/${i2.item_image }">
							</a>
							
							<!-- 할인 메세지 -->
							<!--
							<span class="product-discount-label"></span>
							-->
							
							
							<!-- 찜하기 버튼 -->
							
							<ul class="product-links">
								<li>
									<input type="hidden" value="${i2.item_id}">
									<a href="#" class="addWish">
									<i class="fa fa-heart"></i>
									</a>
								</li>
							</ul>
						</div>
						
						<div class="product-content">
							
							<!-- 상품이름 -->
							<h3 class="title">
								<a href="#">${i2.item_name }</a>
							</h3>
							
							<!-- 상품 가격 -->
							<div class="price">
							<div>
								<fmt:formatNumber value="${i2.item_price}" pattern="#,###"/>
							</div>원
						</div>
					</div>
				</div>
			</div>
			</c:forEach>	
				
		</div>
	</div>
</section>
</c:if>

<c:if test="${empty itemList2 }">
<section class="product">
		<div class="container">
			<div class="col-md-12 wow slideInLeft">
				<h1>야채는 해당 카테고리에 상품이 없습니다. 상품을 등록해주세요</h1>
				<hr class="col-md-12">
			</div>
		</div>
</section>
</c:if>






<c:if test="${not empty itemList3}">
<section class="product">
		<div class="container">
			<div class="col-md-12 wow slideInLeft">
				<h1>수산/건어물</h1>
				<hr class="col-md-12">
			</div>
		</div>
		<div class="container">
			<div class="row owlCarousel pro">
				
			<c:forEach var="i3" items="${itemList3}">
			<!-- 상품 부분 -->
				<div class="item">
					<div class="product-grid">
						
						<div class="product-image">
							<!-- 상품 이미지 a태그 -->
							<a href="itemInfo.item?item_id=${i3.item_id }" class="image">
							<img class="pic-1" src="itemupload/${i3.item_image }">
							</a>
							
							<!-- 할인 메세지 -->
							<!--
							<span class="product-discount-label"></span>
							-->
							
							
							<!-- 찜하기 버튼 -->
							
							<ul class="product-links">
								<li>
									<input type="hidden" value="${i3.item_id}">
									<a href="#" class="addWish">
									<i class="fa fa-heart"></i>
									</a>
								</li>
							</ul>
						</div>
						
						<div class="product-content">
							
							<!-- 상품이름 -->
							<h3 class="title">
								<a href="#">${i3.item_name }</a>
							</h3>
							
							<!-- 상품 가격 -->
							<div class="price">
							<div>
								<fmt:formatNumber value="${i3.item_price}" pattern="#,###"/>
							</div>원
						</div>
					</div>
				</div>
			</div>
			</c:forEach>	
				
		</div>
	</div>
</section>
</c:if>

<c:if test="${empty itemList3 }">
<section class="product">
		<div class="container">
			<div class="col-md-12 wow slideInLeft">
				<h1>수산/건어물은 해당 카테고리에 상품이 없습니다. 상품을 등록해주세요</h1>
				<hr class="col-md-12">
			</div>
		</div>
</section>
</c:if>







<c:if test="${not empty itemList4}">
<section class="product">
		<div class="container">
			<div class="col-md-12 wow slideInLeft">
				<h1>정육/계란</h1>
				<hr class="col-md-12">
			</div>
		</div>
		<div class="container">
			<div class="row owlCarousel pro">
				
			<c:forEach var="i4" items="${itemList4}">
			<!-- 상품 부분 -->
				<div class="item">
					<div class="product-grid">
						
						<div class="product-image">
							<!-- 상품 이미지 a태그 -->
							<a href="itemInfo.item?item_id=${i4.item_id }" class="image">
							<img class="pic-1" src="itemupload/${i4.item_image }">
							</a>
							
							<!-- 할인 메세지 -->
							<!--
							<span class="product-discount-label"></span>
							-->
							
							
							<!-- 찜하기 버튼 -->
							
							<ul class="product-links">
								<li>
									<input type="hidden" value="${i4.item_id}">
									<a href="#" class="addWish">
									<i class="fa fa-heart"></i>
									</a>
								</li>
							</ul>
						</div>
						
						<div class="product-content">
							
							<!-- 상품이름 -->
							<h3 class="title">
								<a href="#">${i4.item_name }</a>
							</h3>
							
							<!-- 상품 가격 -->
							<div class="price">
							<div>
								<fmt:formatNumber value="${i4.item_price}" pattern="#,###"/>
							</div>원
						</div>
					</div>
				</div>
			</div>
			</c:forEach>	
				
		</div>
	</div>
</section>
</c:if>

<c:if test="${empty itemList4 }">
<section class="product">
		<div class="container">
			<div class="col-md-12 wow slideInLeft">
				<h1>정육/계란은 해당 카테고리에 상품이 없습니다. 상품을 등록해주세요</h1>
				<hr class="col-md-12">
			</div>
		</div>
</section>
</c:if>
