<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>상품등록</title>
<jsp:include page="../mainpage/header.jsp"/>

 <style>
 input[type=file] {
 	display: none;
 }
form[name=joinform] {font-family: Arial, Helvetica, sans-serif;}
form[name=joinform] * {box-sizing: border-box}

form[name=joinform] input{border-radius:3px;border:1px solid lightgray}
form[name=joinform] input[type=text] {
    width: 100%;
    padding: 10px;
    margin: 5px 0 5px 0;
    display: inline-block;
}

form[name=joinform] input[type=radio]{
	width: 5%;
    display: inline-block;
    border: none;
}

form[name=joinform] input[type=text]:focus{ /* 각 각 빈칸에 클릭 시 테두리 효과 */
  box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
    outline: none;
}

form[name=joinform] button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
   
    width: 100%;
    opacity: 0.8;
}

form[name=joinform] button:hover {
    opacity:1;
     cursor: pointer; /* 손가락 커서 모양 */
    
}
form[name=joinform]:focus{
   outline:none;
}

/* 취소 버튼*/
form[name=joinform] .cancelbtn {
    padding: 14px 20px;
    background-color: #f44336;
}

form[name=joinform] .cancelbtn, form[name=joinform] .submitbtn {
  float: left;
  width: 50%;
}

form[name=joinform] {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid lightgray;
    width: 600px; /* Could be more or less, depending on screen size */
    padding: 16px;
}

form[name=joinform] hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}
 
form[name=joinform] b + div{width: 100%;
    padding: 10px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;}

/* Clear floats */
form[name=joinform] .clearfix::after {
    content: "";
    clear: both;
    display: table; 
}

form[name=joinform] h1{text-align:center}

form[name=joinform] b {
	width: 100%;
	display: block
}

form[name=joinform] span{display:inline-block;margin-top:-20px;font-size:10px}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
   form[name=joinform] .cancelbtn, form[name=joinform] .signupbtn {
       width: 100%;
    }
}

#showImage > img {
display: none;
margin-top: 20px;

}

#showImage {
display: block;
}

#documentimg {
margin-bottom: 10px;
}

body > form > select {
    width: 100%!important;
    padding: 10px!important;
    margin: 5px 0 5px 0!important;
    display: inline-block!important;
}
</style> 

<script>
$(function(){
	 $('form[name=joinform]').submit(function() {
		 if (!$.isNumeric($("input[name='item_price']").val())) {
			 alert("상품가격은 숫자로 입력하세요.");
		 	 $("input[name='item_price']").val('').focus();
		 	 return false;
		 }
		 
		 if (!$.isNumeric($("input[name='item_stock']").val())) {
			 alert("재고수량은 숫자로 입력하세요.");
		 	 $("input[name='item_stock']").val('').focus();
		 	 return false;
		 }
			 
		 var image = $("#showImage > img").attr("src");
		 console.log(image);
		 if (image == undefined) {
			 alert("사진을 넣어주세요.");
			 return false;
		 }
	 }); // submit
		
})
</script>
</head>
<body>
	<form name = "joinform" action="itemInsertProcess.item" method="post"
		enctype="multipart/form-data"> 
	<h1>상품등록</h1>
	<hr>
	<b>상품번호</b>
	<input type="text" name="item_id" placeholder="Enter item_id" value="${item_id }" readOnly>
	
	<b>상품이름</b>
	<input type="text" name="item_name" placeholder="Enter item_name" maxlength="100" required>
	
	<b>상품가격</b>
	<input type="text" name="item_price" maxLength ="10" placeholder="Enter item_price" required>
	
	<b>상품설명</b>
	<input type="text" name="item_intro" maxLength ="200" placeholder="Enter item_intro" required>
	
	<b>카테고리</b>
	<select name="item_category" required>
		<option value="과일" selected>과일</option>
		<option value="야채">야채</option>
		<option value="정육/계란">정육/계란</option>
		<option value="밀키트">밀키트</option>
		<option value="냉장/냉동/간편식">냉장/냉동/간편식</option>
		<option value="통조림" >통조림</option>
		<option value="수산/건어물">수산/건어물</option>
		<option value="쌀/잡곡">쌀/잡곡</option>
		<option value="우유/유제품">우유/유제품</option>
		<option value="간식/떡/빙과">간식/떡/빙과</option>
		<option value="장/양념/소스">장/양념/소스</option>
	</select>
	
	<b>배송</b>
	<input type="text" name="item_deliver" placeholder="Enter item_deliver" maxlength="200" required>
	
	<b>판매자</b>
	<input type="text" name="item_seller" placeholder="Enter item_seller" maxlength="20" value="프레쉬컬리" required>
	
	<b>포장타입</b>
	<input type="text" name="item_package" placeholder="Enter item_packege" maxlength="100" required>
	
	<b>판매단위</b>
	<input type="text" name="item_unit" placeholder="Enter item_unit" maxlength="100" required>
	
	<b>중량/용량</b>
	<input type="text" name="item_weight" placeholder="Enter item_weight" maxlength="50" required>
	
	<b>유통기한</b>
	<input type="text" name="item_expiredate" placeholder="Enter item_expiredate" maxlength="200" required>
	
	<b>재고수량</b>
	<input type="text" name="item_stock" placeholder="Enter item_stock" maxlength="10" required>
	
	<b>상품이미지</b>
	<label>
		<img id="documentimg"src="assets/image/item/document.png" style="cursor:pointer" width="50px">
		<span id="showImage">
		   <img width="150px" height="150px">
		</span>

		<input type="file" name="item_image" accept="image/*">
	</label>
	
	<script>
	$("input[type=file]").change(function(event) {
		var inputfile = $(this).val().split("\\");
		var filename = inputfile[inputfile.length -1];
		
		var pattern = /(gif|jpg|jpeg|png)$/i; // i(ignore case)는 대소문자 무시를 의미
		
		if (pattern.test(filename)) {
			$('#filename').text(filename); // inputfile.length - 1 = 2
			
			var reader = new FileReader(); // 파일을 읽기 위한 객체 생성
			
			reader.readAsDataURL(event.target.files[0]);
			
			reader.onload = function() { // 읽기에 성공했을 때 실행되는 이빈트 핸들러
				// $('#showImage').html('<img width="20px" src="' + this.result + '">');
			$('#showImage > img').css("display", "block");
			$('#showImage > img').attr("src", this.result);
				
			};
		}

	}); // change()
	</script>
	
		<div class="clearfix">
			<button type="submit" class="submitbtn">상품등록</button>
			<button type="reset" class="cancelbtn">다시작성</button>
		</div>
        </form>
        
        <script src="assets/js/custom.js"></script>
   <footer id="footer">  
      <jsp:include page="../mainpage/footer.jsp"/>
   </footer>
</body>
</html>