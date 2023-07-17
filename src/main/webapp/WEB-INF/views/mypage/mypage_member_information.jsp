<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 나의 회원정보</title>
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/mypage.css">
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/petcarepedia_song.css">
<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jquery_yeol.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
</script>
<script>
	function readURL(input) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('profile').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	    
	}
</script>
</head>
<body>
<div id="pageOverlay" class="page-overlay"></div>
	<div id="emailModal" class="modal">
	  <div class="modal-content">
	    <h2 class = "title">이메일 인증</h2>
	    <p><span>*</span>이메일 인증 후 확인버튼을 눌러주세요</p>
	    <input type = "text" placeholder = "변경하실 이메일을 입력해주세요!" name = "email" id = "confirm_email" class = "email">
		<button type="button" class="btn-short" id="btnAuthEmail">인증번호 전송</button>
	    <span id="emailcheck_msg"></span>
		
		<input type="hidden" id="data">
		
		<input type="text" name="cemail" id="cemail" placeholder="인증번호 입력" class="input-short" style = "display:none">
		<button type="button" class="btn-short" id="btnCheckEmail" style = "display:none">인증번호 확인</button>
		<span id="emailauthcheck_msg"></span>
		<button type = "button" class = "btnModalClose" id = "btnConfirm" disabled>확인</button>
		<button type = "button" class = "btnModalClose" id = "btnModalClose">닫기</button>
	  </div>
	</div>

	<!-- header -->
	 <jsp:include page="../header.jsp"></jsp:include>
	<div id = "content">
		<section id = "information">
			<h1 id = "title">나의 회원정보</h1>
			<hr>
			<section id = "section1">
				<div>
					<nav>
						<ul>
							<li>마이페이지</li>
							<li><a href = "mypage_member_information.do">회원 정보</a></li>
							<li><a href = "mypage_reservation.do">예약 내역</a></li>
							<li><a href = "mypage_my_review.do">내가 쓴 리뷰</a></li>
							<li><a href = "mypage_bookmark.do">즐겨찾기</a></li>
							<li><a href = "mypage_signout.do">회원 탈퇴</a></li>
						</ul>
					</nav>
				</div>
			</section>
			<div id = "aside">
				<form name="updateForm" id = "updateForm" action="member_update_proc.do" method="post" enctype = "multipart/form-data">
					<section id = "section2">
						<div id = "update_info">
							<label>프로필</label>
						</div>
						<div id = "profileBoxOut">
					 	<input type = "hidden" name = "mfile" value = "${memberVo.mfile}">
						<input type = "hidden" id = "msfile" name = "msfile" value = "${memberVo.msfile}">
						<input type = "hidden" name = "grade" value = "${memberVo.grade}">
						<input type="file" name="file1" id = "file1" onchange = "readURL(this)" accept="image/*">
							<div id = profileBox>
								<img src = "http://localhost:9000/petcarepedia/upload/${memberVo.msfile}" id = "profile">
								<button type = "button"><img src = "http://localhost:9000/petcarepedia/images/수정.png" id = "update_profile"></button>
							</div>
							<br>
							<label id = "lb_id">${sessionScope.svo.mid}</label>
							<br>
							<label id = "lb_name">${memberVo.name}</label>
						</div>
						<div id = "update_info">
							<label>선택정보</label>
						</div>
							<ul>
								 <%-- <li>
									<label>아이디</label>
									<input type = "hidden" value = "${sessionScope.svo.mid}" name = "mid" disabled>
									<button><img src = "http://localhost:9000/petcarepedia/images/수정.png"></button>
								</li>
								<li>
									<label>성명</label>
									<input type = "text" value = "${memberVo.name}" name = "name" disabled>
									<button><img src = "http://localhost:9000/petcarepedia/images/수정.png"></button>
								</li>  --%>
								<li>
									<label>별명</label>
									<input type = "text" value = "${memberVo.nickname}" name = "nickname"  id = "nickname" disabled>
									<button type = "button" id = "update_nickname"><img id = "img1" src = "http://localhost:9000/petcarepedia/images/편집2.png"></button>
									<span id="nickcheck_msg"></span>
								</li>
								<li>
									<label>생년월일</label>
								 	<input type="date" name = "birth"
								         id="birth"
								         max="2023-06-20"
								         min="1950-06-05"
								         value="${memberVo.birth}" disabled> 
									 <button type = "button" id = "update_birth"><img id = "img2" src = "http://localhost:9000/petcarepedia/images/편집2.png"></button> 
								</li>
								<li>
									<label>이메일</label>
									<input type = "text" value = "${memberVo.email}" name = "email" id = "email" disabled>
									<button type = "button" id = "update_email"><img id = "img3" src = "http://localhost:9000/petcarepedia/images/편집2.png"></button>
									<!-- <span id="emailcheck_msg"></span>
									
									<button type="button" class="btn-short" id="btnAuthEmail" style = "display:none" disabled>인증번호 전송</button>
									<span id="emailcheck_msg"></span>
									
									<input type="hidden" id="data">
									
									<input type="text" name="cemail" id="cemail" placeholder="인증번호 입력" class="input-short" style = "display:none">
									<button type="button" class="btn-short" id="btnCheckEmail" style = "display:none">인증번호 확인</button>
									<span id="emailauthcheck_msg"></span> -->
								</li>
								<li>
									<label>휴대폰</label>
									<input type="text" value = "${memberVo.phone}" name = "phone" id = "phone" oninput="autoHyphen(this)" maxlength="13" placeholder="전화번호를 입력해보세요!" disabled>
									<button type = "button" id = "update_phone"><img id = "img4" src = "http://localhost:9000/petcarepedia/images/편집2.png"></button>
								</li>
								<li>
									<label>주소</label>
									<input type = "text" value = "${memberVo.addr}" name = "addr" id = "address" disabled>
									<button type = "button" id = "update_addr"><img id = "img5" src = "http://localhost:9000/petcarepedia/images/편집2.png"></button>
								</li>
							</ul>
					</section>
					<section id = "section3">
						<!-- <a href = "mypage_member_revise.do"> -->
							<button type = "button" id = "btn_style1">수정완료</button>
						<!-- </a> -->
					</section>
					<input type = "hidden" name = "mid" value = "${sessionScope.svo.mid}">
					<input type = "hidden" name = "name" value = "${memberVo.name}">
				</form>
			</div>
		</section>
	</div>
	<div class="back"></div>
	<div class="term-box">
		<div class="term-modal">
			<div class="title">
				이메일 인증
			</div>
		</div>
	</div>
	<%-- <jsp:include page="../footer.jsp"></jsp:include> --%>
</body>
</html>