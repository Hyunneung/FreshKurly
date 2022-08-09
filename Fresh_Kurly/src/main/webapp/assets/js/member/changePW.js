$(function (){
	
	$('#changePW').submit(function () {
		var new_password = $('#new_password').val();
		
		if ($("#new_password").val() != $("#confirm_password").val()){
			alert('비밀번호를 확인해 주세요');
		} else {
			
			$.ajax({
				url:"changePassProccess.net",
				data:{"new_password" : new_password},
				dataType:'json',
				success : function(data){
					alert(data.message);
					window.close();
				} //success end	
			})//ajax end
		} //else end
	})//sbmbtn click function end
	
	
	/* 
	$(document).on('click','#confirm_email_btn',function() { // 이메일 인증번호 확인 버튼 클릭
		if ( $('#confirm_email_ok').val() == $('#save_email_confirm_code').val() ) {
			alert('인증 성공');
			window.open('member/changePW.jsp', '비밀번호 변경', 'width=500, height=600, location=no, status=no, scrollbars=yes');
			location.href="http://localhost:8088/Fresh_Kurly/login.net";
		} else {
			alert('인증번호가 일치하지 않습니다. 다시 입력해주세요.');
		}
	}) // 이메일 인증번호 확인 버튼 end
	*/
})//ready fucntion end