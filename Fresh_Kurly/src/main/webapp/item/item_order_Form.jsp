<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 돈을 형식에 맞게 찍어주기 위함. -->

<jsp:include page="../mainpage/header.jsp" />


<style>
	#address {
		width: 100%;
	}
	#td100 td { border:none; width:25px; text-align:center}
    #total {width:60px}
	#zipcodeSearch {
		width: 15px; height: 15px;
	}
	
	table > tbody > tr > td.verticalM { /* 국내배송상품 주문내역 테이블 안에 있는 td태그들을 세로방향으로 가운데정렬  */
		vertical-align: middle;
	}
	
	
	
	table#tblDeliveryInfo, table#tblDiscountInfo { /* 배송 정보 테이블  */ /* 결제예정금액(할인정보) 테이블  */
        width: 100%;
	}  
	table#tblDeliveryInfo tr, table#tblDiscountInfo tr {
        /* line-height: 30px; */
        border-top: solid 1px #d9d9d9;
        border-bottom: solid 1px #d9d9d9;
	}
	table#tblDeliveryInfo th, table#tblDiscountInfo th {
		border-right: solid 1px #d9d9d9;
		width: 15%;
		padding-left: 8px;
	}
	table#tblDeliveryInfo td, table#tblDiscountInfo td {
		padding-left: 8px;
		padding-top: 8px;
        padding-bottom: 8px;
	}
	.star { /* 필수 입력 사항 표시 */
		color: red;
        font-weight: bold;
        font-size: 15pt;
	}
	
	.tb-btn i{
    margin: 0px;
  }
  
  #float-r {
  	float:right;
  }
	
	
</style>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 다음 우편번호찾기 -->

<script type="text/javascript">
	
	var b_flagPostcodeClick = false;
	// 결제하기 버튼을 클릭시 "우편번호찾기" 를 클릭했는지 클릭안했는지를 알아보기위한 용도임.
	$(document).ready(function(){
		
		$("span.error").hide(); // 맨처음에는 입력사항에러페이지가 안나오도록 숨겨줘야함.
		
		//////////////////////////////////////////////////////////////////
		// 배송
		
		$("input#receiverName").blur(function(){
			
			var receiverName = $(this).val().trim();
			if(receiverName == ""){
				// 입력하지 않거나 공백만 입력한 경우
				$("table#tblDeliveryInfo :input").prop("disabled",true); // :input은 모든 input태그, textarea태그, select태그, 버튼태그를 선택자로 잡음.
				$(this).prop("disabled",false);
				
			//	$(this).next().show(); // next() : 바로뒤의 형제태그
			//	또는
				$(this).parent().find(".error").show();
				$(this).focus();
			}
			else{
				// 공백이 아닌 글자를 입력했을 경우
				$("table#tblDeliveryInfo :input").prop("disabled",false);
			//	$(this).next().hide();
			//	또는
				$(this).parent().find(".error").hide();
			}
			
		});// 아이디가 receiverName 인 것은 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것이다.
		
		
		
		$("img#zipcodeSearch").click(function(){
			
			b_flagPostcodeClick = true; 
			// 결제하기 버튼을 클릭시 "우편번호찾기" 를 클릭했는지 클릭안했는지를 알아보기위한 용도임.
			
		   new daum.Postcode({
		         oncomplete: function(data) {
		             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		             // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		             var addr = ''; // 주소 변수
		             var extraAddr = ''; // 참고항목 변수
		
		             //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                 addr = data.roadAddress;
		             } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                 addr = data.jibunAddress;
		             }
		
		             // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		             if(data.userSelectedType === 'R'){
		                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                     extraAddr += data.bname;
		                 }
		                 // 건물명이 있고, 공동주택일 경우 추가한다.
		                 if(data.buildingName !== '' && data.apartment === 'Y'){
		                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                 }
		                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                 if(extraAddr !== ''){
		                     extraAddr = ' (' + extraAddr + ')';
		                 }
		                 // 조합된 참고항목을 해당 필드에 넣는다.
		                 document.getElementById("extraAddress").value = extraAddr;
		             
		             } else {
		                 document.getElementById("extraAddress").value = '';
		             }
		
		             // 우편번호와 주소 정보를 해당 필드에 넣는다.
		             document.getElementById('postcode').value = data.zonecode;
		             document.getElementById("address").value = addr;
		             // 커서를 상세주소 필드로 이동한다.
		             document.getElementById("detailAddress").focus();
		         }
		     }).open();               
		});
		
		
		$("input#detailAddress").blur(function(){
			
			var detailAddress = $(this).val().trim();
			if(detailAddress == ""){
				// 입력하지 않거나 공백만 입력한 경우
				$("table#tblDeliveryInfo :input").prop("disabled",true); 
				$(this).prop("disabled",false);
				
			//	$(this).next().show(); // next() : 바로뒤의 형제태그
			//	또는
				$(this).parent().find(".error").show();
				$(this).focus();
			}
			else{
				// 공백이 아닌 글자를 입력했을 경우
				$("table#tblDeliveryInfo :input").prop("disabled",false);
			//	$(this).next().hide();
			//	또는
				$(this).parent().find(".error").hide();
			}
			
		});// 아이디가 detailAddress 인 것은 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것이다.
		
		
		
		$("input#hp2").blur(function(){
			
			var regExp = /^[1-9][0-9]{3}$/i;
			// 숫자 4자리만 들어오도록 검사해주는 정규표현식 객체 생성
			
			var hp2 = $(this).val();
			
			var bool = regExp.test(hp2);
			
			if(!bool){
				// 국번이 정규표현식에 위배된 경우
				$("table#tblDeliveryInfo :input").prop("disabled",true);
				$(this).prop("disabled",false);
				
				$(this).parent().find(".error").show();
				$(this).focus();
			}
			else{
				// 국번이 정규표현식에 맞는 경우
				$("table#tblDeliveryInfo :input").prop("disabled",false);
				
				$(this).parent().find(".error").hide();
			}
			
		});// 아이디가 hp2 인 것은 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것이다.
		
		
		$("input#hp3").blur(function(){
			
		//	var regExp = /^[0-9]{4}$/i;
		//	또는
			var regExp = /^\d{4}$/i;
			// 숫자 4자리만 들어오도록 검사해주는 정규표현식 객체 생성
			
			var hp3 = $(this).val();
			
			var bool = regExp.test(hp3);
			
			if(!bool){
				// 마지막 전화번호 4자리가 정규표현식에 위배된 경우
				$("table#tblDeliveryInfo :input").prop("disabled",true);
				$(this).prop("disabled",false);
				
				$(this).parent().find(".error").show();
				$(this).focus();
			}
			else{
				// 마지막 전화번호 4자리가 정규표현식에 맞는 경우
				$("table#tblDeliveryInfo :input").prop("disabled",false);
				
				$(this).parent().find(".error").hide();
			}
			
		});// 아이디가 hp3 인 것은 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것이다.
		
		
		$("input#email").blur(function(){
			
			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			// 이메일 정규표현식 객체 생성
			
			var email = $(this).val();
			
			var bool = regExp.test(email);
			
			if(!bool){
				// 이메일이 정규표현식에 위배된 경우
				$("table#tblDeliveryInfo :input").prop("disabled",true);
				$(this).prop("disabled",false);
				
				$(this).parent().find(".error").show();
				$(this).focus();
			}
			else{
				// 이메일이 정규표현식에 맞는 경우
				$("table#tblDeliveryInfo :input").prop("disabled",false);
				
				$(this).parent().find(".error").hide();
			}
			
		});// 아이디가 email 인 것은 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것이다.
		
		////////////////////////////////////////////////////////////////////////////
		$("input#destinationSame").click(function(){ // 배송지 선택에서 "회원 정보와 동일"을 클릭하면 로그인한 회원의 정보를 넣어줌.
			
			$("input#receiverName").val("${member.name}");
			
			b_flagPostcodeClick = true; // 우편번호찾기 버튼을 굳이 클릭안하도록 함.
			
			$("input#postcode").val("${member.postcode}");
			$("input#address").val("${member.address}");
			$("input#detailAddress").val("${member.detailaddress}");
			$("input#extraAddress").val("${member.extraaddress}");
			
			$("input#hp2").val("${ fn:substring(member.mobile, 3, 7) }");
			$("input#hp3").val("${ fn:substring(member.mobile, 7, 11) }");
			
		});
		
		$("input#destinationNew").click(function(){ // 배송지 선택에서 "새로운 배송지"를 클릭하면 기존 정보 없앰.
			
			$("input#receiverName").val("");
			
			b_flagPostcodeClick = false;
			
			$("input#postcode").val("");
			$("input#address").val("");
			$("input#detailAddress").val("");
			$("input#extraAddress").val("");
			
			$("input#hp2").val("");
			$("input#hp3").val("");
			
		});
		
	});// end of $(document).ready(function(){})----------------------------
	
	
	// 결제하기 버튼 클릭시, 배송 정보를 넘겨줘야함.
	function goPurchase(){
		
		// *** 필수입력사항에 모두 입력이 되었는지 검사한다. *** //
		var boolFlag = false;
		
		$("input.requiredInfo").each(function(){
			var data = $(this).val().trim();
			if(data == "") {
				alert("*표시된 필수입력사항은 모두 입력하셔야 합니다.");
				boolFlag = true;
				return false; // break; 라는 뜻이다.
			}
		});
		
		
		if(boolFlag){
			return; // 종료
		}
		
		
		if( $("input#destinationSame").prop("checked") ){
			b_flagPostcodeClick = true; // 회원정보와 동일이 체크가 되어져있으면, "우편번호찾기"를 클릭했는지 검사할 필요 없음.
		}
		
		
		if(!b_flagPostcodeClick){
			// "우편번호찾기" 를 클릭했는지 클릭안했는지를 알아보기위한 용도임.
			alert("우편번호찾기를 클릭하여 배송 정보에 주소를 입력하세요!!");
			return; // 종료
		}
		
		
		// === 아임포트 결제를 해주는 팝업창 시작 === //
		
		var realTotalPrice = $("span#realTotalPrice").text(); // 46,500
	//	alert("확인용 결제금액 : " + realTotalPrice + " 원 결제예정");
		// 금액에서 콤마제거하기
		realTotalPrice = realTotalPrice.split(",").join(""); // 46500
	//	alert("확인용 결제금액 : " + realTotalPrice + " 원 결제예정");
		
		var userid = "${sessionScope.loginuser.userid}"; // 자바스크립트 // sessionScope.loginuser.get다음의뭐뭐뭐  // ##################################뿌잉##################################
		
	//	alert("확인용 결제할 사용자 아이디 : " + userid);
		
		//  아임포트 결제 팝업창 띄우기 
		var url = "<%= request.getContextPath()%>/order/orderPayment.go?userid="+userid+"&coinmoney="+realTotalPrice;  
		
		window.open(url, "orderPayment",
					"left=350px, top=100px, width=1000px, height=600px");
		
		// === 아임포트 결제를 해주는 팝업창 끝 === //
		
	}// end of function goPurchase()------------------------------------------------
	
	
	// === 결제가 성공되면, DB 상의 테이블 내용들을 변경하는 함수 ===
	function goPaymentSuccess(){ // ##################################뿌잉##################################
//	function test(){	
		
		// 1) tbl_order와 tbl_orderdetail 주문내역insert
		// 2) tbl_orderProgress 주문대기중목록delete
		// 3) tbl_cart 해당목록delete
		// 4) tbl_wishlist 해당목록delete
		// * 5) tbl_recentViewProduct 해당목록delete(-> 안함!)
		// 6) tbl_poption 의 cnt 감소 update
		// 7) tbl_member 포인트 insert,update
		
		
		// 차라리 orderEnd.go로 데이터를 다 넘겨서 거기서 insert,update,delete 등을 실행하고 뷰단에 주문완료를 보여주자!
		
		// 1) 회원아이디, 주문총액 / 제품번호, 주문량, 주문가격
		// 2) 회원아이디
		// 3) 회원아이디, 옵션번호
		// 4) 회원아이디, 옵션번호
		// 5)
		// 6) 옵션번호
		// 7) 회원아이디, 주문코드
		
		
		
		// 주문총액
		var realTotalPrice = $("span#realTotalPrice").text(); // 46,500
		// 총액에서 콤마제거하기
		realTotalPrice = realTotalPrice.split(",").join(""); // 46500
		
		// 여러개의 제품번호
		var str_Pseq = strPseq();
		
		// 여러개의 주문량
		var str_Wishoqty = strWishoqty();
	
		// 여러개의 주문가격
		var str_Odrprice = strOdrprice();
		
		// 여러개의 옵션번호
		var str_Opseq = strOpseq();
		
		
		var frm = document.OrderFormInfo;
		frm.userid.value = "${requestScope.member.userid}";
		frm.odrtotalprice.value = realTotalPrice;
		frm.fk_pseqjoin.value = str_Pseq;
		frm.oqtyjoin.value = str_Wishoqty;
		frm.odrpricejoin.value = str_Odrprice;
		frm.fk_opseqjoin.value = str_Opseq;
		
	
		// 결제완료페이지로 이동
		frm.action = "<%= request.getContextPath()%>/order/orderEnd.go"; 
		frm.method = "POST";
		frm.submit();
		
	}// end of function goPaymentSuccess(){}-----------------------------
	
	
	
	// 여러개의 pseq를 String타입으로 묶어서 반환하는 함수
	function strPseq(){
		
		// 자바스크립트의 배열은 아래와 같이 나타낸다.(배열도 객체이다.)
		var arrPseq = new Array();
		// 배열명.push("~~~");
		
		var arrProduct_pseq = document.getElementsByName("product_pseq");
		
		for(var i=0; i<arrProduct_pseq.length; i++){ // input태그 길이만큼 반복돌림
			
			var pseq = arrProduct_pseq[i].value;
		//	console.log("input태그에 입력된 pseq => " + pseq);
			
			arrPseq.push(pseq);
			
		}// end of for---------------------------------------------
		
		var str_Pseq = arrPseq.join(",");
		
		return str_Pseq;
		
	}// end of function strPseq()-------------------------------------------
	
	
	// 여러개의 wishoqty를 String타입으로 묶어서 반환하는 함수
	function strWishoqty(){
		
		// 자바스크립트의 배열은 아래와 같이 나타낸다.(배열도 객체이다.)
		var arrWishoqty = new Array();
		// 배열명.push("~~~");
		
		var arrProduct_wishoqty = document.getElementsByName("product_wishoqty");
		
		for(var i=0; i<arrProduct_wishoqty.length; i++){ // input태그 길이만큼 반복돌림
			
			var wishoqty = arrProduct_wishoqty[i].value;
		//	console.log("input태그에 입력된 wishoqty => " + wishoqty);
			
			arrWishoqty.push(wishoqty);
			
		}// end of for---------------------------------------------
		
		var str_Wishoqty = arrWishoqty.join(",");
		
		return str_Wishoqty;
		
	}// end of function strWishoqty()-------------------------------------------
	
	
	// 여러개의 odrprice를 String타입으로 묶어서 반환하는 함수
	function strOdrprice(){
		
		// 자바스크립트의 배열은 아래와 같이 나타낸다.(배열도 객체이다.)
		var arrOdrprice = new Array();
		// 배열명.push("~~~");
		
		var arrProduct_odrprice = document.getElementsByName("product_odrprice");
		
		for(var i=0; i<arrProduct_odrprice.length; i++){ // input태그 길이만큼 반복돌림
			
			var odrprice = arrProduct_odrprice[i].value;
		//	console.log("input태그에 입력된 odrprice => " + odrprice);
			
			arrOdrprice.push(odrprice);
			
		}// end of for---------------------------------------------
		
		var str_Odrprice = arrOdrprice.join(",");
		
		return str_Odrprice;
		
	}// end of function strOdrprice()-------------------------------------------
	
	
	// 여러개의 opseq를 String타입으로 묶어서 반환하는 함수
	function strOpseq(){
		
		// 자바스크립트의 배열은 아래와 같이 나타낸다.(배열도 객체이다.)
		var arrOpseq = new Array();
		// 배열명.push("~~~");
		
		var arrProduct_opseq = document.getElementsByName("product_opseq");
		
		for(var i=0; i<arrProduct_opseq.length; i++){ // input태그 길이만큼 반복돌림
			
			var opseq = arrProduct_opseq[i].value;
		//	console.log("input태그에 입력된 opseq => " + opseq);
			
			arrOpseq.push(opseq);
			
		}// end of for---------------------------------------------
		
		var str_Opseq = arrOpseq.join(",");
		
		return str_Opseq;
		
	}// end of function strOpseq()-------------------------------------------
	
	
	// 사용가능한 포인트보여주는 팝업창 띄우기
	function showUsablePoint(){
		
		var url = "<%= request.getContextPath()%>/order/showUsablePoint.go?userid=${sessionScope.loginuser.userid}"; // ##################################뿌잉##################################
		
		window.open(url, "showUsablePoint",
        			"left=350px, top=100px, width=650px, height=570px"); // window.open이 팝업창 띄우는거다.
		
		
	}// end of function showUsablePoint()-----------------------------------
	
	
	// 적립금 선택한 내역들을 할인금액란에 보여줌
	function showDiscountMoney(dc_money){
		
	//	console.log("확인용 dc_money : " + dc_money);
	//	console.log("확인용 typeof(dc_money) : " + typeof(dc_money)); // number
		
		$("input[name=pointUsed]").val(dc_money); // 할인받았더라면 pointUsed에 (가공하지않은)할인액을 넣어줌. 안넣어주면 기본 value값은 0이다. -> 가격이 2,200이 아니라 2200이다.
	
		/////////////////////////////////////////////////////////////
		var dc_money = parseInt(dc_money).toLocaleString('en');
	//	console.log("확인용 dc_money : " + dc_money);
		
		$("strong#pointDiscount").text(dc_money);
		
		/////////////////////////////////////////////////////////////
		// 총가격 계산하기
		var totalPrice = $("input#totalPrice").val();
		var deliveryFee = $("input#deliveryFee").val();
		
		var realTotalPrice = parseInt(totalPrice)+parseInt(deliveryFee)-parseInt(dc_money);
	
		realTotalPrice = parseInt(realTotalPrice).toLocaleString('en');
	
		///////////////////////////////////////////////
	
		dc_money = dc_money.toLocaleString('en'); // 자바스크립트에서 숫자 3자리마다 콤마 찍어주기 (자바스크립트에서 fmt이 제대로 작동안함.)
		$("span#pointDiscount1").text(dc_money);
		$("span#realTotalPrice").text(realTotalPrice);
		
	}// end of function showDiscountMoney(dc_money,fk_odrcode)---------------------------------------------------
	
	$(function() {
		   $("#btnPurchase").click(function(){
		      location.href="itemOrderProcess.item";
		   })
		      
		})
	
</script>

	<div class = "container px-0">

		<div style="margin-top: 40px; margin-bottom: 10px; font-weight: bold; font-size: 16px;">국내배송상품 주문내역</div>

		<!-- orderList가 존재하는지 존재안하는지에 따라 달라짐. 시작-->

			<!-- 국내배송상품 주문내역 테이블 시작 -->
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr style="text-align: center;"> <!-- 글자 가운데정렬 -->
							<th>이미지</th>
							<th>상품이름</th>
							<th>상품가격</th>
							<th>수량</th>
							<th>합계</th>
						</tr>
					</thead>
					<c:if test="${listcount > 0}">
						<tbody>

						<c:forEach var="c" items="${cartlist }" >
							<tr id="td100">
							 	<%-- <td>
		 						 	<input type="hidden" name="item_id" id="item_id" value="${c.item_id}">
		 						 	<input type="hidden" name="item_price" id="item_price" value="${c.item_price}">
								</td> --%>
								<td> <!-- 상품이미지 -->
									<img src="itemupload/${c.item_image}" style="width:80px; height:80px">
								</td>
								<td> <!-- 상품명 -->
									${c.item_name}
								</td>
								<td> <!-- 상품가격 -->
									${c.item_price}
								</td>
								<td> <!-- 상품수량 -->
									${c.cart_amount}
								</td>
								<td> <!-- 개별 상품 총가격 -->
									${c.item_price * c.cart_amount}<span>원</span>
								</td>
							</tr>
						</c:forEach>
						
					</tbody>
						
				 </c:if>
				</table>
			</div>
			<div id="float-r">총 가격:<h1>&nbsp;${totalAll }원</h1></div>
			<!-- 국내배송상품 주문내역 테이블 끝 -->
			
		


		<div style="margin-bottom: 10px; font-size: 15px;">상품의 옵션 및 수량 변경은 장바구니에서 가능합니다.</div>




		<!-- 배송 정보 form 테이블 시작 -->
		<div style="clear: both; margin-top: 40px; margin-bottom: 10px; ">
			<span style="font-weight: bold; font-size: 16px;">배송 정보</span>

			<div style="float: right;">
				<span class="star">*</span><span style="font-size: 15px;">필수입력사항</span>
			</div>
		</div>

		<form name="deliveryInfoFrm">
			<table id="tblDeliveryInfo">
				<tbody>
					<tr>
						<th>배송지 선택</th>
						<td>
							<input type="radio" id="destinationSame" name="destination" checked/><label for="destinationSame" style="margin-left: 1%; font-weight: 400;">회원 정보와 동일</label>
							<!-- 값 가져오면 새 배송지 가능<input type="radio" id="destinationNew" name="destination" style="margin-left: 2%;" /><label for="destinationNew" style="margin-left: 1%; font-weight: 400;">새로운 배송지</label> -->
						</td> 
	      			</tr>
	      			<tr>
	      				<th>받으시는 분&nbsp;<span class="star">*</span></th>
	      				<td>
	      					<input type="text" name="receiverName" id="receiverName" value="${m.member_name}" class="requiredInfo" required/> 
	      					<span class="error">받으시는 분을 입력하세요</span>
						</td> 
					</tr>
					<tr>
						<th>주소&nbsp;<span class="star">*</span></th>
						<td>
							<input type="text" id="postcode" name="postcode" value="${m.member_post}" size="6" maxlength="5" readonly class="requiredInfo" required/>&nbsp;&nbsp;
							<%-- 우편번호 찾기 --%>
							<img id="zipcodeSearch" src="assets/image/search.png" /><br/>

							<input type="text" id="address" name="address" value="${m.member_address}" size="40" class="requiredInfo" placeholder="주소" required style="margin-top: 4px;"/><br/>

							<span class="error">주소를 입력하세요</span>
						</td> 
					</tr>
					<tr>
						<th>연락처&nbsp;<span class="star">*</span></th>
						<td>
				             <input type="text" id="hp1" name="hp1" size="6" maxlength="3" value="010" readonly class="requiredInfo"/>&nbsp;-&nbsp;
				             <input type="text" id="hp2" name="hp2" size="6" maxlength="4" value="${member_phone1 }" class="requiredInfo" required/>&nbsp;-&nbsp;
				             <input type="text" id="hp3" name="hp3" size="6" maxlength="4" value="${member_phone2 }" class="requiredInfo" required/>
				             <span class="error">휴대폰 형식이 아닙니다.</span>
						</td>
					</tr>
					<tr>
						<th>이메일&nbsp;<span class="star">*</span></th>
						<td>
							<input type="text" name="email" id="email" value="${m.member_email }" class="requiredInfo" required placeholder="abc@def.com"/> 
							<span class="error">이메일 형식에 맞지 않습니다.</span>
							<br>이메일을 통해 주문처리과정을 보내드립니다.
							<br>이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요.
						</td>
					</tr>
					<tr>
						<th>배송메시지</th>
						<td>
							<textarea rows="2" cols="60" name="deliveryMsg"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<!-- 배송 정보 form 테이블 끝 -->





		<!-- 결제 예정 금액 테이블 시작 -->
		<div style="margin-top: 40px; margin-bottom: 10px; font-weight: bold; font-size: 16px;">결제 예정 금액</div>
		<table class="table table-bordered" style="text-align: center; margin-bottom: 0px;">
			<thead>
				<tr>
					<th>총 주문 금액</th>
					<th>택배비</th>
					<th>총 결제 금액</th>
				</tr>	
			</thead>
			<tbody>	
				<tr style="font-weight: bolder; font-size: 13pt;">
					<td><fmt:formatNumber value="${totalAll}" pattern="#,###"/>원</td>
					<td><span id="pointDiscount1"><fmt:formatNumber value="${delivery }" pattern="#,###"/></span>원</td>
					<td>
						<input type="hidden" id="totalPrice" value="${totalAll}"/>
						<input type="hidden" id="deliveryFee" value="${delivery}"/>
					<span id="realTotalPrice"><fmt:formatNumber value="${totalAll+delivery}" pattern="#,###"/></span>원
					</td>
				</tr>
			</tbody>
		</table>
		<!-- 결제 예정 금액 테이블 끝 -->
		<br>
		
		<br>
		<!-- 결제하기 버튼 시작 -->
		<div class="text-center">
			<button type="button" id="btnPurchase" class="btn" style="width: 200px; height: 6%">결제하기</button>
		</div>
		<!-- 결제하기 버튼 끝 -->


		<!-- 결제완료시, orderEnd에 POST방식으로 보내기 위한 폼 시작 -->
		<form name="OrderFormInfo">
			<!-- 회원아이디, 주문총액 / 제품번호, 주문량, 주문가격 / 옵션번호 -->
			<input type="hidden" name="userid" value="${m.member_id }" />
			<input type="hidden" name="odrtotalprice" value="${totalAll+delivery}" />
			<input type="hidden" name="fk_pseqjoin" value="${c.item_id }" />
			<input type="hidden" name="oqtyjoin" value="${c.cart_amount }" />
			<input type="hidden" name="odrpricejoin" value="${totalAll}" />
			<input type="hidden" name="fk_opseqjoin" value="" />
			<input type="hidden"   name="fk_odrcodejoin" id="str_Fk_odrcode"/> <!-- 적립금조회(자식팝업창)에서 opener를 통해 여기에 값을 넣어준다. -->
			<!-- ------------------------------------------------------- -->
			<input type="hidden" name="pointUsed" value="0" /> <!-- 할인받았는지아닌지 유무, 할인받으면 value를 할인액으로 바꿔줌 -->
		</form>

		<!-- 이용안내 시작 -->
		<div style="border: solid 1px #d9d9d9; margin-top: 15px; margin-bottom: 50px;">
			<h5 style="font-weight: bold; padding: 4px; border-bottom: solid 1px #d9d9d9;">이용안내</h5>
			<div>
				<div style="padding-left: 4px; font-size: 13px;">WindowXP 서비스팩2를 설치하신후 결제가 정상적인 단계로 처리되지 않는경우, 아래의 절차에 따라 해결하시기 바랍니다.</div>
				<ul style="list-style-type: square; padding-left: 30px; margin-top: 4px; font-size: 13px;">
					<li>
						<a href="javascript:;" onclick="window.open('https://service-api.echosting.cafe24.com/shop/notice_XP_ActiveX.html','','width=795,height=500,scrollbars=yes',resizable=1);">안심클릭 결제모듈이 설치되지 않은 경우 ActiveX 수동설치</a>
					</li>
					<li>
						<a href="http://www.microsoft.com/korea/windowsxp/sp2/default.asp" target="_blank">Service Pack 2에 대한 Microsoft사의 상세안내 </a>
					</li>
				</ul>
			</div>

			<div>
				<div style="padding-left: 4px; margin-top: 8px; font-size: 13px;">아래의 쇼핑몰일 경우에는 모든 브라우저 사용이 가능합니다.</div>
				<ul style="list-style-type: square; padding-left: 30px; margin-top: 4px; font-size: 13px;">
					<li>KG이니시스, KCP, LG U+를 사용하는 쇼핑몰일 경우</li>
					<li>결제가능브라우저 : 크롬,파이어폭스,사파리,오페라 브라우저에서 결제 가능<br>(단, window os 사용자에 한하며 리눅스/mac os 사용자는 사용불가)</li>
					<li>최초 결제 시도시에는 플러그인을 추가 설치 후 반드시 브라우저 종료 후 재시작해야만 결제가 가능합니다.<br>(무통장, 휴대폰결제 포함)</li>
				</ul>
			</div>

			<div>
				<div style="padding-left: 4px; margin-top: 8px; font-size: 13px;">세금계산서 발행 안내</div>
				<ul style="list-style-type: square; padding-left: 30px; margin-top: 4px; font-size: 13px;">
					<li>부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수 있습니다.</li>
					<li>세금계산서는 사업자만 신청하실 수 있습니다.</li>
					<li>배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</li>
					<li>[세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로 사업자등록증사본을 보내셔야 세금계산서 발생이 가능합니다.</li>
					<li>[세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</li>
				</ul>
			</div>

			<div>
				<div style="padding-left: 4px; margin-top: 8px; font-size: 13px;">부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경안내</div>
				<ul style="list-style-type: square; padding-left: 30px; margin-top: 4px; font-size: 13px;">
					<li>변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신 주문에 대해서는 세금계산서 발행이 불가하며</li>
					<li>신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)</li>
					<li>상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서 발행이 가능함을 양지하여 주시기 바랍니다.</li>
				</ul>
			</div>

		</div>
		<!-- 이용안내 끝 -->
	</div>
		<!-- 결제완료시, orderEnd에 POST방식으로 보내기 위한 폼 끝 -->
		<!-- <button type="button" onclick="test()" >결제완료되었을때 결과버튼</button> -->
	<br><br>
	
<script src="assets/js/custom.js"></script>
   <footer id="footer">  
      <jsp:include page="../mainpage/footer.jsp"/>
   </footer>