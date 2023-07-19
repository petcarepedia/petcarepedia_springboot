<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 회원가입</title>
<link rel="stylesheet" href="http://localhost:9000/css/petcarepedia_song.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/petcarepedia_jquery_song.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://kit.fontawesome.com/4ed285928f.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css" integrity="sha384-QYIZto+st3yW+o8+5OHfT6S482Zsvz2WfOzpFSXMF9zqeLcFV0/wlZpMtyFcZALm" crossorigin="anonymous">
<script>
$(document).ready(function(){
	$('#loading').hide(); //첫 시작시 로딩바를 숨겨준다.
})
.ajaxStart(function(){
	$('#loading').show(); //ajax실행시 로딩바를 보여준다.
})
.ajaxStop(function(){
	$('#loading').hide(); //ajax종료시 로딩바를 숨겨준다.
});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<img src="http://localhost:9000/images/loading.gif" id="loading">
	
	<!-- content -->
	<div class="content">
		<div class="join-container">
			<div class="content-logo">
				<img src="http://localhost:9000/images/contentlogo.png" width="300px">
			</div>
			
			<div class="step-box">
				<div class="step active pass">
					<div>
						<p>Step 1</p>
						<div></div>
						<p>회원 유형 선택</p>
					</div>
				</div>	
				<i class="fa-solid fa-chevron-right fa-2xl" style="color:#d8d8d8"></i>
				<div class="step active pass">
					<div>
						<p>Step 2</p>
						<div></div>
						<p>약관 동의</p>
					</div>
				</div>
				<i class="fa-solid fa-chevron-right fa-2xl" style="color:#d8d8d8"></i>
				<div class="step active">
					<div>
						<p>Step 3</p>
						<div></div>
						<p>본인 인증</p>
					</div>
				</div>
				<i class="fa-solid fa-chevron-right fa-2xl" style="color:#d8d8d8"></i>
				<div class="step">
					<div>
						<p>Step 4</p>
						<div></div>
						<p>정보 입력</p>
					</div>
				</div>
				<i class="fa-solid fa-chevron-right fa-2xl" style="color:#d8d8d8"></i>
				<div class="step">
					<div>
						<p>Step 5</p>
						<div></div>
						<p>가입 완료</p>
					</div>
				</div>
			</div>
			
			<input type="hidden" value="${grade}" id="grade">
			<p class="explain"><span>펫캐어피디아</span>는 안전한 인터넷 서비스를 위해 <span>이메일 본인인증</span>을 진행하고 있습니다.</p>
			
			<div class="join-content">
				<form name="joinForm" action="#" method="post">
					<ul>
						<li>
							<label>이메일</label>
							<input type="text" name="email" id="email" placeholder="이메일 입력" class="input-short">
							<button type="button" class="btn-short" id="btnAuthEmail" disabled>인증번호 전송</button>
							<span id="emailcheck_msg"></span>
							
							<input type="hidden" id="data">
							
							<input type="text" name="cemail" id="cemail" placeholder="인증번호 입력" class="input-short einput" style="display:none">
							<button type="button" class="btn-short" id="btnCheckEmail" style="display:none">인증번호 확인</button>
							<span id="emailauthcheck_msg"></span>
						</li>
						
						<li>
							<button type="button" id="btn2step" class="btn-submit pstep">이전 단계</button>
							<button type="button" id="btn4step" class="btn-submit nstep">다음 단계</button>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%-- <jsp:include page="../footer.jsp"></jsp:include> --%>
</body>
</html>