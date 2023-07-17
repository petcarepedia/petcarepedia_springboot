<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
				<div class="find-pw">
					<c:choose>
						<c:when test="${sessionScope.svo == null}">
							<div id="btnMenuIdFind">아이디 찾기</div>
							<div id="btnMenuPwFind">비밀번호 재설정</div>
						</c:when>
						<c:otherwise>
							<div id="btnMenuPwFind" style="width:100%; border:none; border-bottom:1px solid #98dfff">비밀번호 재설정</div>
						</c:otherwise>
					</c:choose>
				</div>
				
				<ul class="update-success">
					<li class="update-success">
						<img src="http://localhost:9000/petcarepedia/images/check.png" width="100px">
						<p>비밀번호가 재설정되었습니다.<br>다시 로그인해주세요.</p>
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