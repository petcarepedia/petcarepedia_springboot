<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 내가 쓴 리뷰</title>
<link rel="stylesheet" href="http://localhost:9000/css/mypage.css">
<link rel="stylesheet" href="http://localhost:9000/css/petcarepedia_song.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/petcarepedia_jquery_song.js"></script>
<script src="http://localhost:9000/js/petcarepedia_jquery_yeol.js"></script>
</head>
<body>
	<!-- header -->
	<!-- <iframe src="http://localhost:9000/mycgv_jsp/header.jsp"
			scrolling="no" width="100%" height="149px" frameborder=0></iframe> -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- content -->
	<div id = "content2">
		<section id = "reservation">
			<h1 id = "title">내가 쓴 리뷰</h1>
			<hr>
			<form name="deleteForm" action="my_review_delete" method="post">
			<input type = "hidden" name = "rid" value = "${review.rid}">
			<input type = "hidden" name = "rsfile1" value = "${review.rsfile1}">
			<input type = "hidden" name = "rsfile2" value = "${review.rsfile2}">
				<table id = "table">
					<tr>
						<th>병원명</th>
						<td>${review.hname}</td>
					</tr>
					<tr>
						<th>리뷰내용</th>
						<td>${review.rcontent}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${review.nickname}</td>
					</tr>
				</table>
				<div class = "box">
					<p>정말로 삭제하시겠습니까?</p>
					<button type="button" class="btn_style" id = "btnReviewDelete">삭제완료</button>
					<a href="mypage_review_content/${review.rid}">
						<button type="button" class="btn_style">취소</button>
					</a>
				</div>
			</form>
		</section>
	</div>
	
	<!-- footer -->
	<!-- <iframe src="http://localhost:9000/mycgv_jsp/footer.jsp"
			scrolling="no" width="100%" height="500px" frameborder=0></iframe> -->	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>

















