<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/admin1.css">
	<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/kang_style.css">
	<script src="http://localhost:9000/pecarepedia/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jsp_jquery_kang.js"></script>
		<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
	<title>펫캐어피디아 | 관리자</title>
</head>
<body>
<!-- header -->
	<jsp:include page="../admin_header.jsp"></jsp:include>
	<div class="d1">
			<div class="content">
			<section class="review_content">
				<section id = "section1">
					<div>
						<nav>
							<ul>
								<li>신고리뷰관리</li>
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
					<button type="submit" class="button4" id="btn_delete">
						<a href="http://localhost:9000/petcarepedia/admin_review_delete2.do?rid=${reviewVo.rid}">삭제하기</a>
					</button>
					<div class="review_detail">
						<div id = "table" >
							<table class="rv_detail_menu">
								<tr>
									<th>병원이름</th>
									<td>
										${reviewVo.hname }
									</td>
									
								</tr>
								<tr>
									<th>작성자</th>
									<td><img src="http://localhost:9000/petcarepedia/images/cat.png"><p>${reviewVo.nickname }</p></td>
								</tr>
								<tr>
									<th>상세내용</th>
									<td colspan='3'>
										${reviewVo.rcontent }
									</td>
								</tr>
							</table>
						</div>
						<div class="table_right">
							<div id="right_top">
								<c:choose>
									<c:when test="${reviewVo.mid eq mid || mid eq '' || mid eq null}">
										<button type="button" id="btnLike" disabled>
											<span class="review_like">
												♥️
											</span>
											${reviewVo.rlike }
										</button>
									</c:when>
									<c:otherwise>
										<form name="reviewLikeForm" action="review_like_Proc.do" method="post">
											<input type="hidden" id="rid" name="rid" value="${reviewLikeVo.rid }">
											<input type="hidden" id="mid" name="mid" value="${mid }">
											<input type="hidden" id="page" name="page" value="${page }">
											<input type="hidden" id="filter_location" name="filter_location" value="${filter_location }">
										</form>							
									</c:otherwise>
								</c:choose>
							</div>
							<div id="star">
								<div class="score" id="score_l">
									평점
								</div>
								<div id="avg" class="score">
									⭐ ${reviewVo.rstar } / 5.0
								</div>
							</div>
							<table>
								<tr>
									<td>작성일자</td>
									<td>${reviewVo.rdate }</td>
								</tr>
							</table>
						</div>
					</div>
				</section>
			</section>
		</div>
	</div>
<!-- footer -->
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>