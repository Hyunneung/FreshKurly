$(function() {
	$("button.float-right").click(function(){
		location.href="NoticeWrite.bo";
	})
	
	$("#viewcount").change(function() {
		go(1);//보여줄 페이지를 1페이지로 설정합니다.
	});// change end
	
})