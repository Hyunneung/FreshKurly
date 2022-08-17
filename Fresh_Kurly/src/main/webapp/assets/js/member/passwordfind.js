$(document).ready(function () {
	
	//입력한 이메일로 가입한 아이디를 DB에서 찾고
	//있으면 세션에 찾은 아이디값 저장 (OK), save_email_confirm_code에 인증코드 저장 (NOT OK), 이메일 발송 (OK)
	$("#request_for_code").click(function() {
		input_email = $.trim($('#find_by_email').val());
		input_id = $.trim($('#find_by_id').val());
		
		if (input_email == "") {
			alert("이메일을 입력해주세요");
			$('#find_email').focus();
			return false;
		} else if (input_id == ""){
			alert("아이디를 입력해주세요");
			$("#find_id").focus();
		} else {
			$("#confirm_email_ok").attr('type', 'text')
			$("#confirm_email_btn").attr('type', 'button')

			$.ajax({
				url: "passwordFindProcess.net",
				data: { "email": input_email, "id" : input_id} ,
				dataType: 'json',
				success: function(data) {
					alert(data.message);
					$("#save_email_confirm_code").val(data.verify_code);
				},// success end

			}) // ajax end
		} // if-else end
	});


	$(document).on('click','#confirm_email_btn',function() { // 이메일 인증번호 확인 버튼 클릭
		if ( $('#confirm_email_ok').val() == $('#save_email_confirm_code').val() ) {
			alert('인증 성공');
			location.replace("http://localhost:8088/Fresh_Kurly/login.net");
			window.open('member/changePW.jsp', '비밀번호 변경', 'width=430, height=250, location=no, status=no, scrollbars=yes');
		} else {
			alert('인증번호가 일치하지 않습니다. 다시 입력해주세요.');
		}
	}) // 이메일 인증번호 확인 버튼 end


});
