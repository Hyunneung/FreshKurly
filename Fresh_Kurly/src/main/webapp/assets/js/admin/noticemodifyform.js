$(document).ready(function(){
	
	// submit 버튼 클릭할 때 이벤트 부분
    $("form").submit(function() {
      
    	if ($.trim($("#notice_subject").val()) == "") {
			alert("제목을 입력하세요");
			$("#notice_subject").focus();
			return false;	
		}
		
		if ($.trim($("#notice_content").val()) == "") {
			alert("내용을 입력하세요");
			$("#notice_content").focus();
			return false;	
		}
		
		if ($.trim($("#notice_pass").val()) == "") {
			alert("비밀번호을 입력하세요");
			$("#notice_pass").focus();
			return false;	
		}
		
    })
	
});//ready() end
