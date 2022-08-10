<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 탈퇴</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src=""></script> <!-- 자바스크립트 -->
<style>
</style>
</head>
<body>
<header>
<jsp:include page="/mainpage/header.jsp"/>
</header>
<div id="banner-category" style="background:#9f7e1c8c;">
		<div class="container">
				<div class="col-md-12 text-center text-heading ">
				<h1>회원 탈퇴</h1>
			</div>
		</div>
</div>
<div class="container">
<form class="myForm text-center" action="WithdrawProccess_checkPW.net" method="post">
		<h3>!! 회원탈퇴 전, 유의사항을 확인해 주시기 바랍니다. !!</h3>

		<div class="secession-step1-notice" style="text-align: left;border: 1px solid #8BC34A">
                <section>
                    <ul>
                        <li>회원탈퇴 시 회원전용 웹 서비스 이용이 불가합니다.</li>
                        <li>거래정보가 있는 경우, 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 계약 또는 청약철회에 관한 기록, 대금결제 및 재화 등의 공급에 관한 기록은 5년동안 보존됩니다.</li>
                        <li>유효기간이 경과되지 않은 미사용 쿠폰관련 정보는 유효기간 만료일까지 보관되며, 탈퇴 후에도 유효기간 내 사용하실 수 있습니다.</li>
                        <li>회원탈퇴 후 프레시 컬리 서비스에 입력하신 상품문의 및 후기, 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없어 편집 및 삭제처리가 원천적으로 불가능 합니다.<br>상품문의 및 후기, 댓글 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하시기 바랍니다.</li>
                        <li>이미 결제가 완료된 건은 탈퇴로 취소되지 않습니다.</li>
                    </ul>
                </section>
        </div>
	                            
	<div class="form-group" style="text-align : left">
		아이디
		<input class="form-control" type="text" name="id" id="id" value="admin" readonly>
	</div>
	
	<div class="form-group" style="text-align : left">
		<label for="pass">비밀번호</label>
		<input class="form-control" type="password" name="pass" id="pass" placeholder="비밀번호를 입력해주세요" required>
	</div>
	<hr>	
	
	<input type="submit" id="okbtn" value="확인">
                            
</form>
</div>
</body>
</html>