 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/board/board.css"/>" />
<script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
<title>공지사항 글쓰기</title>
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
<h3>공지사항 글쓰기</h3>

<form action="writeReg">
	<input type="hidden" name="kind" value="notice"/>
	<input type="hidden" name="pw" value="${userdata.pw }"/>
	<input type="hidden" name="id" value="${userdata.id }"/>
	<table class="board_write">
		<tr>
			<td class="head">제목</td>
			<td><input type="text" name="title" /></td>
		</tr>
		<tr>
			<td class="head">작성자</td>
			<td><input type="text" name="pname" value="관리자" readonly /></td>
		</tr>
		<tr>
			<td class="head">내용</td>
			<td><textarea name="content" id="editor" cols="100" rows="10"></textarea></td>
		</tr>
		<tr>
			<td class="reply_input" colspan="2" align="center">
				<input type="submit" value="작성" />
				<a href="notice_list">뒤로</a>
			</td>
		</tr>
	</table>
</form>
</div>

				<!-- 푸터 -->
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>
	
<script src="<c:url value="/js/board/boardlist.js"/>"></script>
<script>
ClassicEditor
.create( document.querySelector( '#editor' ), {
    toolbar: [ 'heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote' ],
    heading: {
        options: [
            { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
            { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
            { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' }
        ]
    }
} )
.catch( error => {
    console.log( error );
} );
</script>
</body>
</html>