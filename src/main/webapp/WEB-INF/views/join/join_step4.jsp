<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script>
const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
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
				<div class="step active pass">
					<div>
						<p>Step 3</p>
						<div></div>
						<p>본인 인증</p>
					</div>
				</div>
				<i class="fa-solid fa-chevron-right fa-2xl" style="color:#d8d8d8"></i>
				<div class="step active">
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
			
			<div class="join-content">
				<form name="joinForm" action="join_proc/" method="post">
					<input type="hidden" name="grade" value="${grade}" id="grade">
					<input type="hidden" name="email" value="${email}" id="email">
					<input type="hidden" name="msfile" value="c1b63a5c-c728-4dd4-bee0-5a08232fd775_cat.png" id="msfile">
					<ul>
					<li class="id">
						<label>아이디 <span class="ess">*</span></label>
						<p><span class="ess">*</span> 표시는 필수 입력 항목입니다.</p>
						<input type="text" name="mid" id="id" placeholder="4~20자의 영문, 숫자 조합" class="input-short">
						<button type="button" id="btnCheckId" class="btn-short" disabled>중복확인</button>
						<span id="idcheck_msg"></span>
					</li>
					<li>
						<label>비밀번호 <span class="ess">*</span></label>
						<input type="password" name="pass" id="pass" placeholder="8~16자리 영문, 숫자, 특수문자 조합">
						<input type="checkbox" name="pass-see" id="psee"><p id="psee">비밀번호 보기</p>
						<span id="pwcheck_msg"></span>
					</li>
					<li>
						<label>비밀번호 확인 <span class="ess">*</span></label>
						<input type="password" name="cpass" id="cpass" placeholder="비밀번호를 다시 입력해주세요">
						<input type="checkbox" name="cpass-see" id="cpsee"><p id="psee">비밀번호 보기</p>
						<span id="cpwcheck_msg"></span>
					</li>
					<li>
						<label>성명 <span class="ess">*</span></label>
						<input type="text" name="name" id="name" placeholder="성명 입력">
						<span id="namecheck_msg"></span>
					</li>
					
					<li>
						<c:choose>
							<c:when test="${grade == 'user'}">
								<label>별명 <span class="ess">*</span></label>
							</c:when>
							<c:otherwise>
								<label>병원명 <span class="ess">*</span></label>
							</c:otherwise>
						</c:choose>
						<input type="text" name="nickname" id="nickname" placeholder="2~16자리 문자 또는 숫자">
						<span id="nickcheck_msg"></span>
					</li>	
					<li>
						<label>연락처 <span class="ess">*</span></label>
						<input type="text" name = "phone" id = "phone" oninput="autoHyphen(this)" maxlength="13" placeholder="연락처를 입력하세요">
						<!-- <select name="phone1" id="phone1">
							<option value="default">선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="017">017</option>
						</select>
						<input type="text" name="phone2" id="phone2" placeholder="1234" class="input-short2">
						<input type="text" name="phone3" id="phone3" placeholder="5678" class="input-short2"> -->
					</li>
					<span id="phonecheck_msg"></span>
					
					<c:if test="${grade == 'user'}">
						<li>
							<label>생년월일</label>
							<input type="date" name = "birth" id="birth" max="2023-06-20" min="1950-06-05">
						</li>
						<li>
							<label>주소</label>
							<input type="text" name="addr" id="addr" placeholder="주소 입력" class="input-short">
							<button type="button" class="btn-short" id="btnSearchAddr">주소찾기</button>
						</li>
					</c:if>
					
					<li>
						<button type="button" id="btnPstep" class="btn-submit pstep">이전 단계</button>
						<button type="submit" id="btnJoin" class="btn-submit nstep" disabled>회원가입</button>
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