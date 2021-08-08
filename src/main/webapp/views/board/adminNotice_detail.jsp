<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/board/board.css"/>" />
<title>관리자 공지사항 상세 페이지</title>
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
		<div class="board_detail">
		<h3>${mainData.title }</h3>
		
		<input type="hidden" name="kind" value="${mainData.kind }"/>
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
				<td class="list" colspan="2">
				<a href="adminNotice_list">목록</a>
				<a id="del" href="deleteReg?no=${mainData.no }&kind=${mainData.kind }">삭제</a>
				<a id="edit" href="adminNotice_modifyForm?no=${mainData.no }">수정</a>
				</td>
			</tr>
		
		</table>
		</div>
		
		<!-- 댓글 글쓰기 폼 -->
		<div class="commentform">
		    <form name="commentInsertForm">
		        <input type="hidden" name="b_no" value="${mainData.no}"/>
		        작성자: <input type="text" name="writer" size="20" maxlength="20" value="${userdata.name }" readonly/> <br/>
		        <textarea id="content" name="content" rows="3" cols="140" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
		        <span  class="input-group-btn">
		        	<button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
		        </span>
		    </form>
		</div>
		
		<!-- 댓글 목록 출력 -->
		<div class="container">
		        <div class="commentList"></div>
		</div>
</div>
		<!-- 푸터 -->
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="<c:url value="/js/board/boardlist.js"/>"></script>
<script>
function hide(){
	var kind = document.getElementById("kind");
	var del = document.getElementById("del");
	var edit = document.getElementById("edit");
	
	del.style.display='none';
	edit.style.display='none';

	if(kind.value=="1"){
		del.style.display='block';
		edit.style.display='block';
	}
}
hide();



var b_no = ${mainData.no}; //게시글 번호



$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});

//댓글 목록 
function commentList(){
    $.ajax({
        url : '/board/list',
        type : 'get',
        data : {'b_no':b_no},
        success : function(data){
            var a ='';
            
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.c_no+'">'+'날짜 : '+value.reg_dateStr+' / 작성자 : '+value.writer;
               if(value.writer=='${userdata.name}'){
                	a += '<a onclick="commentDelete('+value.c_no+');"> 삭제 </a> ';
	                a += '<a onclick="commentUpdate('+value.c_no+',\''+value.content+'\');"> 수정 </a> </div>';
               }
                a += '<div class="commentContent'+value.c_no+'"> <p> 내용 : '+value.content +'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}







$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)\
   // commentList();
});
 
 
 



//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '/board/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == "") {
            	alert("내용이 없습니다");
            	}else if(data==1) {
            	
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(c_no, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+c_no+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+c_no+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+c_no).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(c_no){
    var updateContent = $('[name=content_'+c_no+']').val();
    
    $.ajax({
        url : '/board/update',
        type : 'post',
        data : {'content' : updateContent, 'c_no' : c_no},
        success : function(data){
            if(data == 1) commentList(b_no); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(c_no){
    $.ajax({
        url : '/board/delete/'+c_no,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(b_no); //댓글 삭제후 목록 출력 
        }
    });
}
/* 
 */
 
 

</script>
</body>
</html>