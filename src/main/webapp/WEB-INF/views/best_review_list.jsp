<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>우리 동네 동물병원 리뷰 사전, 펫캐어피디아</title>
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/petcarepedia_song.css">
<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jquery_song.js"></script>
<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jquery_song_bestreview.js"></script>
</head>
<body>
	<div class="main-review">
		<div class="sub">
			<p>신뢰도 검증! <span>사용자 추천 리뷰</span></p>
			<a href="http://localhost:9000/petcarepedia/review_main.do">더 많은 리뷰 보러가기 ></a>
		</div>
		<div class="slide">
			<c:choose>
				<c:when test="${totals==0}">
					<div class="review_card_no">
						<img id="review_img" src="http://localhost:9000/petcarepedia/images/review.png">
						<p>등록된 리뷰가 아직 없습니다.</p>
					</div>
				</c:when>
				<c:otherwise>
					<div class="btnPrev">
						<button type="button" id="btnPrev"><img src="http://localhost:9000/petcarepedia/images/prev.png" width="30" height="30"></button>
					</div>
					<div class="review-list">
						<input type="hidden" value="${rpage}" id="rpage">
						<input type="hidden" value="${maxSize}" id="maxSize">
						<c:forEach var="reviewVo" items="${list}">
							<div id="brcontent" onclick="location.href='http://localhost:9000/petcarepedia/review_content.do?rid=${reviewVo.rid}'" class="review-card">
									<div>
										<a>${reviewVo.hname}</a>
										<p>⭐ ${reviewVo.rstar}</p>
									</div>
									<div>
										<div>${reviewVo.gloc}</div>
									</div>
									<div>
										${reviewVo.rcontent}
									</div>
									<div>
										<p><img src="https://cdn-icons-png.flaticon.com/512/803/803087.png" alt="찜하기" style="height:14px; display: inline-block; vertical-align: -2px;"> ${reviewVo.rlike}</p>
										<p>${reviewVo.rdate}</p>
									</div>
								
							</div>
						</c:forEach>
					</div>
					<div class="btnNext">
						<button type="button" id="btnNext"><img src="http://localhost:9000/petcarepedia/images/next.png" width="30" height="30"></button>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>
