/**
 * 
 */
 function chkid(){
	var input = document.getElementById("inputid");
	var id = document.getElementById("id");
	var btn = document.getElementById("chkidbtn");
	var idok = document.getElementById("idok");
	var idhidden = document.getElementById("idhidden");
	var idchkbox = document.getElementById("idchkbox");
	
	id.style.display='none';
	idok.style.display='none';
	idchkbox.style.display='none';
	
	if(idhidden.value!=""){
		btn.style.display='none';
		input.style.display='none';
		id.style.display='block';
		idok.value='중복확인';
		idok.style.display='block';
		idchkbox.style.display='block';
	}
}
chkid();
function chkemail(){
	var input = document.getElementById("inputemail");
	var email = document.getElementById("email");
	var btn = document.getElementById("chkemailbtn");
	var emailok = document.getElementById("emailok");
	var emailhidden = document.getElementById("emailhidden");
	var emailchkbox = document.getElementById("emailchkbox");
	
	email.style.display='none';
	emailok.style.display='none';
	emailchkbox.style.display = 'none';
	
	if(emailhidden.value!=""){
		btn.style.display='none';
		input.style.display='none';
		email.style.display='block';
		emailok.style.display='block';
		emailchkbox.style.display='block';
		emailok.value='중복확인';
	}
}
chkemail();

$('#pwx').css('display', 'none');
$('#pwok').css('display', 'none');
const $pw = document.getElementById("pw");
const $pwchk = document.getElementById("pwchk");
$pw.addEventListener("blur", chpw);
$pwchk.addEventListener("blur", chpw2);
function chpw(){
	if($pw.value==""){
		$('#pwx').css('display', 'none');
		$('#pwok').css('display', 'none');
	}else if($pw.value!=$pwchk.value){
		$('#pwx').css('display', 'block');
		$('#pwok').css('display', 'none');
	}else {
		$('#pwok').css('display','block');
		$('#pwx').css('display', 'none');
	}
}
function chpw2(){
	if($pw.value==""){
		$('#pwx').css('display', 'none');
		$('#pwok').css('display', 'none');
	}else if($pw.value!=$pwchk.value){
		$('#pwx').css('display', 'block');
		$('#pwok').css('display', 'none');
	}else {
		$('#pwok').css('display','block');
		$('#pwx').css('display', 'none');
	}
}
$("#front").keyup(function(event){
    if (!(event.keyCode >=37 && event.keyCode<=40)) {
        var inputVal = $(this).val();
        $(this).val(inputVal.replace(/[^0-9]/gi,''));
    }
});
$("#back").keyup(function(event){
    if (!(event.keyCode >=37 && event.keyCode<=40)) {
        var inputVal = $(this).val();
        $(this).val(inputVal.replace(/[^0-9]/gi,''));
    }
});

function chkpw(){
	var pw = document.getElementById("pw").value;
	var pwchk = document.getElementById("pwchk").value;
	
	if(pw!=""&&pwchk!=""){
		if(pw!=pwchk){
			$('#pwx').css('display', 'block');
		}else{
			$('#pwok').css('display','block');
		}
	}
}chkpw();

function joinReg() {
	var frm = document.getElementById("joinform");
	var idok = document.getElementById("idhidden").value;
	var emailok = document.getElementById("emailhidden").value;
	var pw = document.getElementById("pw").value;
	var pwchk = document.getElementById("pwchk").value;
	var name = document.getElementById("name").value;
	var name_m = name.match(/[a-z,A-Z,0-9,!@#$%^&*()=_+ ]/g);
	var front = document.getElementById("front").value;
	var back = document.getElementById("back").value;
	var phone = document.getElementById("phone").value;
	if(idok!='check'){
		alert('아이디 중복확인을 해주세요');
	}else if(emailok!='check'){
		alert('이메일 중복확인을 해주세요');
	}else if(pw==''||pw==null){
		alert('비밀번호를 입력해 주세요.');
	}else if(pwchk==''||pwchk==null){
		alert('비밀번호 확인을 해주세요');
	}else if(pw!=pwchk){
		alert('입력하신 비밀번호가 다릅니다. 확인 후 이용해주세요.');
	}else if(name==''||name==null){
		alert('이름을 입력해 주세요.');
	}else if(name_m!=null){
		alert('이름에는 한글만 입력해 주세요.');
	}else if(front==''||front==null){
		alert('생년월일을 입력해 주세요.');
	}else if(back==''||back==null){
		alert('주민등록번호 앞 1자리를 입력해 주세요.');
	}else if(phone==''||phone==null){
		alert('휴대폰 번호를 입력해 주세요.');
	}else {
		frm.action="joinReg";
		frm.submit();
	}
}