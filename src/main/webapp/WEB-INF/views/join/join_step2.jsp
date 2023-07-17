<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 회원가입</title>
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/petcarepedia_song.css">
<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jquery_song.js"></script>
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
	<div class="back"></div>
	<div class="term-box">
		<div class="term-modal">
			<div class="title">
				
			</div>
			<div class="term-btn">
				<button class="btn-yes" id="btnModalAgree">동의</button>
				<button class="btn-no" id="btnModalClose">닫기</button>
			</div>
		</div>
	</div>
	<img src="http://localhost:9000/petcarepedia/images/loading.gif" id="loading">
	
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- content -->
	<div class="content">
		<div class="join-container">
			<div class="content-logo">
				<img src="http://localhost:9000/petcarepedia/images/contentlogo.png" width="300px">
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
				<div class="step active">
					<div>
						<p>Step 2</p>
						<div></div>
						<p>약관 동의</p>
					</div>
				</div>
				<i class="fa-solid fa-chevron-right fa-2xl" style="color:#d8d8d8"></i>
				<div class="step">
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
			<c:choose>
				<c:when test="${grade == 'user'}">
					<p class="explain"><span>펫캐어피디아</span>는 원활한 동물병원 정보 제공 및 예약, 리뷰 작성 서비스 이용을 위해 <span>홈페이지 이용약관 동의</span>를 진행하고 있습니다.</p>
				</c:when>
				<c:otherwise>
					<p class="explain"><span>펫캐어피디아</span>는 원활한 동물병원 정보 수집 및 관리를 위한 <span>홈페이지 이용약관 동의</span>를 진행하고 있습니다.</p>
				</c:otherwise>
			</c:choose>
			
			<div class="join-content">
				<form name="termForm" action="#" method="post">
					<ul>
						<li class="terms">
							<label>이용약관</label>
							<ul>
								<li>
									<input type="checkbox" name="term" id="termAll" value="all"><span>전체 동의</span>
								</li>
								<li>
									<input type="checkbox" name="term" id="term1" value="1"><span><a id="1" class="btnModalOpen">이용약관</a> 동의 <span class="ess">*</span></span>
								</li>
								<li>
									<input type="checkbox" name="term" id="term2" value="2"><span><a id="2" class="btnModalOpen">개인정보 수집 및 이용</a> 동의 <span class="ess">*</span></span>
								</li>
								<li>
									<input type="checkbox" name="term" id="term3" value="3"><span>[선택] <a id="3" class="btnModalOpen">위치기반서비스 이용약관</a> 동의</span>
								</li>
								<li>
									<input type="checkbox" name="term" id="term4" value="4"><span>[선택] <a id="4" class="btnModalOpen">마케팅 정보 활용 및 수신</a> 동의</span>
								</li>
							</ul>
						</li>
						<span id="termcheck_msg"></span>
						
						<li>
							<button type="button" id="btn1step" class="btn-submit pstep">이전 단계</button>
							<button type="button" id="btn3step" class="btn-submit nstep">다음 단계</button>
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