<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 아이디,비밀번호 찾기</title>
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/petcarepedia_song.css">
<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jquery_song.js"></script>

</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- content -->
	<div class="content">
		<div class="find-content">
			<div class="content-logo">
				<img src="http://localhost:9000/petcarepedia/images/contentlogo.png" width="300px">
			</div>
			
			<div class="find-box">
				<div>
					<div id="btnMenuIdFind">아이디 찾기</div>
					<div id="btnMenuPwFind">비밀번호 재설정</div>
				</div>
				
				<ul class="update-success">
					<li class="update-success">
						<img src="http://localhost:9000/petcarepedia/images/check.png" width="100px">
						<p>아이디 찾기 결과가 이메일로 발송되었습니다.</p>
					</li>
					<li>
						<button type="button" id="btnBackLogin" class="btn-submit">로그인 화면으로 돌아가기</button>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>