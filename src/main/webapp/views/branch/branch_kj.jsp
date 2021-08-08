<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value="/css/branch/branch_su.css"/>"></link>
<meta charset="UTF-8">
<title>경주지점</title>
</head>
<style>
</style>
<body>
	<div id="header">
		<jsp:include page="../base/header.jsp"/>
	</div>
		<div id="onsemiro_ex">
			<img src="/views/img1/로고/LOGO1.PNG" alt="" />
		</div>
		
		<div id="branchContent">
		<ul id="branch">
			<li class="branch"><a href="/branch/branch_kj" >지점소개</a></li>
			<li class="branch"><a href="/branch/branch_kj_sightseeing" >주변관광지</a></li>
			<li class="branch"><a href="/branch/branch_kj_place" >부대시설</a></li>
			<li class="branch"><a href="/branch/branch_kj_review" >후기</a></li>
		</ul>
	</div>
	<div id="content">
	
		<div id="onsemiro_su_ex1">
	<div id="reservation_btn">
		<button type="button" onclick="gyeongju()" id="reservation_btn">경주지점-예약하기</button>
	</div>
	<div id="branch_su_structure">
			<div id="branch_su_structure1">
				<h1>온새미로. 경주 조감도</h1>
				<img alt="" src="/views/img1/온새미로_서울/서울_조감도.PNG">
				<p style="margin : -180px 0px 200px 200px;">온새미로-경주 주소 : 경상북도 경주시 양정로 260</p>
								<p style="color : red;">※ 각 호의 크기는 동일합니다.</p>
			</div>
			<div id="branch_su_structure2">
				<h1>온새미로. 경주 평면도</h1>
				<img alt="" src="/views/img1/온새미로_서울/서울_평면도.PNG">
				<div id="branch_su_structure3">
				<table>
					<tr>
						<td style="color : #c4c9ca; font-size : 25px;">ROOM INFO</td>
						<td style="color : #c4c9ca; font-size : 25px;">ROOM DETALS</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td><span>기준인원</span> : 4명</td>
						<td>- 킹 2개 / 퀸 1개</td>
					</tr>
					<tr>
						<td><span>최대인원</span> : 6명</td>
						<td>- 빌트인 냉장고</td>
					</tr>
					<tr>
						<td><span>객실크기</span> : 32PY</td>
						<td>- 취사도구일체</td>
					</tr>
					<tr>
						<td><span>객실형태</span> : 3룸 2화장실 1테라스</td>
						<td>- 전자레인지</td>
					</tr>
					<tr>
						<td><span>입실시간</span> : PM 15:00</td>
						<td>- IPTV</td>
					</tr>
					<tr>
						<td><span>퇴실시간</span> : AM 11:00</td>
						<td>- 헤어드라이기</td>
					</tr>
					<tr>
						<td></td>
						<td>- 시스템에어컨</td>
					</tr>
					<tr>
						<td></td>
						<td>- 개인테라스</td>
					</tr>
					<tr>
						<td></td>
						<td>- 테라스 6인 테이블</td>
					</tr>
										<tr>
						<td></td>
						<td></td>
					</tr>
				</table>
				</div>
			</div>
		</div>
			<h1>온새미로. 경주</h1>
			<p id="p1"><span id="span1">천년의 고도에서</span><br> 한옥을 즐기다.</p>
			<p id="p2">온새미로 경주에서 <br>한옥의 전통적인 멋을 느껴보세요.</p>
		</div>
		<div class="branchImg" id="img1">
			<img src="/views/img1/온새미로_경주/경주_방외부.PNG" alt="" id="img1"/>
			<p>온새미로 경주 외부전경</p>
		</div>
		<div class="branchImg" id="img2">
			<img src="/views/img1/온새미로_경주/온새미로_경주_전경.PNG" alt=""  id="img2"/>
			<p>온새미로 경주 외부전경</p>
		</div>
		<div id="onsemiro_su_ex2">
			<p id="p1"><span id="span1">한옥의 특별함과&nbsp;&nbsp; </span><br>현대식 모던함을 경험하다.&nbsp;</p>
			<p id="p2">옛 신라의 문화와<br>정취를 만끽하세요.</p>
		</div>
		<div class="branchImg" id="img3">
			<img src="/views/img1/온새미로_경주/경주_큰방.PNG" alt="" id="img3"/>
		</div>
				<div class="branchImg"  id="img4">
			<img src="/views/img1/온새미로_경주/경주_거실.PNG" alt=""  id="img4"/>
		</div>
				<div class="branchImg" id="img5">
			<img src="/views/img1/온새미로_경주/경주_주방.PNG" alt="" id="img5"/>
		</div>
				<div class="branchImg" id="img6">
			<img src="/views/img1/온새미로_경주/경주_정자.PNG" alt="" id="img6"/>
		</div>
				<div class="branchImg" id="img7">
			<img src="/views/img1/온새미로_경주/경주_다도.PNG" alt="" id="img7"/>
		</div>

		

	</div>
	

	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>
</body>
<script>
function gyeongju(){
	location.href="../reservation/calendar?b_name=온새미로-경주"
}


</script>
</html>