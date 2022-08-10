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
                            
                        <form id="idFind" class="myForm text-center needs-validation" action="idFindProcess.net">
							
                            <div class="form-group">
                                <i class="fa  fa-envelope"></i>
                                <input class="myInput" placeholder="이메일을 입력하세요"
                                type="text" id="email" name="email" required>
                            </div>
                            
                            <div id="confirm-code" class="form-group" style="display:none">
                                <i class="fa  fa-code"></i>
                                <input class="myInput" placeholder="인증코드를 입력하세요"
                                type="text" name="email" >
                            </div>
							
                            <button id="ask_email" class="butt">인증코드 요청</button>
                        </form>
                        
                        <script>
                       //인증코드 요청 버튼을 누르면 데이터베이스에서 해당 이메일을 가진 사람을 찾고
                       //있으면 해당 이메일 주소로 메일을 보내고 버튼의 텍스트와 숨겨져있던 인증코드입력창을 보여주게 합니다
                       //인증코드가 일치하면 그 아이디를 alert창으로 보여줍니다
                       //없으면 없다고 alert 창을 띄웁니다
                        $('#ask_email').click(function () {
                        	
                        	$(this).text('인증코드 입력');
                    		$('#confirm-code').css("display","block");
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