

function kind(){
	var kind = document.getElementById("kind");
	
	

	var notice = document.getElementById("notice");
	var adminNotice = document.getElementById("adminNotice");
	var review = document.getElementById("review");
	var faq = document.getElementById("faq");
	var qna = document.getElementById("qna");
	

	adminNotice.style.display='none';

	qna.style.display='none';
	
	if(kind.value==="3" || kind.value==="4"){
	
		qna.style.display='block';
	}else if(kind.value==="1"){
		adminNotice.style.display='block';

		qna.style.display='block';
	}else if(kind.value=="2"){
		adminNotice.style.display='block';

		qna.style.display='block';
}
}
kind();