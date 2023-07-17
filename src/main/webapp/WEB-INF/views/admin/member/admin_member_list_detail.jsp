
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/admin1.css">
	<link rel="stylesheet" href="http://localhost:9000/mycgv_jsp/css/am-pagination.css">
	<script src="http://localhost:9000/pecarepedia/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/petcarepedia/js/mycgv_jsp_jquery.js"></script>
	<script src="http://localhost:9000/petcarepedia/js/am-pagination.js"></script>
	<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
	<title>펫캐어피디아 | 관리자</title>
</head>
<body>
<!-- header -->
	<iframe width="100%" height="100px" frameborder=0></iframe>
	<div class="d1">
		<section class="member_detail">
			<section id = "section1">
				<div>
					<nav>
						<ul>
							<li>회원관리</li>
							<li><a href = "http://localhost:9000/petcarepedia/admin_hospital_list.do">병원 관리</a></li>
							<li><a href = "http://localhost:9000/petcarepedia/admin_member/member_list.do">회원 관리</a></li>
							<li><a href = "http://localhost:9000/petcarepedia/admin_reserve/reserve_list.do">예약 관리</a></li>
							<li><a href = "http://localhost:9000/petcarepedia/admin_review/review_list.do">신고 리뷰 관리</a></li>
							<li><a href = "http://localhost:9000/petcarepedia/admin_admin_notice/admin_notice.do">공지 사항 관리</a></li>
						</ul>
					</nav>
				</div>
			</section>
			<section id="section2">
				<div class="d2">
					<input type="text" class="search_bar" placeholder="회원 아이디 입력">
					<button class="button1"><img src="http://localhost:9000/animal/css/foot_sky.png"></button>
				</div>
				<div class="d3">
					<button type="button" class="button"><a href="#">수정</a></button>
					<button type="button" class="button">삭제</button>
				<!-- 	<table class="table">
						<tr>
							<td colspan="5">
							</td>
						</tr>
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>성명</th>
							<th>이메일</th>
							<th>전화번호</th>
						</tr>
						<tr>
							<td>1</td>
							<td><a href="#">hong1234</a></td>
							<td>홍길동</td>
							<td>hong@gmail.com</td>
							<td>010-1234-5678</td>
						</tr>
						<tr>
							<td colspan ="5">
								<br>
							</td>
						</tr>
						<tr>
							<td colspan="5">
							</td>
						</tr>
					</table> -->
					<button type="button" class="button4"><a href="http://localhost:9000/petcarepedia/admin_member_list.jsp">이전으로</a></button>
				</div>
			</section>
		</section>
	</div>
<!-- footer -->
	<iframe  width="100%" height="350px" frameborder=0></iframe>
</body>
</html>