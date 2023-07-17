<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class="join-content">
			<div class="content-logo">
				<img src="http://localhost:9000/petcarepedia/images/contentlogo.png" width="300px">
			</div>
			
			<form name="joinForm" action="join_proc.do" method="post">
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
						<label>별명 <span class="ess">*</span></label>
						<input type="text" name="nickname" id="nickname" placeholder="2~16자리 문자 또는 숫자">
						<span id="nickcheck_msg"></span>
					</li>
					<li>
						<label>휴대폰 <span class="ess">*</span></label>
						<select name="phone1" id="phone1">
							<option value="default">선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="017">017</option>
						</select>
						<input type="text" name="phone2" id="phone2" placeholder="1234" class="input-short2">
						<input type="text" name="phone3" id="phone3" placeholder="5678" class="input-short2">
					</li>
					<span id="phonecheck_msg"></span>
					
					<li>
						<label>생년월일</label>
						<input type="text" name="birth1" id="birth1" placeholder="년(4자리)" class="input-short2">
						<input type="text" name="birth2" id="birth2" placeholder="월" class="input-short2">
						<input type="text" name="birth3" id="birth3" placeholder="일" class="input-short2">
					</li>
					<li>
						<label>이메일 <span class="ess">*</span></label>
						<input type="text" name="email" id="email" placeholder="이메일 입력" class="input-short">
						<button type="button" class="btn-short" id="btnAuthEmail" disabled>인증번호 전송</button>
						<span id="emailcheck_msg"></span>
						
						<input type="hidden" id="data">
						
						<input type="text" name="cemail" id="cemail" placeholder="인증번호 입력" class="input-short" style="display:none">
						<button type="button" class="btn-short" id="btnCheckEmail" style="display:none">인증번호 확인</button>
						<span id="emailauthcheck_msg"></span>
					</li>
					<li>
						<label>주소</label>
						<input type="text" name="addr" id="addr" placeholder="주소 입력" class="input-short">
						<button type="button" class="btn-short" id="btnSearchAddr">주소찾기</button>
					</li>
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
						<button type="submit" id="btnJoin" class="btn-submit" disabled>회원가입</button>
					</li>
				</ul>
			</form>
		</div>
	</div>
	
	<!-- footer -->
	<%-- <jsp:include page="../footer.jsp"></jsp:include> --%>
</body>
</html>