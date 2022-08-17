<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>카테고리</title>
<%@ include file="../mainpage/header.jsp" %>

<style>
.product img {
width: 200px;
height : 200px;
}
</style>

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

<!-- header -->


<c:if test="${listcount > 0 }">
	<section class="product">
		<div class="container">
			<div class="col-md-12 wow slideInLeft">
				<h1>전체 상품 (총 상품의 개수 : <%=request.getAttribute("listcount") %>개 )</h1>
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
							<a href="itemInfo.item?item_id=${i.item_id }" class="image">
							<img class="pic-1" src="itemupload/${i.item_image }">
							</a>
							
							<!-- 할인 메세지 -->
							<!--
							<span class="product-discount-label"></span>
							-->
							
							
							<!-- 찜하기 버튼 -->
							
							<ul class="product-links">
								<li>
									<input type="hidden" value="${i.item_id}">
									<a href="#" class="addWish">
									<i class="fa fa-heart"></i>
									</a>
								</li>
							</ul>
						</div>
						
						<div class="product-content">
							
							<!-- 상품이름 -->
							<h3 class="title">
								<a href="#">${i.item_name }</a>
							</h3>
							
							<!-- 상품 가격 -->
							<div class="price">
							<div>
								<fmt:formatNumber value="${i.item_price }" pattern="#,###" />
							</div>원
						</div>
					</div>
				</div>
			</div>
			</c:forEach>	
			
		</div>
	</div>
	
		<ul class="pagination justify-content-center">
  		<c:if test="${page <= 1 }">
  			<li class="page-item">
  				<a class="page-link gray">이전&nbsp;</a>
  			</li>
  		</c:if>
  		<c:if test="${page > 1 }">
  			<li class="page-item">
<a href="show_all_item.item?page=${page-1}"
  				class="page-link">이전&nbsp;</a>
  			</li>
  		</c:if>
  	
  	 <c:forEach var="a" begin="${startpage }" end="${endpage }">
  		<c:if test="${a == page }">
  			<li class="page-item active">
  				<a class="page-link">${a }</a>
  			</li>
  		</c:if>
  		<c:if test="${a != page }">
  			<c:url var="go" value="show_all_item.item">
  				<c:param name="page" 		 value="${a}"/>
  			</c:url>
  			<li class="page-item">
  				<a href= "${go }" class="page-link">${a }</a>
  			</li>
  		</c:if>
  	 </c:forEach>
  	 
  	 <c:if test="${page >= maxpage }">
  	 	<li class="page-item">
  	 		<a class="page-link gray">&nbsp;다음</a>
  	 	</li>
  	 </c:if>
  	 <c:if test="${page < maxpage }">
  	 	<c:url var="next" value="show_all_item.item">
  				<c:param name="page" 		 value="${page+1}"/>
  			</c:url>
  	 	<li class="page-item">
  	 		<a href="${next}" class="page-link">&nbsp;다음</a>
  	 	</li>
  	 </c:if>
  	</ul>
	</section>
	
	
	
</c:if>

<c:if test="${listcount == 0 }">
	<section class="product">
		<div class="container">
			<div class="col-md-12 wow slideInLeft">
				<h1>등록된 상품이 없습니다</h1>
				<hr class="col-md-12">
			</div>
		</div>
	</section>

</c:if>




<script src="../assets/js/custom.js"></script>
<!-- footer -->
<script src="assets/js/custom.js"></script>


   <footer id="footer">  
      <jsp:include page="../mainpage/footer.jsp"/>
   </footer>
<!-- footer end -->
</body>
</html>