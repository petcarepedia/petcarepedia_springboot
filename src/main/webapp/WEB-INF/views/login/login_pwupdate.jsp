<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 아이디,비밀번호 찾기</title>
<link rel="stylesheet" href="http://localhost:9000/css/petcarepedia_song.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/petcarepedia_jquery_song.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- content -->
	<div class="content">
		<div class="find-content">
			<div class="content-logo">
				<img src="http://localhost:9000/images/contentlogo.png" width="300px">
			</div>
			
			<form name="pwUpdateForm" action="login_pwupdate_proc" method="post">
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
					
					<p><span id="id_sec"></span> 계정의 비밀번호를 재설정해주세요.</p>
					<input type="hidden" name="mid" value="${mid}" id="mid">
					
					<ul>
						<li>
							<label>새 비밀번호</label>
							<input type="password" name="pass" id="pass" placeholder="8~16자리 영문, 숫자, 특수문자 조합">
							<input type="checkbox" name="pass-see" id="psee"><p id="psee">비밀번호 보기</p>
							<span id="pwcheck_msg"></span>
						</li>
						<li>
							<label>새 비밀번호 확인</label>
							<input type="password" name="cpass" id="cpass" placeholder="비밀번호를 다시 입력해주세요">
							<input type="checkbox" name="cpass-see" id="cpsee"><p id="psee">비밀번호 보기</p>
							<span id="cpwcheck_msg"></span>
						</li>
						<li><button type="submit" id="btnPwUpdate" class="btn-submit" disabled>비밀번호 재설정</button></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
	
	<script>
		let id = "${mid}";
		let id_sec = "";
		if(id.length%2==0){
			id_sec = id.substring(0,id.length/2) + '*'.repeat(id.length/2);
		} else {
			id_sec = id.substring(0,id.length/2+1) + '*'.repeat(id.length/2);
		}
		
		document.getElementById("id_sec").innerHTML=id_sec;
	</script>
</body>
</html>