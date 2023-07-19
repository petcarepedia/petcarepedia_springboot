<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 아이디,비밀번호 찾기</title>
<link rel="stylesheet" href="http://localhost:9000/css/petcarepedia_song.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/petcarepedia_jquery_song.js"></script>
<script>
$(document).ready(function(){
	$('#loading').hide(); //첫 시작시 로딩바를 숨겨준다.
	
	$('#btnIdFind').click(function(){
		$('#loading').show();
	});
})
</script>
</head>
<body>
	<img src="http://localhost:9000/images/loading.gif" id="loading">
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- content -->
	<div class="content">
		<div class="find-content">
			<div class="content-logo">
				<img src="http://localhost:9000/images/contentlogo.png" width="300px">
			</div>
			
			<form name="idFindForm" action="login_idfind_proc" method="post">
				<div class="find-box">
					<div>
						<div id="btnMenuIdFind">아이디 찾기</div>
						<div id="btnMenuPwFind">비밀번호 재설정</div>
					</div>
					
					<p>회원정보에 등록된 정보로 아이디를 찾을 수 있습니다.</p>
					<ul>
						<li>
							<label>성명</label>
							<input type="text" name="name" id="name" placeholder="성명 입력">
						</li>
						<li>
							<label>이메일</label>
							<input type="text" name="email" id="email" placeholder="이메일 입력">
							<span id="emailcheck_msg"></span>
						</li>
						<li><button type="submit" id="btnIdFind" class="btn-submit" disabled>아이디 찾기</button></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>