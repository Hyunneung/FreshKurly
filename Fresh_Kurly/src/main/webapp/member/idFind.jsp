<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ID 찾기</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="assets/js/member/idfind.js"></script> 
</head>
<body>

<header>
<jsp:include page="/mainpage/header.jsp"/>
</header>

<div id="banner-category" style="background:#9f7e1c8c;">
		<div class="container">
				<div class="col-md-12 text-center text-heading ">
				<h1>ID찾기</h1>
			</div>
		</div>
</div>
	
	
<section id="login"> 
    <div class="container">
            <div class="myCard">
                <div class="row">
                    <div class="col-md-6">
                        <div class="myLeftCtn">
                            
                            <!-- 이메일 -->
								<div class="md-form tb-mr-bt">
									<label for="find_email" style="font-size: 10pt">
									<i class="fa  fa-envelope"></i>이메일
									</label>
									<input type="text" name="find_email" id="find_email" class="form-control" placeholder="예: freshkurly@kurly.com" required>
									
									<input type="button" value="이메일 인증" id="request_for_confirm_id">
									<input type="hidden" name="confirm_email_ok" id="confirm_email_ok"
									class="form-control" placeholder="인증번호 입력"
									maxlength="6" required>
									<input type="hidden" id="confirm_email_btn" value="인증번호 확인 버튼">
									<input type="hidden" name="save_email_confirm_code" id="save_email_confirm_code"> <!-- ajax로 넘어온 인증번호 저장 hidden으로 바꾸기 -->
								</div>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="myRightCtn">
                                <div class="box"><header>ID 찾기</header>
                                
                                <p style="color:white">회원 가입시 사용한 이메일을 입력하세요.<br>
                                해당 연락처로 인증코드를 보냅니다.</p>
                                </div>
                                    
                        </div>
                    </div>
                </div>
            </div>
    </div>
  

</section>
</body>
</html>