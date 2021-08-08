<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value="/css/branch/branch_su_review.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/board/branch_review.css"/>" />
<meta charset="UTF-8">

<title>전주지점</title>
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
			<li class="branch"><a href="/branch/branch_jj" >지점소개</a></li>
			<li class="branch"><a href="/branch/branch_jj_sightseeing" >주변관광지</a></li>
			<li class="branch"><a href="/branch/branch_jj_place" >부대시설</a></li>
			<li class="branch"><a href="/branch/branch_jj_review" >후기</a></li>
		</ul>
	</div>
			<div id="onsemiro_su_ex1">
			<div id="reservation_btn">
				<button type="button" onclick="jeonju()" id="reservation_btn">전주지점-예약하기</button>
			</div>
			<h1>온새미로. 전주 후기</h1>
		</div>




<!--수정  사항  -->
		<div class="content_wrapper">
	 	<div id="contents">
		<h3>온새미로 방문객분들의 소중한 후기입니다</h3>
		
		<table class="board_list">

			<tr>
				<td>번호</td>
				<td>지점</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
		<c:forEach items="${mainData }" var="vo" varStatus="no">
			<tr>
				<td>${vo.start+no.count}</td> <!-- 순서만 따지는 no.index가 들어가는게 맞다 -->
				<td>${vo.category}</td>
				<td class="title"><a href="../board/review_detail?no=${vo.no }">${vo.title }</a></td>
				<td>${vo.pname }</td>
				<td>${vo.reg_dateStr }</td>
				<td>${vo.cnt }</td>
			</tr>
		</c:forEach>
			<tr>
			<tr>
				<td id="pagenum" colspan="6" align="right">
					<c:if test="${boardVO.startPage>1 }">
							<a href="?nowPage=${boardVO.startPage-1 }">◀</a>
					</c:if>
							
					<c:forEach begin="${boardVO.startPage }" end="${boardVO.endPage }" var="i">
						<c:choose>
							<c:when test="${boardVO.nowPage==i }">
									<a>[${i }]</a>
							</c:when>
							<c:otherwise>
								<a href="?nowPage=${i }">${i }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${boardVO.endPage<boardVO.totalPage }">
							<a href="?nowPage=${boardVO.endPage+1 }">▶</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td  colspan="6" align="right">
					
					<a id="write" href="../board/review_writeForm?category=온새미로-전주">글쓰기</a>
				</td>
			</tr>
		</table>
		</div>
</div>
	

	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>
</body>
<script>
function jeonju(){
	location.href="../reservation/calendar?b_name=온새미로-전주"
}
function hide(){
	   var kind = document.getElementById("kind");
	   var write = document.getElementById("write");
	   
	   write.style.display='none';
	   
	   if(kind.value=="1" || kind.value=="2" || kind.value=="3" || kind.value=="4"){
	      write.style.display='none';
	   }else{write.style.display='none';
	   }
	}hide();

</script>
</html>