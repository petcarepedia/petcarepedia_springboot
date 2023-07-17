<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 수정하기</title>
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/mypage.css">
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/petcarepedia_song.css">
<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jquery_yeol.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
	$(document).ready(function(){
		let phone1 = "${memberVo.phone1}";
		$("#phone1").val(phone1).prop("selected", true);
	});
	
</script>
</head>
<body>
	<!-- header -->
	 <jsp:include page="../header.jsp"></jsp:include>
			
	<div id = "content">
		<section id = "revise">
			<h1 id = "title">수정하기</h1>
			<hr>
			<form name="updateForm" action="member_update_proc.do" method="post">
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
					<section id = "section2">
					<p><span class="ess">*</span> 표시는 필수 입력 항목입니다.</p>
						<ul>
							<li>
								<label ><span>*</span>아이디</label>
								<label>${sessionScope.svo.mid}</label>
							</li>
							<li>
								<label><span>*</span>성명</label>
								<label>${memberVo.name}</label>
							</li>
							<li>
								<label><span>*</span>별명</label>
								<input type = "text" name = "nickname" id = "nickname" placeholder = "  변경하실  별명을 입력해주세요" value = "${memberVo.nickname}">
							</li>
							<li>
								<label>생년월일</label>
								<div>
									<input type = "text" name = "birth1" id = "year" placeholder = "  년(4자)" value = "${memberVo.birth1}">
									<input type = "text" name = "birth2" id = "month" placeholder = "  월" value = "${memberVo.birth2}">
									<input type = "text" name = "birth3" id = "date" placeholder = "  일" value = "${memberVo.birth3}">
								</div>
							</li>
							<li>
								<label>이메일</label>
								<input type = "text" name = "email" id = "email" placeholder = "  변경하실 이메일 주소를 입력해주세요" value = "${memberVo.email}">
							</li>
							<li>
								<label><span>*</span>휴대폰</label>
								<div id = "phone_box">
									<select name="phone1" id="phone1">
										<option value="default">선택</option>
										<option value="011">011</option>
										<option value="010">010</option>
										<option value="017">017</option>
									</select>
									-<input type = "text" name = "phone2" id = "phone2" value = "${memberVo.phone2}">
									-<input type = "text" name = "phone3" id = "phone3" value = "${memberVo.phone3}">
								</div>
							</li>
							<li>
								<label>주소</label>
								<input type = "text" name = "addr" id = "address" placeholder = "  변경하실 주소를 입력해주세요" value="${memberVo.addr}">
								<button type="button" class="btn_style2" id="btnSearchAddr">주소찾기</button>
							</li>
						</ul>
					</section>
					<ul id = "pass_revise">
						<li><a href="login_pwfind.do" target="_parent">비밀번호 재설정</a></li>
					</ul>
					<section id = "section3">
						<button type = "button" id = "btn_style1">수정완료</button>
					</section>
				</div>
				<input type = "hidden" name = "mid" id = "mid" value = "${sessionScope.svo.mid}">
			</form>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>