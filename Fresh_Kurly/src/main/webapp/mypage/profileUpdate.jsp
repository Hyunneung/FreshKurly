<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- 코어라이브러리 -->
<html lang="en">
<head>
<title> 개인정보 수정 - 비밀번호 확인 </title>
<meta charset="utf-8">
<script src="http://code.jquery.com/jquery-latest.js"></script> <!-- 제이쿼리 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- 주소검색 -->
</head>

<style>
img{width:30px; height:30px; opacity:0.5; cursor: pointer;}
</style>
<script>
	$(document).ready(function() {
			// 비밀번호, 비밀번호 확인 - 눈모양 클릭하면 텍스트 보여준다
			$("#img1").on('click', function() {
				$('#pass').toggleClass('active');
				if ($('#pass').hasClass('active')) {
					$('#pass').attr('type', 'text');
					$('#img1').attr('src', 'assets/image/pass_unshown.png')
				} else {
					$('#pass').attr('type', 'password');
					$('#img1').attr('src', 'assets/image/pass_show.png')
				}
			})
			$("#img2").on('click', function() {
				$('#pass2').toggleClass('active');
				if ($('#pass2').hasClass('active')) {
					$('#pass2').attr('type', 'text');
					$('#img2').attr('src', 'assets/image/pass_unshown.png')
				} else {
					$('#pass2').attr('type', 'password');
					$('#img2').attr('src', 'assets/image/pass_show.png')
				}
			})
			
			
			// 비밀번호 형식 검사
			var passcheck_value = ''; // pass 검사에 사용된 비밀번호를 저장할 변수
			var checkpass = false;
			function passcheck() {
				if (!($.trim($("#pass2").val()) == $.trim($("#pass").val()))) {
					$("#pass2_message").css('color', 'red').html("동일한 비밀번호를 입력하세요.");
				} else {
					$("#pass2_message").empty();
				}
			}
			$("#pass").on('keyup', function() {
				$("#pass_message").empty();
				// pass 형식 확인
				passcheck_value = $.trim($("#pass").val());
				if (passcheck_value.length < 6) {
					$("#pass_message").css('color', 'red').html("공백 없이 6자 이상 입력하세요.");
					checkpass = false;
					return;
				}
				passcheck();
			}) // pass 형식 확인 keyup end
			// pass2 검사 (비밀번호 확인)
			$("#pass2").on('keyup', function() {
				$("#pass2_message").empty();
				// pass2 == pass 확인
				passcheck();
			}) // pass2 검사 end

			
			//이메일 인증
			$("#emailchkbtn").click(function() {
				$("#certification_ok").attr('type', 'text')
				$("#certification_btn").attr('type', 'button')
	
				input_email = $.trim($('#email').val());
				if (input_email == "") {
					alert("이메일을 입력해주세요");
					$('#email').focus();
					return false;
				} else {
					$.ajax({
						url : "emailcheck.net",
						data : {
							"email" : input_email
						},
						success : function(rdata) {
							$("#save_email_num").val(rdata);
						} // success end
					}) // ajax end
				} // if-else end
			});
			$('#certification_btn').click(function() {
				if ($('#certification_ok').val() == $("#save_email_num").val()) {
					email_ok = $('#certification_ok').val();
					alert('인증 성공');
				} else {
					email_ok = "";
					alert('인증 실패');
				}
		}) // 인증번호 확인 버튼
		
		// 휴대폰 번호 바뀌었으면 중복확인 했는지 확인
		var phonecheck_value = ''; // 휴대폰번호 중복 검사에 사용된 휴대폰번를 저장할 변수
		var checkphone = false;
		// 휴대폰번호 중복 확인
		$('#phone').on('keyup', function() {
			if( $.trim($('#phone').val()) != "${member.member_phone}" ) {
				$("#phone_message").empty();
				$("#phone_message").html("휴대폰번호 중복검사를 해주세요.").css('color', 'red');
			} else {
				$("#phone_message").empty();
			}
		})
		$('#phonechkbtn').click(function() {
			if( $.trim($('#phone').val()) == "${member.member_phone}" ) {
				alert("기존과 동일한 번호입니다.")
			} else{
				var input_phone = $.trim($('#phone').val());
				if (input_phone == "") {
					alert("휴대폰번호를 입력해 주세요");
					$('#phone').focus();
					return false;
				} else if (isNaN(input_phone)) {
					alert("휴대폰번호를 숫자로만 입력해주세요");
					$('#phone').focus();
					return false;
				} else { // phone 중복 확인
					phonecheck_value = input_phone;
					$.ajax({
						url: "phonecheck.net",
						data: { "phone": phonecheck_value },
						success: function(rdata) {
							if (rdata == 0) { // DB에 해당 phone이 없는 경우
								alert("사용 가능한 휴대폰번호입니다.");
								$("#phone_message").html("사용 가능한 휴대폰번호입니다.").css('color', 'blue');
								phone_check_ok = "y";
							} else { // DB에 해당 phone이 있는 경우 (rdata == 1)
								alert("이미 등록된 휴대폰번호입니다.");
								$("#phone_message").html("이미 등록된 휴대폰번호입니다.").css('color', 'red');
								checkphone = false;
							}
						}
					}) // $.ajax end
			} // if-else end
			}
		}) // phonechkbtn click end 
		
		
		
		
		
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
					$('#postcode').val(data.zonecode);
					$('#address').val(fullRoadAddr);
					$('#post').val($('#postcode').val()); // 서블릿으로 넘겨줄 input
				}
			}).open();
		}//function Postcode()
		
		
		// ----------------------------------------회원정보 수정 버튼----------------------------------------
		// 1.비번 바꿨으면 비번확인이랑 일치하는지 2. 이메일 바꿨으면 중복확인 했는지 안 했는지 3.휴대폰 번호 바꿨으면 중복확인 했는지 안 했는지 검사!!
		// sumitbtn - 회원정보 수정 버튼
		$('form').submit(function() {
			// 1. 비밀번호, 비밀번호 확인 동일한지 확인
			if( $("#pass").val() != $("#pass2").val() ){
				alert("비밀번호를 확인 해주세요");
				return false;
			}
			// 2. 이메일 바꿨으면 중복확인 했는지 검사
			if( $("#email").val() != "${member.member_email}" && $("#emailchkok").val() == "n" ) {
				alert('변경된 이메일을 인증하세요');
				return false;
			}
			// 3.휴대폰 번호 바꿨으면 중복확인 했는지 검사
			if( $.trim($('#phone').val()) != "${member.member_phone}" && phone_check_ok != "y") {
				alert('변경된 휴대폰번호의 중복여부를 확인하세요');
				return false;
			}
			// 휴대폰번호 중복검사 확인
			var submit_phone_value = $.trim($('#phone').val())
			if ( phonecheck_value != '' ) {
				if (submit_phone_value != phonecheck_value) {
					alert('변경된 휴대폰번호의 중복여부를 확인하세요');
					return false;
				}
			}
		}) // 회원정보 수정 버튼 end
	
	
	
	
}); // ready() end
</script>

<!-- 비밀번호 제외한 모든 값은 기존 정보로 입력되어 있다 -->
<body>
	<section id="check-out">

		<!--Main layout-->
		<main class="tb-mt-pd">
			<div class="container wow fadeIn">
				<!--Grid row-->
				<div class="row">

					<!--Grid column-->
					<div class="col-md-8 tb-left">

						<!--Card-->
						<div class="card">

							<!--Card content-->
							<form action="myProfileUpdate.my" method="post" class="card-body" >

								<!-- 아이디 -->
								<div class="md-form tb-mr-bt">
									<label for="id" style="font-size: 10pt">아이디</label>
									<input type="text" name="id" id="id" class="form-control" value="${member.member_id}" readonly>
								</div>

								<!-- 새 비밀번호 -->
								<div class="md-form tb-mr-bt">
									<label for="pass" style="font-size: 10pt">새 비밀번호</label>
									<input type="password" name="pass" id="pass" class="form-control">
									<span><img src="assets/image/pass_show.png" id="img1"></span><br>
									<span id="pass_message"></span>
								</div>

								<!-- 새 비밀번호 확인 -->
								<div class="md-form tb-mr-bt">
									<label for="pass2" style="font-size: 10pt">새 비밀번호 확인</label>
									<input type="password" name="pass2" id="pass2" class="form-control">
									<span><img src="assets/image/pass_show.png" id="img2"></span><br>
									<span id="pass2_message"></span>
								</div>
								
								<!-- 이름 -->
								<div class="md-form tb-mr-bt">
									<label for="name" style="font-size: 10pt">이름</label>
									<input type="text" name="name" id="name" class="form-control" value="${member.member_name}" readonly>
								</div>

								<!-- 이메일 -->
								<div class="md-form tb-mr-bt">
									<label for="email" style="font-size: 10pt">이메일</label>
									<input type="text" name="email" id="email" value="${member.member_email}" placeholder="예: freshkurly@kurly.com" class="form-control" required>
									<input type="button" value="이메일 인증" id="emailchkbtn">
									<input type="hidden" name="certification_ok" id="certification_ok" 
										   class="form-control" placeholder="인증번호 입력" maxlength="6" required>
									<input type="hidden" id="certification_btn" value="인증번호 확인 버튼">
									<input type="hidden" name="save_email_num" id="save_email_num">
								</div>

								<!-- 휴대폰 -->
								<div class="md-form tb-mr-bt">
									<label for="phone" style="font-size: 10pt">휴대폰</label>
									<input type="text" name="phone" id="phone" class="form-control" value="${member.member_phone}" maxLength="11" required>
									<input type="button" value="중복확인" id="phonechkbtn"><br>
									<span id="phone_message"></span>
								</div>

								<!-- 주소 -->
								<div class="md-form tb-mr-bt">
									<label for="address" style="font-size: 10pt">우편번호</label>
									<input type="button" value="우편검색" id="postcodebtn" style="color: white; font-weight: bold"><br>
									<input type="text" class="form-control" name="postcode" id="postcode" 
										   value="${member.member_post}" maxLength="5" readonly><br>
									<input type="text" class="form-control" name="address" id="address"
										    value="${member.member_address}" required>
									<input type="hidden" size="5" name="post" id="post"><br> <!-- 서블릿으로 넘겨줄 우편번호 input (∵ #postcode 넘기면 null 반환됨) -->
								</div>

								<hr class="mb-4">
								<button class="btn btn-primary btn-lg btn-block" type="submit">회원정보수정</button>

							</form>
						</div>
						<!--/.Card-->
					</div>
					<!--Grid column-->

					<!--Grid column-->
					<div class="col-md-4 mb-4"></div>
					<!--Grid column-->

				</div>
				<!--Grid row-->

			</div>
		</main>
		<!--Main layout-->


	</section>


	<!-- back-to-top scrtion -->
<div class="top_button">
  <a class="back-to-top" style="cursor:pointer;" id="top-scrolltop"><i class="fa fa-angle-up"></i></a>
</div>
	<script src="assets/vendor/bootstrap/js/moment.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap-datetimepicker.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/custom.js"></script>
</body>
</html>
