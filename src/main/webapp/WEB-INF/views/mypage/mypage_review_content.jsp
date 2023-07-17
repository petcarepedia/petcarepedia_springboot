<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 리뷰 상세보기</title>
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/kang_style.css">
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/mypage.css">
<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jquery_yeol.js"></script>
<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jsp_jquery_kang.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="content">
		<section class="review_content">
			<div id="title_l">
				<h1 class="title">리뷰상세</h1>
			</div>
			<div class="review_detail">
				<table class="rv_detail_menu">
					<tr>
						<th>병원이름</th>
						<td>
							${reviewVo.hname}
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<img src="http://localhost:9000/petcarepedia/images/cat.png">
							<span>${reviewVo.nickname}</span>
						</td>
					</tr>
					<tr>
						<th>상세내용</th>
						<td colspan='3'>
							${reviewVo.rcontent }
						</td>
					</tr>
				</table>
				<div class="table_right">
					<div id="right_top">
					</div>
				<div id="star">
					<div class="score" id="score_l">
						평점
					</div>
					<div id="avg" class="score">
						⭐ ${reviewVo.rstar} / 5.0
					</div>
				</div>
				<div id="imgArea">
						<c:if test="${reviewVo.rsfile1 != null && reviewVo.rsfile1 != ''}">
							<a href="http://localhost:9000/petcarepedia/upload/${reviewVo.rsfile1 }" data-title="사진" data-lightbox="example-set"><img src="http://localhost:9000/petcarepedia/upload/${reviewVo.rsfile1 }" alt=""></a>
						</c:if>
						<c:if test="${reviewVo.rsfile2 != null && reviewVo.rsfile2 != ''}">
							<a href="http://localhost:9000/petcarepedia/upload/${reviewVo.rsfile2 }" data-title="사진" data-lightbox="example-set"><img src="http://localhost:9000/petcarepedia/upload/${reviewVo.rsfile2 }" alt=""></a>
						</c:if>
					</div>
				<table class = "rdate" id = "rdate">
					<tr>
						<td>작성일자</td>
						<td>${reviewVo.rdate }</td>
					</tr>
				</table>
				<div class="rc_button_r" id = "rc_button_r">
					<a href = "mypage_review_revise.do?rid=${reviewVo.rid}">
						<button type = "button" id = "btnReview_revise">수정하기</button>
					</a>
					<a href = "mypage_review_delete.do?rid=${reviewVo.rid}">
						<button type = "button" id = "btnReview_delete">삭제하기</button>
					</a>
					<a href = "mypage_my_review.do">
						<button type = "button" id = "cancle">리뷰목록</button>
					</a>
				</div>
				</div>
			</div>
		</section>
	</div>
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>