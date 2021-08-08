	$.datepicker.setDefaults({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년'
	});
	
	$(document).ready(function(){
		$("#datepicker1").datepicker({
			numberOfMonths: 1,
		onSelect: 
			function(selected) {
				$("#datepicker2").datepicker("option","minDate", selected)
			}
		});
	$("#datepicker2").datepicker({
		numberOfMonths: 1,
			onSelect: function(selected) {
				$("#datepicker1").datepicker("option","maxDate", selected)
			}
		});
	});
	function resvCxl(no){
		
		
		var resvNo = no;
		var chk = confirm('예약번호:'+no+'의 예약 건을 취소 하시겠습니까?');
		if(chk == true){
			location.href="/admin1/rsvManage/cancel?no="+no;
		}
	}
	function chkVal(){
		
		var theForm = document.searchForm;
		
		
		if(theForm.firdate.value == '' || theForm.firdate.value == null){
			alert('날짜를 선택해주세요.');
		}else{
			document.getElementById("form1").submit();
		}
	}