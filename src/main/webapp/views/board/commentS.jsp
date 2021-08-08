<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<script src="../js/jquery-3.6.0.min.js"></script>
<script>
var b_no = '${mainData.no}'; //게시글 번호
 
$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
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
                a += '<div class="commentInfo'+value.c_no+'">'+'댓글번호 : '+value.c_no+' / 작성자 : '+value.writer;
                a += '<a onclick="commentUpdate('+value.c_no+',\''+value.content+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.c_no+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.c_no+'"> <p> 내용 : '+value.content +'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '/board/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
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
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
 
 
</script>