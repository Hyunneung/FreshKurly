<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
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
                            
                        <form id="idFind" class="myForm text-center needs-validation" >
							
                            <div class="form-group">
                                <i class="fa  fa-envelope"></i>
                                <input class="myInput" placeholder="Email" type="text" id="email" required>
                            </div>
							
                            <button id="ask_email" class="butt">인증코드 요청</button>
                        </form>
                        
                        <script>
                        $('#ask_email').click(function () {
                        	$(this).text('인증코드 입력');
                        })
                        </script>
                        
                        
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