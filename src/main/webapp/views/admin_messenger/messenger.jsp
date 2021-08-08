<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메신저</title>
<script src="<c:url value="/js/jquery-3.6.0.min.js"/>"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
<script>
var roomId = '${roomId}';
</script>
<style>
	div#main_content {
		width : 500px;
		margin: 0 auto;
	}
	textarea {
		width: 100%;
	}
	form {
		height: 500px;
	}
	div.chat-messages {
		width: 100%;
		height: 100%;
		overflow : auto;
	}
	#buttonzip {
		float : right;
	}
	#buttonzip > input {
		font-size : 15px;
		width : 80px;
		height : 30px;
		background-color : #52565f;
		border : none;
		color : white;
		border-radius : 8px;
	}
	#buttonzip > input:hover {
		background-color : lightgray;
		color : #52565f;
	}
</style>
<script>
function Chat__addMessage(writer, body){
	
	$.post(
		'./doAddMessage',
		{
			roomId:roomId,
			writer:writer,
			body:body
		},
		function(data) {
			
		},
		'json'
	);
}

function Chat__drawMessage(chatMessage){
	if(chatMessage.writer=='${userdata.name}'){
		var html = '나' + ' : ' + chatMessage.body;
	}else {
		var html = chatMessage.writer + ' : ' + chatMessage.body;
	}
	$('.chat-messages').append('<div>' + html + '</div>');
}

var Chat__lastLoadedMessageId = 0;

function Chat__loadNewMessages(){
	$.get(
		'./getMessagesFrom',
		{
			roomId:roomId,
			from:Chat__lastLoadedMessageId +1
		},
		function(data){
			for(var i=0; i<data.messages.length; i++){
				Chat__drawMessage(data.messages[i]);
				
				Chat__lastLoadedMessageId = data.messages[i].newId;
			}
		},
		'json'
	);
}

setInterval(Chat__loadNewMessages, 1000);

function submitChatMessageForm(form) {
	form.writer.value = form.writer.value.trim();
	
	if(form.writer.value.length ==0){
		alert('작성자를 입력해주세요.');
		form.writer.focus();
		
		return false;
	}
	
	if(form.body.value.length ==0){
		alert('내용을 입력해주세요');
		form.body.focus();
		
		return false;
	}
	
	var writer = form.writer.value;
	var body = form.body.value;
	
	form.body.value = '';
	form.body.focus();
	
	Chat__addMessage(writer, body);
	
	var scrollheight = document.getElementById("chat-messages").scrollHeight;

	$(".chat-messages").scrollTop(scrollheight);
	
}
</script>
</head>
<body>

	<div id="header">
		<jsp:include page="../base/header.jsp"/>
	</div>
	<div id="main_content">
		<h1>총관리자-${roomname }지점 관리자</h1>
		
		<form onsubmit="submitChatMessageForm(this); return false;" id="messengerform">
		
			<div id="chat-messages" class="chat-messages"></div>
			
			<div>
				<input type="hidden" id="aa" name="writer" value="${userdata.name }">
				<input type="hidden" name="roomId" value="${roomId }">
			</div>
			
			<div>
				<textarea name="body" placeholder="내용"></textarea>
			</div>
			
			<div id="buttonzip">
				<input type="submit" id="submitbtn" value="보내기"/>
				<input type="button" onclick="deleteAllMessages()" value="삭제"/>
			</div>
		</form>
	</div>
	
	
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>

</body>
<script>
function deleteAllMessages(){
	var frm = document.getElementById("messengerform");
	result = confirm("${roomname}지점 전체 메시지를 삭제하시겠습니까?");
	if(result){
		frm.action="deleteAllMessages";
		frm.submit();
	}
}
$('textarea').keypress(function(event){
    if ( event.which == 13 ) {
        $('#submitbtn').click();
        return false;
    }
});
</script>
</html>