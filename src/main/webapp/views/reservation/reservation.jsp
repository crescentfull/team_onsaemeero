<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href= "<c:url value="/css/reservation/reservation.css"/>"></link>
<meta charset="UTF-8">
<title>카드확인</title>
</head>
<body>
	<div>
		<jsp:include page="../base/header.jsp"/>
	</div>

	<form action="reservationchk" id="frm">
		<div id="img1">
			<img src="/views/img1/etc/3단계.PNG" alt="" class="img11"/>
		</div>
		<h1 id="h1">결제</h1>
			<div id="cardInfo">
				<h3>카드정보</h3>

				<table>
					<tr>
						<td id="td1">카드종류</td>
						<td id="td2">
							<select name="select1" id="select1">
								<option>카드선택</option>
								<option>삼성카드</option>
								<option>현대카드</option>
								<option>신한카드</option>
								<option>비씨카드</option>
								<option>농협카드</option>
							</select>
						</td>
					</tr>
					<tr>
						<td id="td1">카드번호</td>
						<td id="td2"><input type="text" name="cardfirst" id="cardno" maxlength="4"/><input name="cardsecond" type="text" id="cardno" maxlength="4"/>
						<input type="text" name="cardthird" id="cardno" maxlength="4"/><input name="cardfourth" type="text" id="cardno" maxlength="4"/>
						</td>
					</tr>
					<tr>
						<td id="td1">유효기간</td>
						<td id="td2">
							<select name="select2" id="select2">
								<option>월 선택</option>
								<option>01</option>
								<option>02</option>
								<option>03</option>
								<option>04</option>
								<option>05</option>
								<option>06</option>
								<option>07</option>
								<option>08</option>
								<option>09</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
							</select>
							<select name="select3" id="select2">
								<option>년 선택</option>
								<option>2021</option>
								<option>2022</option>
								<option>2023</option>
								<option>2024</option>
								<option>2025</option>
								<option>2026</option>
								<option>2027</option>
								<option>2028</option>
								<option>2029</option>
							</select>
						</td>
					</tr>
				</table>
				<p id="ppp">※ 신용카드 정보는 고객님의 투숙을 개런티하기 위한 용도 외에는 어떤 목적으로도 사용되지 않으며,<br>
				&nbsp;&nbsp; 체크카드 및 일부 신용 카드의 경우 사용이 제한 될 수 있습니다.</p>						
			</div>
		
		<div>
			<div id="rule1">
				<h3>유의사항</h3>
				<div id="rule1-1">
				<p>13세 이하 어린이는 객실 인원 추가 요금을 받지 않습니다.</p>
				<p>부모를 동반하지 않은 만 19세 미만 미성년자는 투숙할 수 없습니다. (청소년 보호법 30조/58조)</p>
				<p>자세한 객실안내는 02-0000-0000로 문의 바랍니다.</p>
				</div>
			</div>
			
			<div id="rule2">
				<h3>환불규정</h3>
				<div id="rule2-1">
				<p>▶ 체크인 7일전까지는 위약금 없이 취소가능</p>
				<p>▶ 체크인 5일전까지는 위약금 30%</p>
				<p>▶ 체크인 3일전까지는 위약금 50%</p>
				<p>▶ 체크인 1일전까지는 위약금 70%</p>
				<p>▶ 체크인 1일전 취소시 <span>환불 불가</span></p>
				</div>
			</div>
			
			<div id="ruleCheck">
			<label for="ch1">위 유의사항 및 환불규정을 모두 확인했습니다.</label>
			<input type="checkbox" name="ch1" value="" id="ch1">
			</div>
			
			<div id="bt">
				<input type="button" value="뒤로" id="back"> 
				<input type="button" id="rvt" value="결제하기" onclick="rvtbtn()">
			</div>
			
		</div>
		
		<input type="hidden" name="id" value="${userdata.id }"/>
		<input type="hidden" name="b_name" value="${reservationdata.b_name }"/>
		<input type="hidden" name="room_name" value="${reservationdata.room_name }"/>
		<input type="hidden" name="price" value="${reservationdata.price }"/>
		<input type="hidden" name="request" value="${reservationdata.request }"/>
		<input type="hidden" name="indate" value="${reservationdata.indate }"/>
		<input type="hidden" name="outdate" value="${reservationdata.outdate }"/>
	</form>
	
	<div>
		<jsp:include page="../base/footer.jsp"/>
	</div>
</body>
<script>
function rvtbtn(){
	var frm = document.getElementById("frm");
	var ch1 = document.getElementById("ch1");
	
	if(ch1.checked==true){
		frm.submit();
	}else {
		alert("환불규정을 확인하시고 체크박스에 체크해 주세요.");
	}
}
</script>
</html>