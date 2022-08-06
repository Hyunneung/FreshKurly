<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html lang="en">
<head>
<title> 회원가입 페이지 </title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap-datetimepicker.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/responsive.css">
	<link rel="stylesheet" href="assets/vendor/owl.carousel/assets/owl.carousel.css"> 
	<link rel="stylesheet" href="assets/vendor/wow/animate.css"> 
	<link rel="stylesheet" type="text/css" href="assets/vendor/gallery/gallery.css" />
	<link rel="stylesheet" type="text/css" href="assets/vendor/gallery/lightbox.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,900&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Satisfy&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap" rel="stylesheet"> 
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

	<link rel="stylesheet" type="text/css" href="assets/vendor/barebone/css/bare-bone-slider.css">
	<link rel="stylesheet" type="text/css" href="assets/vendor/barebone/css/bare-bone-slider.min.css">
    <script src="assets/vendor/gallery/lightbox-plus-jquery.min.js"></script>
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="assets/vendor/wow/wow.min.js"></script>
	<script src="assets/vendor/slider/js/jquery.xuSlider.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script> <!-- 제이쿼리 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- 주소검색 -->
	<script src="js/join.js"></script> 
</head>
<style>
	/* #jumin1, #jumin2 {width:210px;} */
	img{width:30px; height:30px; opacity:0.5; cursor: pointer;}
</style>
<body>
<header>
	<jsp:include page="../mainpage/header.jsp"/>
</header>
	<section id="check-out">
		<main class="tb-mt-pd">
			<div class="container wow fadeIn">
				<div class="row">
					<div class="col-md-8 tb-left">
						<div class="card">
							<!--form -->
							<form name="joinform" action="joinProcess.net" method="post" class="card-body">
								<p class="h4 mb-4 text-center">필수입력사항</p><hr>
		
								<!-- 아이디 -->
								<div class="md-form tb-mr-bt">
									<label for="id" style="font-size: 10pt">아이디<font color='red'>*</font></label>
        								<input type="text" class="form-control" name="id" id="id" placeholder="5자 이상의 영문 혹은 영문과 숫자 조합" maxLength="12" required>
								        <input type="button" value="중복확인" id="idchkbtn"><br>
								        <span id="id_message1"></span> <!-- ajax 나오는 부분 -->
								        <span id="id_message2"></span>
								</div>

								<!-- 비밀번호 -->
								<div class="md-form tb-mr-bt">
									<label for="pass" style="font-size: 10pt">비밀번호<font color='red'>*</font></label>
							        <input type="password" class="form-control" name="pass" id="pass" placeholder="비밀번호를 입력해주세요" required>
							        <span><img src="assets/image/pass_show.png" id="img1"></span><br>
							        <span id="pass_message"></span>
								</div>

								<!-- 비밀번호 확인 -->
								<div class="md-form tb-mr-bt">
									<label for="pass2" style="font-size: 10pt">비밀번호확인<font color='red'>*</font></label>
							        <input type="password" class="form-control" name="pass2" id="pass2" placeholder="비밀번호를 한 번 더 입력해주세요" required>
							        <span><img src="assets/image/pass_show.png" id="img2"></span><br>
							        <span id="pass2_message"></span>
								</div>

								<!-- 이름 -->
								<div class="md-form tb-mr-bt">
									<label for="name" style="font-size: 10pt">이름<font color='red'>*</font></label>
							        <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해주세요" maxLength="5" required>
								</div>
								
								<!-- 주민번호 -->
								<div class="md-form tb-mr-bt">
									<label for="jumin1" style="font-size: 10pt">주민번호<font color='red'>*</font></label><br>
							        <input type="text" class="form-control last-nma-set" name="jumin1" id="jumin1" placeholder="주민번호 앞자리" maxLength="6" required>
									<span> - </span>
							        <input type="text" class="form-control" name="jumin2" id="jumin2" placeholder="주민번호 뒷자리" maxLength="7" required>
									<span id="jumin_message"></span>
								</div>
								
								<!-- 휴대폰 -->
								<div class="md-form tb-mr-bt">
									<label for="phone" style="font-size: 10pt">휴대폰<font color='red'>*</font></label>
							        <input type="text" class="form-control" name="phone" id="phone" maxLength="11" placeholder="숫자만 입력해주세요" required>
							        <input type="button" value="중복확인" id="phonechkbtn"><br>
							        <span id="phone_message"></span><br>
								</div>
								
								<!-- 이메일 -->
								<div class="md-form tb-mr-bt">
									<label for="email" style="font-size: 10pt">이메일<font color='red'>*</font></label>
									<input type="text" name="email" id="email" class="form-control" placeholder="예:freshkurly@kurly.com" maxLength="30" required>
									<input type="button" value="이메일 인증" id="emailchkbtn">
									<input type="hidden" name="certification_ok" id="certification_ok" class="form-control" placeholder="인증번호 입력" maxlength="6" required>
									<input type="hidden" id="certification_btn" value="인증번호 확인 버튼">
									<input type="hidden" name="save_email_num" id="save_email_num"> <!-- ajax로 넘어온 인증번호 저장 hidden으로 바꾸기 -->
									<input type="hidden" id="emailchkok" value='n'> <!-- 인증 성공실패 여부 -->
								</div>

								<!-- 주소 -->
								<div class="md-form tb-mr-bt">
									<label for="address" style="font-size: 10pt">우편번호<font color='red'>*</font></label>
						        	<input type="button" value="우편검색" id="postcodebtn" style="color:white; font-weight:bold"><br>
						        	<input type="hidden" class="form-control" name="postcode" id="postcode" maxLength="5" disabled required><br>                  
						        	<input type="hidden" class="form-control" name="address" id="address" required>
						        	<input type="hidden" size="5" name="post" id="post"><br> <!-- 서블릿으로 넘겨줄 우편번호 input (∵ #postcode 넘기면 null 반환됨) -->               
									<input type="hidden" id="postcheck_num" value="n">
								</div>
								
								<!-- 성별 -->
								<div class="md-form tb-mr-bt">
									<label style="font-size: 10pt">성별<font color='red'>*</font></label>
						        	<input type="radio" name="gender" value="M"><span>남자</span>
						        	<input type="radio" name="gender" value="F" ><span>여자</span>
						        	<input type="radio" name="gender" value="N" ><span>선택안함</span>
								</div>
								
								<!-- 약관 동의 -->
								<div class="md-form tb-mr-bt">
									<label style="font-size: 10pt">이용약관동의</label>
							        <input type="checkbox" name="clause" id="allchk" class="allcheck"><span>전체 동의합니다</span><br>
							        <input type="checkbox" name="chk" id="chk"><span>이용약관 동의(필수)</span><br>
							        <input type="checkbox" name="chk" id="chk"><span>개인정보 수집·이용 동의(필수)</span>
								</div>
								
								
								<!-- 가입하기 -->	
								<hr class="mb-4">
								<div class="clearfix">
									<button type="submit" class="submitbtn">가입하기</button>
								</div>	
							</form>
						</div>
					</div>
				</div>
			</div>
		</main>
	</section>


<!-- back-to-top scrtion -->
<div class="top_button">
  <a class="back-to-top" style="cursor:pointer;" id="top-scrolltop"><i class="fa fa-angle-up"></i></a>
</div>
	<script src="assets/vendor/bootstrap/js/moment.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap-datetimepicker.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/custom.js"></script>
</body>
</html>
