$(function () {
	
	$("#request_for_confirm_id").click(function() {
		input_email = $.trim($('#find_email').val());
		if (input_email == "") {
			alert("이메일을 입력해주세요");
			$('#find_email').focus();
			return false;
		} else {
			$("#confirm_email_ok").attr('type', 'text')
			$("#confirm_email_btn").attr('type', 'button')

			$.ajax({
				url: "idFindProcess.net",
				data: { "email": input_email },
				dataType: "json",
				success: function(rdata) {
					alert(rdata.certification);
					$("#save_email_confirm_code").val(rdata.certification);
				},// success end

			}) // ajax end
		} // if-else end
	});

	$('#confirm_email_btn').click(function() { // 이메일 인증번호 확인 버튼 클릭
		if ( $('#confirm_email_ok').val() == $('#save_email_confirm_code').val() ) {
			alert('인증 성공');
			location.href="member/showId.jsp";
		} else {
			alert('인증번호가 일치하지 않습니다. 다시 입력해주세요.');
		}
	}) // 이메일 인증번호 확인 버튼 end


});
