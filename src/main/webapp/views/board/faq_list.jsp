<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문 목록 페이지</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/board/board.css"/>" />
</head>
<body>

					<!-- 헤더 -->
	<div>
		<jsp:include page="../base/header.jsp"/>
	</div>

	<div class="boardlist">
		<ul>
			<li><a id="notice" href="notice_list">공지사항</a></li>
			<li><a id="adminNotice" href="adminNotice_list">관리자공지사항</a></li>
			<li><a id="review" href="review_list">후기</a></li>
			<li><a id="faq" href="faq_list">자주묻는질문</a></li>
			<li><a id="qna" href="qna_list">1:1 문의</a></li>
		</ul>
	</div>
	
	<!-- 본문 -->
<div class="content_wrapper">


	<div id="contents">
	<h1>자주 묻는 질문</h1><br>
	<h3>자주 묻는 질문들을 한곳에 모았습니다</h3>
	

 
<table class="board_list">
	<tr>
		<td colspan="5" align="right">
			<form action="">
				<div class="searchbox">
					<select name="sort">
						<option selected="selected" value="all">전체</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
			
					<input type="text" name="search" />
					<input type="submit" value="검색"/>
				</div>
			</form>
		</td>
	</tr>
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
<c:forEach items="${mainData }" var="vo" varStatus="no">
	<tr>
		<td>${vo.start+no.count }</td> <!-- 순서만 따지는 no.index가 들어가는게 맞다 -->
		<td class="title"><a href="faq_detail?no=${vo.no }">${vo.title }</a></td>
		<td>${vo.pname }</td>
		<td>${vo.reg_dateStr }</td>
		<td>${vo.cnt }</td>
	</tr>
</c:forEach>
	<tr >
		<td id="pagenum" colspan="5" align="right">
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
		<td  colspan="5" align="right">
			<a id="write" href="faq_writeForm">글쓰기</a>
		</td>
	</tr>
</table>
</div>
</div>

<!-- 푸터 -->
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>
	
<script src="<c:url value="/js/board/boardlist.js"/>"></script>
<script type="text/javascript">
function hide(){
	var kind = document.getElementById("kind");
	var write = document.getElementById("write");
	
	write.style.display='none';
	
	if(kind.value=="3"){
		write.style.display='none';
	}else if(kind.value=="2"){
		write.style.display='none';
	}else if(kind.value=="1") {
		write.style.display='block';
	}else{write.style.display='none';}
}
hide();

</script>
</body>
</html>