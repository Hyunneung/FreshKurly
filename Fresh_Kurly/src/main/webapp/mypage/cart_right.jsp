<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- 주소검색 -->
<title>cart - right</title>
<style>
	* {font-size:15px}
	
	textarea {border: none; resize: none;}
	
	#postcodebtn, #paybtn {
		background:#28a745; width:100px; height:40px; color: white; font-weight:bold;
		border-radius:12px; margin:5px; border:none; text-align:center
	}
</style>

<script>
	$(function(){
		// 우편번호 버튼
		$('#postcodebtn').click(function() {
			Postcode(); // 우편번호 검색 함수 호출
		});
		function Postcode() { // 우편번호 검색
			new daum.Postcode({
				oncomplete: function(data) {
					console.log(data.zonecode)
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}
					$('#post').val(data.zonecode);
					$('#address').val(fullRoadAddr);
				}
			}).open();
		}//function Postcode()
	})	
</script>
</head>
<body>
	<div>
		<!-- 배송지 -->
		<form action="itemOrder.item" method="" style="width:250px; position: relative; top:100px;"> <!-- 결제기능 하면 결제 폼으로 넘어가게 하기~ -->
			<ul class="list-group">
				<li class="list-group-item">
					<div>
						<h5>배송지</h5>
						<div class="md-form tb-mr-bt">
							<strong>주소</strong><br>
							<input type="text" name="post" id="post" value="${member_post}" style="width:50px;">
							<textarea name="address" id="address" cols="27" rows="2">${member_address}</textarea>
						</div>
						<br>
						<button type="button" id="postcodebtn" >배송지변경</button>
					</div>
				</li>
			</ul>
		

			<!-- 금액 -->
			<ul class="list-group">
				<li class="list-group-item">
					<div>
						<strong>상품 금액</strong>
							<input type="text" name="totalALL" value="<fmt:formatNumber value="${totalAll}" pattern="#,###"/>원" style="width:70px">
						<br>
						<strong>배송비</strong> 
							<input type="text" name="delivery" value="<fmt:formatNumber value="${delivery}" pattern="#,###"/>원" style="width:70px">
					</div>
				</li>
			</ul>


			<!-- 결제금액 결제하기 -->
			<ul class="list-group">
				<li class="list-group-item">
					<div>
						<h5>결제금액</h5>
						<input type="text" name="totalALLDelivery" value="<fmt:formatNumber value="${totalAll + delivery}" pattern="#,###"/>원" style="width:70px">
						<br>
						<button type="submit" id="paybtn">결제하기</button>
					</div>
				</li>
			</ul>
		</form>	
	</div>
</body>
</html>