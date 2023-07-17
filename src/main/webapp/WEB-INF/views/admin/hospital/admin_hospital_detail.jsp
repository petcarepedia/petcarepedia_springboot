<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/admin1.css">
	<link rel="stylesheet" href="http://localhost:9000/mycgv_jsp/css/am-pagination.css">
	<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jquery_serin.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=7reerlqgi2&submodules=geocoder"></script>
	<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
	<title>펫캐어피디아 | 관리자</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="../admin_header.jsp"></jsp:include>
	
	<!-- content -->
	<div class="d1">
		<section id="hospital_data">
				<section id = "section1">
					<div id="d2">
						<nav>
							<ul>
								<li>병원관리</li>
								<li><a href = "http://localhost:9000/petcarepedia/admin_hospital_list.do">병원 관리</a></li>
								<li><a href = "http://localhost:9000/petcarepedia/admin_member_list.do">회원 관리</a></li>
								<li><a href = "http://localhost:9000/petcarepedia/admin_reserve_list.do">예약 관리</a></li>
								<li><a href = "http://localhost:9000/petcarepedia/admin_review_list.do">신고 리뷰 관리</a></li>
								<li><a href = "http://localhost:9000/petcarepedia/admin_notice.do">공지 사항 관리</a></li>
							</ul>
						</nav>
					</div>
				</section>
				<section id="section2">
					<div id="d3">
						<form name="writeForm" action="hospital_detail_proc.do" method="post" enctype="multipart/form-data">
							<table class="table">
								<tr>
									<th>병원명</th>
									<td><input type="text" name="hname" id = "hname"></td>
								</tr>
								<tr>
									<th>주소</th>
									<td>
										<input type="text" name="loc" id="loc">
										<input type="text" name="x" id="x" placeholder="위도">
										<input type="text" name="y" id="y" placeholder="경도">
										<button type="button" class="button4" id="search_loc">주소 찾기</button>
									</td>
								</tr>
								<tr>
									<th>지역 구</th>
									<td><input type="text" name="gloc" id="gloc"></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><input type="text" name="tel" id="tel"> </td>
								</tr>
								<tr>
									<th>영업시간</th>
									<td>
										<input type="text" name="htime" id="htime" placeholder="영업시간 : 00:00 ~ 00:00 ">
									</td>
								</tr>
								<tr>
									<th>특수동물 진료 여부</th>
									<td><input type="text" name="animal" id="animal" placeholder="O / X "> </td>
								</tr>
								<tr>
									<th>야간 근무 여부</th>
									<td><input type="text" name="ntime" id="ntime" placeholder="O / X "> </td>
								</tr>
								<tr>
									<th>공휴일 진료 여부</th>
									<td><input type="text" name="holiday" id="holiday" placeholder="O / X "> </td>
								</tr>
								<tr>
									<th>홈페이지 링크</th>
									<td><input type="text" name="hrink" id="hrink" placeholder="O / X "> </td>
								</tr>
								<tr>
									<th>강조사항(선택)</th>
									<td><textarea name="intro" id="intro"></textarea></td>
								</tr>
								<tr>
									<th>파일 업로드</th>
									<td >
										<input type="file" name="file1" id="file1">
									</td>
								</tr>
								<tr>
									<td colspan="5"> 
										<button type="button" class="button5" id="btn_save">저장하기</button>
										<button type="reset" class="button5">다시쓰기</button>
										<a href="http://localhost:9000/petcarepedia/admin_hospital_list.do">
											<button type="button" class="button5"> 이전으로</button>
										</a>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</section>
		</section>
	</div>
	<div></div>
	<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>