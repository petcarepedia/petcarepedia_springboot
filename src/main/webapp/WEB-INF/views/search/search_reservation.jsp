<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
	<title>펫캐어피디아 | 예약</title>
	<link rel="stylesheet" href="http://localhost:9000/css/search_reservation.css">

	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
	<script src="http://localhost:9000/js/search_reservation.js"></script>
	<script>
	/* 정보 표시 */
	$(".hservation").click(function() {
		$("#hmodal").css("display", "block");
		$('input[name="hid"]').val($(this).val());
		$('input[name="startTime"]').val($("#startTime").val());
		$('input[name="endTime"]').val($("#endTime").val());
		$('span#rhname').text($(this).attr("id"));
	});
</script>
</head>

<body>
	<div class="reservation">
		<div class="title">
			<span id="rhname">${hospital.hname}</span>
			<span>원하는 날짜/시간 선택</span>
		</div>
		
		<hr>
	
		<div class="date">
		  <span><a id="prev">&lt;</a></span>
		  <span class="sdate"><input type="text" name="date" value="" readonly></span>
		  <span class="sdate"><input type="text" name="date" value="" readonly></span>
		  <span class="sdate"><input type="text" name="date" value="" readonly></span>
		  <span class="sdate"><input type="text" name="date" value="" readonly></span>
		  <span class="sdate"><input type="text" name="date" value="" readonly></span>
		  <span><a id="next">&gt;</a></span>
		</div>

		<hr>
	    
    	<div class="rtime"></div>	
	    <!-- 영업시간 db연동 -->
	    <input type="hidden" id="now" name="now" value="">
	    <input type="hidden" id="startTime" name="startTime" value="${time.start}">
	    <input type="hidden" id="endTime" name="endTime" value="${time.end}">
	    <input type="hidden" id="rholiday" value="${hospital.holiday}">

	    <form name="reservationForm" action="/reservation" method="post">
			<input type="hidden" name="hid" value="${hospital.hid}">
			<input type="hidden" name="mid" value="${sessionScope.svo.mid}"> 
		    <input type="hidden" id="vdate" name="vdate" value="">
			<input type="hidden" id="vtime" name="vtime" value="">
			<button type="button" id="check">확인</button>
		</form>
	</div>
</body>
</html>