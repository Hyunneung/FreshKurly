<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인 페이지</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<!-- 네이버 소셜 로그인 스크립트 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<!-- 카카오 소셜로그인 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
	$(function() {
		// 회원가입 버튼 클릭 - 회원가입 페이지 이동
		$(".join").click(function() {
			location.href = "join.net";
		});
	
		// ID기억하기
		var id = '${id}';
		if (id) {
			$("#id").val(id);
			$("#remember").prop('checked', true);
		}
	})
</script>
<style>
	div {text-align: center}

	.form-control {width:500px; margin:auto;}
	
	a:link {text-decoration:none;}
	a:visited {text-decoration:none;}
	a:active {text-decoration:none;}
	a {color:black;}
	
	img {width:50px; height:50px}
	
	button {background:#8BC34A; font-weight:bold; color: white; font-size: 30px;
			padding-top:10px; padding-bottom:10px; margin-top:80px;
			border:0; border-radius: 12px;; width:500px;}

<<<<<<< HEAD
a:link {text-decoration:none;}
a:visited {text-decoration:none;}
a:active {text-decoration:none;}
a {color:black;}

img {width:50px; height:50px}

button {background:#8BC34A; font-weight:bold; color: white; font-size: 30px;
		padding-top:10px; padding-bottom:10px; margin:30px;
		border:0; border-radius: 12px; width:500px }
=======
>>>>>>> branch 'main' of https://github.com/ahslxj1993/Fresh_Kurly.git
		
</style>
</head>
<body>
<jsp:include page="../mainpage/header.jsp"/>
	<div class="container">
		<form name="loginform" action="loginProcess.net" method="post" class="border border-light p-5">
	  		<p class="h4 mb-4 text-center">로그인</p>
	  		<hr>
			<div class="form-group"> 
		    	<input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력해주세요" required style="width:700px">
		  	</div>
			
			<div class="form-group">
		    	<input type="password" class="form-control" name="pass" id="pass" placeholder="비밀번호를 입력해주세요" required style="width:700px">
		  	</div>
		  	
		  	<div class="form-group custom-control custom-checkbox" id="rememberID">
		  		<input type="checkbox" class="custom-control-input" id="remember" name="remember" value="store">
		  		<label class="custom-control-label" for="remember">id 기억하기</label>
		  	</div>
		  	
		  	<div class="form-group">
		  		<a href="idFind.net">아이디 찾기</a> | <a href="passwordFind.net">비밀번호 찾기</a>
		  	</div>
		  	
			<div class="clearfix">
				<button type="submit" class="submitbtn">로그인</button><br> <!-- form의 submit 기능하는 버튼 -->
				<button type="button" class="join">회원가입</button>
			</div>
			
			<hr>
			<!-- 소셜로그인 -->
			<div class="form-group">
		    	<p>SNS 계정을 이용해 로그인 하세요</p>
		    	<input type="hidden" name="social" id="social"> <!-- 가입한 SNS가 무엇인지 저장된다 --> 
		    	<input type="hidden" name="socialId" id="socialId">
		    	<input type="hidden" name="socialName" id="socialName">
		    	<input type="hidden" name="socialEmail" id="socialEmail">
		    	
		    	<!-- 네이버 -->
		    	<span id="naver_id_login">
					<a id="naverIdLogin_loginButton" href="javascript:void(0)">
		    		<img src="image/naver_icon.png"></a>
		    	</span>
		    	<script type="text/javascript">
				  	var naver_id_login = new naver_id_login("yHYUIvS1fkCDmqPirp2p", "http://localhost:8088/Fresh_Kurly/login.net");
				  	var state = naver_id_login.getUniqState();
				  	naver_id_login.setState(state);
				  	naver_id_login.init_naver_id_login();
				  	naver_id_login.get_naver_userprofile("naverSignInCallback()");  // 네이버 사용자 프로필 조회	
		    		  
					// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
					function naverSignInCallback() {
					    var email = naver_id_login.getProfileData('email');
					    var name = naver_id_login.getProfileData('name');
					   
					    $("#social").val("naver");
					    $("#socialId").val( email.split('@',1) );
					    $("#socialName").val(name);
					    $("#socialEmail").val(email);
						
						$("form").attr("action", "joinSocialProcess.net");
						$("form").submit();
				  }// 콜백함수 end
				</script>
	
	
				<!-- 카카오 -->
				<span id="kakao_id_login">
					<a id="kakao_login_btn" href="javascript:void(0)" onclick="onSignIn()">
					<img src="assets/image/member/kakao_icon.png"></a>
				</span>
				<span id="result"></span>
				<script type="text/javascript">
					$('#kakao_login_btn').click(function(event){
						event.preventDefault();
						Kakao.init('36709a7d5644f48cecd148b35020dc41');
						console.log(Kakao.isInitialized());
					
						Kakao.Auth.login({
								success : function() {
									Kakao.API.request({
										url : '/v2/user/me',
										success : function(result) {
											var account = result.kakao_account;
											var id = result.id;
											var nickname = account.profile.nickname;
											email = "";
											if (typeof account != 'undefined') {
												email = account.email;
											}
											// input:hidden에 저장
											$("#social").val("kakao");
											$("#socialId").val(id);
											$("#socialName").val(nickname);
											$("#socialEmail").val(email);
											$("form").attr("action", "joinSocialProcess.net") 
											$("form").submit();
											
										},
										fail : function(error) {
											alert('login success, but failed to request user information: '
													+ JSON.stringify(error))
										},
									})
								},
								fail : function(err) {
									alert('failed to login: '
											+ JSON.stringify(err))
								},
							})
					}) // click end
				</script>
		  	</div>
		</form>
	</div>
</body>
</html>