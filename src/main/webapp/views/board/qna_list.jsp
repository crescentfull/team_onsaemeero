<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 목록 페이지</title>
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
			<li><a class="후기" id="review" href="review_list">후기</a></li>
			<li><a id="faq" href="faq_list">자주묻는질문</a></li>
			<li><a class="qna" id="qna" href="qna_list">1:1 문의</a></li>
		</ul>
	</div>

<div class="content_wrapper">
<div id="a" class="content1_wrapper">
<div id="contents">
		<h1>1:1문의</h1>
		<h3>고객님의 1:1문의 사항을 작성하여 주십시오 </h3>
		 
		<table class="board_list">
			<tr>
				<td colspan="6" align="right">
					<form action="">
						<div class="searchbox">
							<select name="sort">
								<option selected="selected" value="all">전체</option>
								<option value="title">제목</option>
								<option id="one" value="category">지점</option>
								<option value="content">내용</option>
								<option value="pname">작성자</option>
							</select>
					
							<input type="text" name="search" />
							<input type="submit" value="검색"/>
						</div>
					</form>
				</td>
			</tr>
			<tr>
				<td>번호</td>
				<td>지점</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>답변여부</td>
			</tr>
		<c:forEach items="${mainData }" var="vo" varStatus="no">
			<tr>
				<td>${vo.start+no.count}</td> <!-- 순서만 따지는 no.index가 들어가는게 맞다 -->
				<td>${vo.category}</td>
				<td class="title"><a href="qna_detail?no=${vo.no }">${vo.title }</a></td>
				<td>${vo.pname }</td>
				<td>${vo.reg_dateStr }</td>
				<td>${vo.reply }</td>
			</tr>
		</c:forEach>
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
			<tr >
				<td colspan="6" align="right">
					<a href="qna_writeForm">글쓰기</a>
				</td>
			</tr>
		</table>
		</div>
	</div>	

	<div id="b" class="content2_wrapper">
	<div id="contents">	
		<h1>1:1문의</h1>
		<h3>고객님의 1:1문의 사항을 작성하여 주십시오 </h3>
	 
		<table class="board_list">
			<tr>
				<td>번호</td>
				<td>지점</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>답변여부</td>
			</tr>
			<c:forEach items="${qnalist }" var="vo" varStatus="no">
				<tr>
					<td>${vo.start2+no.count}</td>
					<td>${vo.category }</td>
					<td class="title"><a href="qna_detail?no=${vo.no }">${vo.title }</a></td>
					<td>${vo.pname }</td>
					<td>${vo.reg_dateStr }</td>
					<td>${vo.reply }</td>
				</tr>
			</c:forEach>
				<tr>
					<td id="pagenum" colspan="6" align="right">
						<c:if test="${boardVO.startPage2>1 }">
								<a href="?nowPage2=${boardVO.startPage2-1 }">◀</a>
						</c:if>
								
						<c:forEach begin="${boardVO.startPage2 }" end="${boardVO.endPage2 }" var="i">
							<c:choose>
								<c:when test="${boardVO.nowPage2==i }">
										<a>[${i }]</a>
								</c:when>
								<c:otherwise>
									<a href="?nowPage2=${i }">${i }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${boardVO.endPage2<boardVO.totalPage2 }">
								<a href="?nowPage2=${boardVO.endPage2+1 }">▶</a>
						</c:if>
					</td>
				</tr>
			<tr>
				<td  colspan="6" align="right">
					<a id="write" href="qna_writeForm">글쓰기</a>
				</td>
			</tr>
		</table>
	</div>
	</div>
	
	<div id="c" class="content3_wrapper">
	<div id="contents">	
		<h1>1:1문의</h1>
		<h3>고객님의 1:1문의 사항을 작성하여 주십시오 </h3>
	 
		<table class="board_list">
			<tr>
				<td>번호</td>
				<td>지점</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>답변여부</td>
			</tr>
			<c:forEach items="${qnalist2 }" var="vo" varStatus="no">
				<tr>
					<td>${vo.start3+no.count}</td>
					<td>${vo.category }</td>
					<td class="title"><a href="qna_detail?no=${vo.no }">${vo.title }</a></td>
					<td>${vo.pname }</td>
					<td>${vo.reg_dateStr }</td>
					<td>${vo.reply }</td>
				</tr>
			</c:forEach>
		<tr>
			<td id="pagenum" colspan="6" align="right">
				<c:if test="${boardVO.startPage3>1 }">
						<a href="?nowPage3=${boardVO.startPage3-1 }">◀</a>
				</c:if>
						
				<c:forEach begin="${boardVO.startPage3 }" end="${boardVO.endPage3 }" var="i">
					<c:choose>
						<c:when test="${boardVO.nowPage3==i }">
								<a>[${i }]</a>
						</c:when>
						<c:otherwise>
							<a href="?nowPage3=${i }">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${boardVO.endPage3<boardVO.totalPage3 }">
						<a href="?nowPage3=${boardVO.endPage3+1 }">▶</a>
				</c:if>
			</td>
		</tr>
		</table>
	</div>
	</div>
</div>

						<!-- 푸터 -->
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>
</body>

<script src="<c:url value="/js/board/boardlist.js"/>"></script>
<script>
function hide(){
	var kind = document.getElementById("kind");
	var a = document.getElementById("a");
	var b = document.getElementById("b");
	var c = document.getElementById("c");
	var one = document.getElementById("one");
	
	
	a.style.display='none';
	b.style.display='none';
	c.style.display='none';
	one.style.display='none';

if(kind.value=="1" ){
		a.style.display='block';
		one.style.display='block';
	}else if(kind.value=="3" || kind.value=="4"){
		a.style.display='none';
		b.style.display='block';
	}else if(kind.value=="2") {
		a.style.display='none';
		b.style.display='none';
		c.style.display='block';
		
	}
} hide();

</script>
</html>