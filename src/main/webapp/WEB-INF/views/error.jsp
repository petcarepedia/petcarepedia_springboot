<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
	<title>우리 동네 동물병원 리뷰 사전, 펫캐어피디아</title>
	<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/error.css">
	<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jquery_song.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=krftgsruiz"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>

<body>

	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
	
	<!-- content -->
	<div class="main_error">
		<img src="http://localhost:9000/petcarepedia/images/404.gif">
		
		<div class="main_text">
			<h1>페이지를 찾을 수 없습니다.</h1>
			<!-- <h2>(404 Not Found)</h2> -->
			<br>
			<p>페이지가 존재하지 않거나, 잘못된 경로를 이용하셨습니다. 🐾
		</div>
		
		<a href="http://localhost:9000/petcarepedia/index.do"><button class="main_home">메인으로</button></a>
	</div>
	
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>