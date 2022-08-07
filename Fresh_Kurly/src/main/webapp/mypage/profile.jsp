<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<title> 개인정보 수정 - 비밀번호 확인 </title>
	<meta charset="utf-8">
	<script src="http://code.jquery.com/jquery-latest.js"></script>	
</head>
<style>
	body {margin: 0 auto; }
	* {text-align: left}
	h6 {color:gray; font-weight:bold;}
	hr {
    border: 0;
    height: 2px;
    background: #ccc;}
    
    #okbtn {background:#8BC34A; font-weight:bold; color: white;
		padding-top:10px; padding-bottom:10px; margin:3px;
		border:0; border-radius: 12px; width:300px}
  }	
</style>
<body>

<section id="login"> 
    <div class="container">
            <div class="myCard">
                <div class="row">
                    <div class="col-md-10">
                        <div class="myLeftCtn">
                            
                        <form class="myForm text-center needs-validation" action="myProfileCheck.my" method="post" novalidate>
                            <header>개인정보 수정</header>
                            <h6>비밀번호 재확인</h6>
                            <span>*회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인해주세요.</span>
                            
                            <hr>
                            <div class="form-group">
                                아이디
                                <input class="form-control" type="text" name="id" id="id" value="${id }" readonly>
                            </div>

                            <div class="form-group">
                                <label for="pass">비밀번호<font color='red'>*</font></label>
                                <input class="form-control" type="password" name="pass" id="pass" placeholder="비밀번호를 입력해주세요" required>
                            </div>
							<hr>	

                            <input type="submit"  id="okbtn" value="확인"> 
                        </form>
                        </div>
                    </div>
                    
                </div>
            </div>
    </div>
</section>
</body>
</html>