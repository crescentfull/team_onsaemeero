<%@page import="aaa.vo.ReservationVO"%>
<%@page import="aaa.vo.RoomOptionVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value="/css/reservation/payment.css"/>"></link>
<meta charset="UTF-8">
<title>결제하기</title>
</head>
<style>
</style>
<body onload="price1();">
	<div>
		<jsp:include page="../base/header.jsp"/>
	</div>
	<div id="img1">
	<img src="/views/img1/etc/2단계.PNG" alt="" class="img11"/>
	</div>
	<h1 id="h1">예약정보 확인</h1>
		<form>     
			<div id="info">
			
				<div id="roomInfo">
					<h3>객실정보</h3>
					<table>
						<tr>
							<td id="td1">객실</td>
							<td id="td2"><input type="text" value="<%=request.getParameter("b_name")%> / <%=request.getParameter("room_name")%>" readonly/></td>
						</tr>
						<tr>
							<td id="td1">입실일</td>
							<td id="td2"><input type="text" value="<%=request.getParameter("indate") %>" readonly/></td>
						</tr>
			 			<tr>
							<td id="td1">퇴실일</td>
							<td id="td2"><input type="text" value="<%=request.getParameter("outdate") %>" readonly/></td>
						</tr>
						<tr>
							<td id="td1">금액</td>
							<td id="td2"><input type="text" id="price" onload="price1();"  value=" " readonly>원
							<input type="hidden" name="price" id="inputprice" value=" "/></td>
						</tr>
						<tr>
							<td style="color:red;font-size:12px;"colspan="2"  id="td2" >*금액 계산식 : 주말(${redData.red_date }일*<%=request.getParameter("red_price") %>원)
							 + 평일(<span id="black_date"></span><span>일</span>*<%=request.getParameter("price") %>원)</td>
						</tr>
					</table>
				</div>

				<div id="customerInfo">
				<h3>고객정보</h3>
					<table>
						<tr>
							<td>성명</td>
							<td><input type="text" value="${userdata.name }" readonly/></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" value="${userdata.email }" readonly/></td>
						</tr>
			 			<tr>
							<td>휴대폰번호</td>
							<td><input type="text" value="${userdata.phone }" readonly/></td>
						</tr>
						<tr>
							<td colspan="2" id="gray">※ 고객정보는 <span id="red">mypage</span>에서 수정이 가능합니다.</td>
							
						</tr>
					</table>
				</div>
				</div>
				
				<input type="hidden" name="id" value="${userdata.id }"/>
				<input type="hidden" name="b_name" value="<%=request.getParameter("b_name") %>"/>
				<input type="hidden" name="room_name" value="<%=request.getParameter("room_name") %>"/>
				<input type="hidden" name="indate" value="<%=request.getParameter("indate") %>" id="indate"/>
				<input type="hidden" name="outdate" value="<%=request.getParameter("outdate") %>" id="outdate"/>
				
				<div id="option">
					<div id="check">
					<h3>옵션</h3>	
							<input type="checkbox" value="바베큐" id="option1" onclick="check1()">
								<label>바베큐 장비/ 20,000원</label>&nbsp;&nbsp;
							
							<input type="checkbox" value="한복" id="option2" onclick="check2()">	
								<label>한복/무료</label>&nbsp;&nbsp;
								
							<input type="checkbox" value="장작" id="option3" onclick="check3()">
								<label>장작/ 20,000원</label>&nbsp;&nbsp;	
								
						<c:forEach items="${op }" var="op" varStatus="no">
							<input type="checkbox" name="request" value="${op.event }" id="special${no.count }" onclick="addspecial()">
							<label>${op.event }</label>&nbsp;&nbsp;
							<input type="hidden" name="optionPrice" id="option${no.count }Price" value="${op.price }">
						</c:forEach>
						
					</div>
					<div id="request">
						<h3>추가 요청사항</h3>
						<textarea name="request" id="" cols="100" rows="10" ></textarea>				
					</div>
					</div>
			
			<div id="bt">
				<input id="back" type="button" value="뒤로" onclick="history.back();"> 
				<input id="rvt" type="submit" value="결제하기" formaction="reservation" >
			</div>
			<input type="hidden" id="bbq" name="bbq"/>
			<input type="hidden" id="hanbok" name="hanbok"/>
			<input type="hidden" id="jangj" name="jangj"/>
		</form>
		
	<div>
		<jsp:include page="../base/footer.jsp"/>
	</div>
</body>
<script src="../../js/jquery-3.6.0.min.js"></script>
<script>

	var price = document.getElementById("price");
	var inputprice = document.getElementById("inputprice");
	price.style.border='none';
		
	function price1(){
			
	var indate = document.getElementById("indate").value;
 	var outdate = document.getElementById("outdate").value;
	var arr1 = indate.split('-');
	var arr2 = outdate.split('-');
	var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
	var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
	var red_date = ${redData.red_date};
	var red_price = ${redData.red_price};
	
	var res = ${totalDate};
	var black_price = '<%=request.getParameter("price")%>';
	var totRes = res * black_price + red_date * red_price - red_date * black_price;
	inputprice.value=totRes;
	
	var black_date = res - red_date;
	
	
	
	function numberWithCommas(totRes) {
	    return totRes.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	document.getElementById("price").value = numberWithCommas(totRes);
	document.getElementById("black_date").innerText = black_date;
	}
	


	$('#bbq').val(0);
	$('#hanbok').val(0);
	$('#jangj').val(0);
function check1(){
	if(document.getElementById("option1").checked==true){
		option1();
		$('#bbq').val(1);
	}else {
		chk1minus();
		$('#bbq').val(0);
	}
}
function option1(){
	var intprice = parseInt(inputprice.value);
	var sum = intprice + 20000;
	
	function numberWithCommas(sum) {
	    return sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	price.value = numberWithCommas(sum);
	inputprice.value=sum;
}

function chk1minus(){
	var intprice = parseInt(inputprice.value);
	var minus = intprice - 20000;
	
	function numberWithCommas(minus) {
	    return minus.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	price.value = numberWithCommas(minus);
	inputprice.value=minus;
	
	
}

function check2(){
	var hanbok;
	if(document.getElementById("option2").checked==true){
		option2();
		$('#hanbok').val(1);
	}else {
		chk2minus();
		$('#hanbok').val(0);
	}
}
function option2(){
	var intprice = parseInt(inputprice.value);
	var sum = intprice + 0;
	
	function numberWithCommas(sum) {
	    return sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	price.value = numberWithCommas(sum);
	inputprice.value=sum;
}

function chk2minus(){
	var intprice = parseInt(inputprice.value);
	var minus = intprice - 0;
	
	function numberWithCommas(minus) {
	    return minus.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	price.value = numberWithCommas(minus);
	inputprice.value=minus;
}

function check3(){
	var jj;
	if(document.getElementById("option3").checked==true){
		option3();
		$('#jangj').val(1);
	}else {
		chk3minus();
		$('#jangj').val(0);
	}
}
function option3(){
	var intprice = parseInt(inputprice.value);
	var sum = intprice + 20000;
	
	function numberWithCommas(sum) {
	    return sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	price.value = numberWithCommas(sum);
	inputprice.value=sum;
}

function chk3minus(){
	var intprice = parseInt(inputprice.value);
	var minus = intprice - 20000;
	
	function numberWithCommas(minus) {
	    return minus.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	price.value = numberWithCommas(minus);
	inputprice.value=minus;
}

var before1 = false;
var before2 = false;
var before3 = false;

function addspecial(){
	if(before1==false && document.getElementById("special1").checked==true){
		before1 = true;
		specialplus1();
	}else if(before1==true && document.getElementById("special1").checked==false){
		before1 = false;
		specialminus1();
	}else if(before2==false && document.getElementById("special2").checked==true){
		before2 = true;
		specialplus2();
	}else if(before2==true && document.getElementById("special2").checked==false){
		before2 = false;
		specialminus2();
	}else if(before3==false && document.getElementById("special3").checked==true){
		before3 = true;
		specialplus3();
	}else if(before3==true && document.getElementById("special3").checked==false){
		before3 = false;
		specialminus3();
	}
}
function specialplus1(){
	var optionPrice = parseInt(document.getElementById("option1Price").value);
	var intprice = parseInt(inputprice.value);
	var sum = intprice + optionPrice;
	
	function numberWithCommas(sum) {
	    return sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	price.value = numberWithCommas(sum);
	inputprice.value=sum;
}
function specialminus1(){
	var optionPrice = parseInt(document.getElementById("option1Price").value);
	var intprice = parseInt(inputprice.value);
	var minus = intprice - optionPrice;
	
	function numberWithCommas(minus) {
	    return minus.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	price.value = numberWithCommas(minus);
	inputprice.value=minus;
}
function specialplus2(){
	var optionPrice = parseInt(document.getElementById("option2Price").value);
	var intprice = parseInt(inputprice.value);
	var sum = intprice + optionPrice;
	
	function numberWithCommas(sum) {
	    return sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	price.value = numberWithCommas(sum);
	inputprice.value=sum;
}
function specialminus2(){
	var optionPrice = parseInt(document.getElementById("option2Price").value);
	var intprice = parseInt(inputprice.value);
	var minus = intprice - optionPrice;
	
	function numberWithCommas(minus) {
	    return minus.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	price.value = numberWithCommas(minus);
	inputprice.value=minus;
}
function specialplus3(){
	var optionPrice = parseInt(document.getElementById("option3Price").value);
	var intprice = parseInt(inputprice.value);
	var sum = intprice + optionPrice;
	
	function numberWithCommas(sum) {
	    return sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	price.value = numberWithCommas(sum);
	inputprice.value=sum;
}
function specialminus3(){
	var optionPrice = parseInt(document.getElementById("option3Price").value);
	var intprice = parseInt(inputprice.value);
	var minus = intprice - optionPrice;
	
	function numberWithCommas(minus) {
	    return minus.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	price.value = numberWithCommas(minus);
	inputprice.value=minus;
}
</script>
</html>