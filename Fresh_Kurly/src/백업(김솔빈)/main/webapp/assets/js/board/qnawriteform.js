$(document).ready(function(){
   
   $("#upfile").change(function(){
      console.log($(this).val()) //c:\fakepath\upload.png
      var inputfile = $(this).val().split('\\');
      $('#filevalue').text(inputfile[inputfile.length - 1]);
   });
   
   // submit 버튼 클릭할 때 이벤트 부분
   $("form[name=qnaform]").submit(function() {
	
		if ($.trim($("#qna_pass").val()) == "") {
			alert("비밀빈호를 입력하세요");
			$("#qna_pass").focus();
			return false;
		}
		
		if ($.trim($("#qna_subject").val()) == "") {
         alert("제목을 입력하세요");
         $("#qna_subject").focus();
         return false;
      }
      
      if ($.trim($("#qna_content").val()) == "") {
         alert("내용을 입력하세요");
         $("#qna_content").focus();
         return false;
      }
	});//submit end
   
});//ready() end