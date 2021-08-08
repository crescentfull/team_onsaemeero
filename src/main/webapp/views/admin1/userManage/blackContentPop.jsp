<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	input#content{width:400px;height:40px; font-size:18px;}
	button{
	margin-left:15px;
	border:1px solid black;
	background:white;
	
	cursor:pointer;
	color:#EEEEEE;
	font-size:16px;
	background: #362222;
	border-radius: 30px;
	width:auto;
	height:55px;
	padding:10px;
	}
	button:hover{
		font-weight:bold;
		transition:0.1s;
	}
	
</style>
</head>

<body>

	<h3>블랙리스트 등록</h3>
	<input type="text" id="content" name="content" placeholder="사유를 입력하세요" value=""/> <button onclick="gogo()">${blackId }님의 사유 등록</button>
	
	
	<script type="text/javascript">
		function gogo(){
			
			var content = document.getElementById("content").value;"src/main/webapp/views/base/header.jsp"
			var id = '${blackId }';
			

			var ok = confirm(id+'정말로 등록하시겠습니까?');
			
			if(ok == true){
				opener.document.location.href="/admin1/user/blackContentReg?id="+id+"&&content="+content
				self.close();
			}else{
				self.close();
			} 
				
			

			
		}
		

	</script>

</body>
</html>