/*제이쿼리 메뉴 드롭다운*/

 $(".main_menu li").hover(function() {

        $(this).children("ul").stop().slideToggle(500)

      })
      

/* 메인페이지 메뉴 나타내기 js 로직*/

 function kind(){
	var kind = document.getElementById("kind");
	var login = document.getElementById("login");
	var mypage = document.getElementById("mypage");
	var logout = document.getElementById("logout");
	var admin = document.getElementById("admin");
	var admin2 = document.getElementById("admin2");
	var messengertotal = document.getElementById("messengertotal");
	var name = document.getElementById("name");
	var su = document.getElementById("messengersu");
	var jj = document.getElementById("messengerjj");
	var kj = document.getElementById("messengerkj");
	var gr = document.getElementById("messengergr");

	
	logout.style.display='none';
	admin.style.display='none';
	mypage.style.display='none';
	admin.style.display='none';
	admin2.style.display='none';
	messengertotal.style.display='none';
	su.style.display='none';
	jj.style.display='none';
	kj.style.display='none';
	gr.style.display='none';
	
	
	if(kind.value=="3" || kind.value=="4"){
		login.style.display='none';
		admin.style.display='none';
		admin2.style.display='none';
		logout.style.display='block';
		mypage.style.display='block';
		messengertotal.style.display='none';

	}else if(kind.value=="2"){
		login.style.display='none';
		admin.style.display='none';
		admin2.style.display='block';
		logout.style.display='block';
		if(name.value=="온새미로-서울"){
			su.style.display='block';
		}else if(name.value=="온새미로-경주"){
			kj.style.display='block';
		}else if(name.value=="온새미로-전주"){
			jj.style.display='block';
		}else if(name.value=="온새미로-강릉"){
			gr.style.display='block';
		}

	}else if(kind.value==="1") {
		login.style.display='none';
		admin.style.display='block';
		admin2.style.display='none';
		logout.style.display='block';
		messengertotal.style.display='block';
	}
}kind();
