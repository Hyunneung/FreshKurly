<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<title> 개인정보 수정 - 비밀번호 확인 </title>
</head>
<style>
    #okbtn {background:#8BC34A; font-weight:bold; font-size:14; color: white;
		padding-top:10px; padding-bottom:10px; margin:3px;
		border:0; border-radius: 12px; width:300px; text-align:center}
 	 }	
</style>
<body>
	<div class="col-md-8">
    	<div class="myLeftCtn">
        	<form class="myForm text-center" action="myProfileCheck.my" method="post" novalidate>
            	<header>개인정보 수정</header>
                            
                <!-- 소셜로그인 사용자가 아닌 경우 -->
				<c:if test="${social == null}">
	            	<h4>비밀번호 재확인</h4>
	                <h6 style="color:gray">*회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인해주세요.</h6>
	                            
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
				</c:if>
                            
                            
                <!-- 소셜로그인 사용자인 경우 -->
				<c:if test="${social != null}">
					<hr>
						<h6>소셜로그인 사용자는 개인정보 수정 서비스를 이용하실 수 없습니다.</h6>
				</c:if>
        	</form>
    	</div>
	</div>
</body>
</html>