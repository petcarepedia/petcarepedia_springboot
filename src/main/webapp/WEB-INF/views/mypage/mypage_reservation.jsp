<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 예약내역</title>
</head>
<link rel="stylesheet" href="http://localhost:9000/css/mypage.css">
<link rel="stylesheet" href="http://localhost:9000/css/petcarepedia_song.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/petcarepedia_jquery_song.js"></script>
<script src="http://localhost:9000/js/petcarepedia_jquery_yeol.js"></script>
<body>
	<!-- header -->
	 <jsp:include page="../header.jsp"></jsp:include>
	<div id = "content2">
		<section id = "reservation">
			<div id = "btn_box">
				<h1 id = "title">예약 내역</h1>
				<div id = "btn_reservation">
					<a href = "/mypage_reservation">
						<button type = "button" id = "btn1">예약중</button>
					</a>
					<a href = "/mypage_reservation2">
						<button type = "button" id = "btn2">진료 완료</button>
					</a>
				</div>
				<hr>
			</div>
			<section id = "section1">
				<div>
					<nav>
						<ul>
							<li>마이페이지</li>
							<li><a href = "/mypage_member_information">회원 정보</a></li>
							<li><a href = "/mypage_reservation">예약 내역</a></li>
							<li><a href = "/mypage_my_review">내가 쓴 리뷰</a></li>
							<li><a href = "/mypage_bookmark">즐겨찾기</a></li>
							<li><a href = "/mypage_signout">회원 탈퇴</a></li>
						</ul>
					</nav>
				</div>
			</section>
			<div id = "aside">
				<section id = "section2">
					<c:choose>
						<c:when test = "${list.size() == 0 && list2.size() == 0}">
							<div class="review_card_no">
								<img id="review_img"
									src="http://localhost:9000/images/review.png">
								<span>예약 내역이 존재하지 않습니다.</span>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach var = "booking" items = "${list}">
								<div id = "aside1">
									<img src = "http://localhost:9000/upload/${booking.hsfile}">
									<div>
										<span>서울시 > ${booking.gloc}</span>
										<a href = "http://localhost:9000/search_result.do?hid=${booking.hid}"><span>${booking.hname}</span></a>
										<span></span>
										<img src = "http://localhost:9000/images/위치.png">
										<span>${booking.loc}</span>
										<c:if test = "${booking.hrink ne 'X'}">
											<img src = "http://localhost:9000/images/홈.png">
											<a href = "${booking.hrink}">병원 홈페이지 가기</a>
										</c:if>
										<div class = "box">
											<img src = "http://localhost:9000/images/전화.png">
											<span>${booking.tel}</span>
											<span>예약 날짜 : ${booking.vdate}</span>
											<span>예약 시간 : ${booking.vtime}</span>
										</div>
									</div>
								</div>
								<a href = "mypage_reservation_delete/${booking.bid}">
								<button type = "button" id = "btn_cancle1">예약취소</button></a>
							</c:forEach>
							<c:forEach var = "booking" items = "${list2}">
								<div id = "aside1">
									<img src = "http://localhost:9000/upload/${booking.hsfile}">
									<div>
										<span>서울시 > ${booking.gloc}</span>
										<a href = "http://localhost:9000/search_result.do?hid=${booking.hid}"><span>${booking.hname}</span></a>
										<span></span>
										<img src = "http://localhost:9000/images/위치.png">
										<span>${booking.loc}</span>
										<c:if test = "${booking.hrink ne 'X'}">
											<img src = "http://localhost:9000/images/홈.png">
											<a href = "${booking.hrink}">병원 홈페이지 가기</a>
										</c:if>
										<div class = "box">
											<img src = "http://localhost:9000/images/전화.png">
											<span>${booking.tel}</span>
											<span>예약 날짜 : ${booking.vdate}</span>
											<span>예약 시간 : ${booking.vtime}</span>
										</div>
									</div>
								</div>
								<a href = "mypage_reservation_delete/${booking.bid}">
								<button type = "button" id = "btn_cancle1">예약취소</button></a>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</section>
			</div>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>