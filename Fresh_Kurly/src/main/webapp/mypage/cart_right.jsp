<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<head>
<meta charset="utf-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- 주소검색 -->
<title>cart - right</title>
<style>
	textarea {border: none; resize: none;}
	/* textarea:focus { outline: none; } */
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
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					$('#post').val(data.zonecode);
					$('#address').val(fullRoadAddr);
				}
			}).open();
		}//function Postcode()
	})	
	
</script>
</head>
<body>
	<div class="col-md-4 mb-4" style="float:right">
		<!-- 배송지 -->
		<form action="" method="">
			<ul class="list-group margin-set z-depth-1">
				<li class="list-group-item d-flex justify-content-between lh-condensed">
					<div>
						<h5 class="my-0">배송지</h5>
						<div class="md-form tb-mr-bt">
							<strong>주소</strong><br>
							<input type="text" name="post" id="post" value="${member_post}" style="width:40px;">
							<textarea name="address" id="address" cols="30" rows="2">${member_address}</textarea>
						</div>
						<br>
						<button type="button" id="postcodebtn" class="btn btn-secondary btn-md waves-effect m-0">배송지변경</button>
					</div>
				</li>
			</ul>
		

		<!-- 금액 -->
			<ul class="list-group margin-set z-depth-1">
				<li class="list-group-item d-flex justify-content-between lh-condensed">
					<div>
						<small class="text-muted">상품 금액</small> <span class="text-muted"><fmt:formatNumber value="${totalAll}" pattern="#,###"/>원</span><br>
						<small class="text-muted">할인 금액</small> <span class="text-muted">0원</span><br>
						<small class="text-muted">배송비</small> <span class="text-muted">2,500원</span>
					</div>
				</li>
			</ul>


		<!-- 결제금액 결제하기 -->
			<ul class="list-group margin-set z-depth-1">
				<li class="list-group-item d-flex justify-content-between lh-condensed">
					<div>
						<h5 class="my-0">결제금액</h5>
						<strong><fmt:formatNumber value="${totalAll + 2500}" pattern="#,###"/></strong> <br>
						<button type="submit" id="paybtn" class="btn btn-secondary btn-md waves-effect m-0">결제하기</button>
					</div>
				</li>
			</ul>
		</form>	
		<!-- Cart -->
	</div>
</body>
</html>