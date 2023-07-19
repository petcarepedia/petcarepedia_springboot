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
<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jsp_jquery_kang.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.10/dist/sweetalert2.all.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.10/dist/sweetalert2.min.css" rel="stylesheet">
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
							<a href="search_result.do?hid=${reviewVo.hid }">
								${reviewVo.hname }
							</a>
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
				<div class="table_right">
					<div id="right_top">
						<c:choose>
							<c:when test="${reviewVo.mid eq sessionScope.svo.mid || sessionScope.svo.mid eq '' || sessionScope.svo.mid eq null}">
								<button type="button" id="btnLike" disabled>
									<span class="review_like">
										<!-- ♥️ -->
										<img src="https://cdn-icons-png.flaticon.com/512/803/803087.png" alt="찜하기" style="height:14px; display: inline-block; vertical-align: -2px;">
									</span>
									${reviewVo.rlike }
								</button>
							</c:when>
							<c:otherwise>
								<form name="reviewLikeForm" action="review_like_Proc.do" method="post">
									<input type="hidden" id="rid" name="rid" value="${reviewVo.rid }">
									<input type="hidden" id="page" name="page" value="${page }">
									<input type="hidden" id="gloc" name="gloc" value="${page.gloc }">
									<button type="submit" id="btnLikeProc">
										<c:choose>
											<c:when test="${likeCheck eq 1 }">
												<span class="review_like">
													<!-- ♥️ -->
													<img src="https://cdn-icons-png.flaticon.com/512/803/803087.png" alt="찜하기" style="height:14px; display: inline-block; vertical-align: -2px;">
												</span>
											</c:when>
											<c:otherwise>
												<span class="review_like">
													<!-- ♡ -->
													<img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기" style="height:14px; display: inline-block; vertical-align: -2px;">
												</span>
											</c:otherwise>
										</c:choose>
										${reviewVo.rlike }
									</button>
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
					<div id="imgArea">
						<c:if test="${reviewVo.rsfile1 != null && reviewVo.rsfile1 != ''}">
							<a href="http://localhost:9000/petcarepedia/upload/${reviewVo.rsfile1 }" data-title="사진" data-lightbox="example-set"><img src="http://localhost:9000/petcarepedia/upload/${reviewVo.rsfile1 }" alt=""></a>
						</c:if>
						<c:if test="${reviewVo.rsfile2 != null && reviewVo.rsfile2 != ''}">
							<a href="http://localhost:9000/petcarepedia/upload/${reviewVo.rsfile2 }" data-title="사진" data-lightbox="example-set"><img src="http://localhost:9000/petcarepedia/upload/${reviewVo.rsfile2 }" alt=""></a>
						</c:if>
					</div>
					<table>
						<tr>
							<td>작성일자</td>
							<td>${reviewVo.rdate }</td>
						</tr>
					</table>
				</div>
				<form name="reportForm" action="review_report_proc.do" method="post">
					<c:choose>
						<c:when test="${reviewVo.mid eq sessionScope.svo.mid || sessionScope.svo.mid eq '' || sessionScope.svo.mid eq null}">
						</c:when>
						<c:otherwise>
							<button type="button" class="report" id="btnReviewReport">신고하기</button>
							<input type="hidden" name="rid" id="rid" value="${reviewVo.rid }">
						</c:otherwise>
					</c:choose>
				</form>	
			</div>
			<form name="deleteForm" action="review_delete_proc.do" method="post">
				<c:choose>
					<c:when test="${reviewVo.mid eq sessionScope.svo.mid }">
						<div class="rc_button_r">
							<a href="mypage_review_revise.do?rid=${reviewVo.rid }"><button type="button" class="button">수정</button></a>
							<button type="button" class="button" id="reviewDelBtn">삭제</button>
							<input type="hidden" name="rid" value="${reviewVo.rid }">
							<c:choose>
								<c:when test="${page eq null || page eq '' }">
									<a href="review_main.do"><button type="button" class="button">목록</button></a>
								</c:when>
								<c:when test="${filter_location eq null || filter_location eq '' }">
									<a href="review_main.do?page=${page }"><button type="button" class="button">목록</button></a>
								</c:when>
								<c:otherwise>
									<a href="review_main_search.do?page=${page }&&filter_location=${filter_location}"><button type="button" class="button">목록</button></a>
								</c:otherwise>
							</c:choose>
						</div>
					</c:when>
					<c:otherwise>
						<div class="rc_button_r">
							<c:choose>
								<c:when test="${page eq null }">
									<a href="review_main.do"><button type="button" class="button">목록</button></a>
								</c:when>
								<c:when test="${filter_location eq null }">
									<a href="review_main.do?page=${page }"><button type="button" class="button">목록</button></a>
								</c:when>
								<c:otherwise>
									<a href="review_main_search.do?page=${page }&&filter_location=${filter_location}"><button type="button" class="button">목록</button></a>
								</c:otherwise>
							</c:choose>
						</div>
					</c:otherwise>
				</c:choose>
			</form>
		</section>
	</div>
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>