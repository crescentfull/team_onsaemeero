<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/board/board.css"/>" />
<script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
<title>1:1문의 상세 페이지</title>
</head>
<style>
table {
	margin-top: 20px;
}
</style>
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
		<div class="board_detail">
		<h3>${mainData.title }</h3>

			<table class="boarddetail">
				<tr>
					<td class="head">제목</td>
					<td>${mainData.title }</td>
				</tr>
				<tr>
					<td class="head">작성자</td>
					<td>${mainData.pname }</td>
				</tr>
				<tr>
					<td class="head">작성일</td>
					<td>${mainData.reg_dateStr }</td>
				</tr>
				<tr>
					<td class="head">조회수</td>
					<td>${mainData.cnt }</td>
				</tr>
				<tr class="contents">
					<td class="head">내용</td>
					<td>${mainData.contentBr }</td>
				</tr>
				<tr>
					<td class="list" colspan="2" >
						<a href="qna_list">목록</a>
						<a id="del" href="deleteReg?no=${mainData.no }&kind=${mainData.kind }">삭제</a>
						<a id="edit" href="qna_modifyForm?no=${mainData.no }">수정</a>
					</td>
				</tr>
			</table>
		</div>

<!--답변 글  -->
		<div id="reply">
				<div id="replyc" >
				<h3>답변</h3>
				<input type="hidden" id="cnt" name="gno" value="${replyData.gno}" />
					<table class="boarddetail">
						
						<tr>
							<td class="head">제목</td>
							<td>${replyData.title }</td>
						</tr>
						<tr>
							<td class="head">작성자</td>
							<td>${replyData.pname }</td>
						</tr>
						<tr>
							<td class="head">작성일</td>
							<td>${replyData.reg_dateStr }</td>
						</tr>
						<tr class="contents">
							<td class="head">내용</td>
							<td>${replyData.contentBr }</td>
						</tr>
						<tr>
							<td class="list" colspan="2">
								<a id="del2" href="deleteReg?no=${replyData.no }&kind=reply&gno=${mainData.no }">삭제</a>
								<a id="edit2" href="reply_modifyForm?no=${replyData.gno }">수정</a>
							</td>
						</tr>
					</table>
				</div>
	<!-- 답변 글 작성 -->
	<div id="replyw">
		<form action="brwriteReg">
			<input type="hidden" name="kinds" value="reply"/>
			<input type="hidden" name="gno"  value="${mainData.no }"/>
			<input type="hidden" name="no"  value="${mainData.no }"/>
			<input type="hidden" name="id"  value="${userdata.id }"/>
			<input type="hidden" name="pw"  value="${userdata.pw }"/>
			
			
			<h3>답변글 작성</h3>
			<table class="board_write">
				<tr>
					<td class="head">제목</td>
					<td><input type="text" name="title" /></td>
				</tr>
				<tr>
					<td class="head">작성자</td>
					<td><input type="text" name="pname" value="${userdata.name }" readonly/></td>
				</tr>
				<tr>
					<td class="head">내용</td>
					<td><textarea name="content" id="editor" cols="100" rows="10" maxlength="1000"></textarea></td>
				</tr>
				<tr>
					<td class="reply_input" id="reply_submit" colspan="2" align="center">
						<input type="submit" value="작성" />
						<a href="qna_list">뒤로</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	</div>

</div>

						<!-- 푸터 -->
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>
	
<script src="<c:url value="/js/board/boardlist.js"/>"></script>
<script>
function hide(){
	var kind = document.getElementById("kind");
	var kinds = document.getElementById("kinds");
	var cnt = document.getElementById("cnt");
	var del = document.getElementById("del");
	var edit = document.getElementById("edit");
	var del1 = document.getElementById("del1");
	var edit2 = document.getElementById("edit2");
	var reply = document.getElementById("reply");
	var replyc = document.getElementById("replyc");
	var replyw = document.getElementById("replyw");
	var user = document.getElementById("user");
	var no = '${mainData.no}';
	let ok = '${mainData.reply}';
	
	
	del.style.display='none';
	edit.style.display='none';
	del2.style.display='none';
	edit2.style.display='none';
	replyc.style.display='none';
	replyw.style.display='block';
	
	
	if(cnt.value == "${mainData.no}") {
		if(kind.value=="1" ){
			del.style.display='none';
			del2.style.display='block';
			edit2.style.display='block';
			
			replyc.style.display='block';
			replyw.style.display='none';
		}else if(kind.value=="2"){
			del2.style.display='block';
			edit2.style.display='block';
			replyc.style.display='block';
			replyw.style.display='none';

		}else if(kind.value=="3"||kind.value=="4"){
			replyc.style.display='block';
			replyw.style.display='none';
			del.style.display='block';
			edit.style.display='none';
		}
	}else if(cnt.value == "") {
		if(kind.value=="1" ){
			del.style.display='none';
			del2.style.display='block';
			edit2.style.display='block';
			
			replyc.style.display='none';
			replyw.style.display='block';
		}else if(kind.value=="2"){
			del2.style.display='block';
			edit2.style.display='block';
			replyc.style.display='none';
			replyw.style.display='block';

		}else if(kind.value=="3"||kind.value=="4"){
			replyc.style.display='none';
			replyw.style.display='none';
			del.style.display='block';
			edit.style.display='block';
		}
	}
	} 
hide();

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