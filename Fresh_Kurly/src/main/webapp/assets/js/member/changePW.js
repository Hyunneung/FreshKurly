$(function (){
	
	$('#changePW').submit(function () {
		var new_password = $('#new_password').val();
		
		
		if($('#new_password').val().length < 6){
			alert('비밀번호는 공백없이 6자리 이상 입력해주세요');
			return false;
		}
		
		
		if ($("#new_password").val() != $("#confirm_password").val()){
			alert('비밀번호가 일치하지않습니다. 확인해 주세요.');
			$('#new_password').val('');
			$('#confirm_password').val('');
			return false;
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
	
	

})//ready fucntion end