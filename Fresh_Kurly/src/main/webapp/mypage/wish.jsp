<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지 - 찜한상품</title>
<style>

button{border:0; border-radius: 5px; color:white; font-weight:bold}

#deletebtn {background:grey;}
#addbtn {background:#8BC34A;}

body {margin: 0 auto; }
	* {text-align: left}
	h6 {color:gray; font-weight:bold;}
	hr {
    border: 0;
    height: 2px;
    background: #ccc;}
</style>
</head>
<body>
	


<section id="login"> 
    <div class="container">
            <div class="myCard">
                <div class="row">
                    <div class="col-md-10">
                        <div class="myLeftCtn">	
		<form class="myForm text-center needs-validation" method="" action="">
							
			<header>찜한상품</header>
			<hr>
			<!-- 찜한상품이 있는 경우 -->
			<c:if test="${listcount>0}">
			<c:forEach var="w" items="${wishlist}">
				<c:forEach var="i" items="${w.item_id}">
					<table>
						<tr>
							<td>상품사진 ${i.item_image }</td>
							<td>상품명 ${i.item_name}</td>
							<td>상품단가</td>
							<td>
								<button type="button" name="deletebtn" id="deletebtn">삭제</button><br>
								<button type="submit" name="addbtn" id="addbtn">담기</button>
							</td>
						</tr>
					</table>
				</c:forEach>
			</c:forEach>
			</c:if>


			<!-- 찜한상품이 없는 경우 -->
			<c:if test="${listcount == 0}">
				<font size=5>찜한 상품이 없습니다.</font>
			</c:if>
		</form>
</div>
                    </div>
                    
                </div>
            </div>
    </div>
</section>
</body>
</html>