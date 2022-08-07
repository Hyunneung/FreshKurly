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


	// 우편번호 버튼
	$('#postcodebtn').click(function() {
		$("#postcode").attr('type', 'text');
		$("#address").attr('type', 'text');
		$("#postcheck_num").val("y"); // 주소 입력 됐는지 검사하기 위해 $("#postcheck_num").val()을 변화시킨다
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


	// ID 검사
	var idcheck_value = ''; // id 검사에 사용된 아이디를 저장할 변수
	var checkid = false;
	// 1. ID 형식 확인
	$("#id").on('keyup', function() {
		$("#id_message1").empty(); // 처음에 pattern에 적합하지 않은 경우 메시지 출력 후 적합한 데이터를 입력해도 
		$("#id_message2").empty(); // 계속 같은 데이터를 출력하므로 이벤트 시작할 때마다 비워둡니다.
		$("#id_message2").css('color', 'red').html("아이디 기입 후 중복확인 버튼을 눌러주세요."); // ID중복확인 버튼 클릭 전까지 존재
		// ID 형식 확인
		var pattern = /^\w{5,12}$/; // [A-Za-z0-9_]의 의미가 \w
		if (!pattern.test($.trim($("#id").val()))) {
			$("#id_message1").css('color', 'red').html("5자 이상의 영문 혹은 영문과 숫자를 조합하세요.<br>");
			checkid = false;
			return;
		}
	}) // id 형식 확인 keyup end
	// 2. ID 중복 확인
	$('#idchkbtn').click(function() {
		var input_id = $.trim($('#id').val());
		if (input_id == "") {
			alert("아이디를 입력해주세요");
			$('#id').focus();
			return false;
		} else {
			idcheck_value = input_id;
			$.ajax({
				url: "idcheck.net",
				data: { "id": idcheck_value },
				success: function(rdata) {
					if (rdata == 0) { // DB에 해당 ID가 없는 경우
						$("#id_message2").html("사용 가능한 아이디입니다.").css('color', 'blue');
						alert("사용 가능한 아이디입니다.")
					} else { // DB에 해당 ID가 있는 경우 (1)
						alert("이미 등록된 아이디입니다.");
						$("#id_message2").html("이미 등록된 아이디입니다. 다른 아이디를 사용하세요.").css('color', 'red');
						checkid = false;
					}
				}
			}) // $.ajax end
		} // if-else end
	}) // idchkbtn click end 


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
	
	

	// 휴대폰번호 중복확인 버튼
	var phonecheck_value = ''; // 휴대폰번호 중복 검사에 사용된 휴대폰번를 저장할 변수
	var checkphone = false;
	// 휴대폰번호 중복 확인
	$('#phone').on('keyup', function() {
		$("#phone_message").empty();
		$("#phone_message").html("휴대폰번호 중복검사를 해주세요.").css('color', 'red');
	})
	$('#phonechkbtn').click(function() {
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
					} else { // DB에 해당 phone이 있는 경우 (rdata == 1)
						alert("이미 등록된 휴대폰번호입니다.");
						$("#phone_message").html("이미 등록된 휴대폰번호입니다.").css('color', 'red');
						checkphone = false;
					}
				}
			}) // $.ajax end
		} // if-else end
	}) // phonechkbtn click end 
	
	
	// 이메일 인증 - 클릭했을 때 이메일 중복 검사도 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
	$("#emailchkbtn").click(function() {
		input_email = $.trim($('#email').val());
		if (input_email == "") {
			alert("이메일을 입력해주세요");
			$('#email').focus();
			return false;
		} else {
			$("#certification_ok").attr('type', 'text')
			$("#certification_btn").attr('type', 'button')

			$.ajax({
				url: "emailcheck.net",
				data: { "email": input_email },
				success: function(rdata) {
					$("#save_email_num").val(rdata);
				} // success end
			}) // ajax end
		} // if-else end
	});
	$('#certification_btn').click(function(){ // 이메일 인증번호 확인 버튼 클릭
		if( $('#certification_ok').val() ==  $("#save_email_num").val()) {
			email_ok = $('#certification_ok').val();
			$("#emailchkok").val("y");
			alert('인증 성공');
	} else {
			email_ok = "";
			$("#emailchkok").val("n");
			alert('인증번호가 일치하지 않습니다. 다시 입력해주세요.');
		}
	}) // 이메일 인증번호 확인 버튼 end
	
	
	
	// 주민번호 형식확인
	$('#jumin1').keyup(function() { // 앞자리
		if ($.trim($('#jumin1').val()).length == 6) {
			pattern = /^[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|[3][01])$/;
			if (pattern.test($('#jumin1').val())) {
				$("#jumin_message").empty();
				$('#jumin2').focus();
			} else {
				$("#jumin_message").empty();
				$("#jumin_message").html("숫자 또는 형식에 맞게 입력하세요").css('color', 'red');
				$('#jumin1').val('').focus();
			}
		}
	}); 
	$('#jumin2').keyup(function() { // 뒷자리
		if ($.trim($('#jumin2').val()).length == 7) {
			pattern = /^[1234][0-9]{6}$/;
			if (pattern.test($('#jumin2').val())) {
				$("#jumin_message").empty();
				// 주민번호 뒷자리에 따라 성별 라디오버튼 자동 선택
				var c = $("#jumin2").val().substring(0, 1);
				var index = (c - 1) % 2;  // c=1,3이면 index=0 & c=2,4이면 index=1
				$("input[type=radio]").eq(index).prop("checked", true); 
			} else {
				$("#jumin_message").empty();
				$("#jumin_message").html("숫자 또는 형식에 맞게 입력하세요").css('color', 'red');
				$('#jumin2').val('').focus();
			}
		}
	});
	
	
	// 약관 체크박스
	// 1. 약관 전체 선택
	$('#allchk').change(function() {
		$('input:checkbox').prop('checked', $(this).is(':checked'))
	});
	// 2. 약관 다 선택되면 전체선택 하나라도 체크 안 되면 전체선택 해제 
	$(":checkbox:gt(0)").click(function() {
		if ($(":checkbox:gt(0):checked").length == 2) {
			$(":checkbox:eq(0)").prop("checked", true);
		} else {
			$(":checkbox:eq(0)").prop("checked", false);
		}
	});
	
	
	


	// sumitbtn - 가입하기 버튼
	$('form').submit(function() {
		// ID 중복검사 확인
		var submit_id_value = $.trim($('#id').val())
		if (submit_id_value != idcheck_value) { // submit 당시 id 값과 id 중복검사에 사용된 아이디를 비교합니다.
			alert("아이디 중복검사를 해주세요");
			return false;
		}
		// 비밀번호, 비밀번호 확인 동일한지 확인
		if( $("#pass").val() != $("#pass2").val()){
			alert("비밀번호를 확인 해주세요");
			return false;
		}
		// 휴대폰번호 중복검사 확인
		var submit_phone_value = $.trim($('#phone').val())
		if (submit_phone_value != phonecheck_value) {
			alert("휴대폰번호 중복검사를 해주세요");
			return false;
		}		
		if (email_ok != $("#save_email_num").val()) {
			alert('이메일을 인증하세요');
			return false;
		}
		if($("#emailchkok").val() == "n") {
			alert('이메일을 인증하세요');
			return false;
		}
		if( $("#postcheck_num").val() == 'n' ) {
			alert("주소를 입력하세요");
			return false;
		}
		// 약관 선택 검사 (체크박스)
		if ($('input:checkbox:checked').length != 3) {
			alert("필수약관에 동의해주세요");
			return false;
		}

	})

}); // ready() end