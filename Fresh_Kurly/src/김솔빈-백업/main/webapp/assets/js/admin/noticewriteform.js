$(document).ready(function(){
   
   
   // submit 버튼 클릭할 때 이벤트 부분
   $("form[name=noticeform]").submit(function() {
	
		if ($.trim($("#notice_pass").val()) == "") {
			alert("비밀빈호를 입력하세요");
			$("#notice_pass").focus();
			return false;
		}
		
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
	});//submit end
   
});//ready() end