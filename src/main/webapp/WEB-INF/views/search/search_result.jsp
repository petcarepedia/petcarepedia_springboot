<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
	<title>펫캐어피디아 | 검색 결과</title>
	<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/search_result.css">

	<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="http://localhost:9000/petcarepedia/js/search_result.js"></script>
	<script src="http://localhost:9000/petcarepedia/js/search_result_map.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.11/clipboard.min.js"></script>
	
	<script>
		Kakao.init('8e977bf42a12bf9762111f31b4017078');
		/* console.log(Kakao.isInitialized()); */
	</script>
</head>

<body>
	<!-- header -->
	<div class="header-wrapper">
		<jsp:include page="../header.jsp"></jsp:include>
	</div>


	<!-- content -->
	<div class="result_main">
		<section class="info">
			<div class="info_d">
				<!-- 병원 사진 표시 -->
				<div class="images_d">
					<c:if test="${hospital.hsfile != null}">
						<%-- <img src="${hospital.img}"> --%>
						<img src="http://localhost:9000/petcarepedia/upload/${hospital.hsfile}">
					</c:if>
				</div>
				
				<!-- 병원 정보 표시 -->	
				<div class="name_d">
					<div class="area_d">
						<a href="http://localhost:9000/petcarepedia/search_main.do">서울</a>
						<span>></span>
						<a>${hospital.gloc}</a>
					</div>

					<span class="name">${hospital.hname}</span>
					<input type="hidden" name="loginId" value="${sessionScope.svo.mid}"> 

					<div class="buttons">
						<!-- 북마크 -->
						<form name="bookmarkForm" action="bookmarkProc.do" method="post">
							<input type="hidden" name="hid" value="${hospital.hid}">
							<input type="hidden" name="mid" value="${sessionScope.svo.mid}"> 
							<input type="hidden" name="Bookmark Result" value="${bookmarkResult}">

							<!-- 북마크 여부에 따라서 -->
							<c:choose>
								<c:when test="${bookmarkResult == 1}">
									<button type="submit" id="bookmark">
										<img
											src="http://localhost:9000/petcarepedia/images/bookmark_yellow.png">
									</button>
								</c:when>
								
								<c:otherwise>
									<button type="submit" id="bookmark">
										<img
											src="http://localhost:9000/petcarepedia/images/bookmark.png">
									</button>
								</c:otherwise>
							</c:choose>
						</form>
					</div>

					<!-- 별점 표시 -->
					<c:choose>
						<c:when test="${star.rstar>=1}">
							<span class="grade">⭐ ${star.rstar} | 리뷰 ${fn:length(RM_select)}</span>
						</c:when>

						<c:otherwise>
							<span class="grade">⭐ 0 | 리뷰 ${fn:length(RM_select)}</span>
						</c:otherwise>
					</c:choose>

					<!-- 예약하기 -->
					<button type="button" id="reservation" value="${hospital.hid}">
						<img src="http://localhost:9000/petcarepedia/images/cal.png">
							간편 예약하기 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp>
					</button>
					
					<!-- 공유하기 -->
					<button id="share">
						<img src="http://localhost:9000/petcarepedia/images/share.png" id="shareB">
					</button>
					
					<div id="shareLink">
							<button id="kakaoShare"> 
								<img src="http://localhost:9000/petcarepedia/images/kakao.png" id="kakao">
							</button>
							
							<button id="linkCopy">
								<img src="http://localhost:9000/petcarepedia/images/copy.png" id="copy">
							</button>
					</div>
					
					
					<!-- 예약화면 모달 -->
					<div id="hmodal" class="modal">
						<div class="modal-content">
							<span class="close">&times;</span>
							<jsp:include page="search_reservation.jsp"></jsp:include>
						</div>
					</div>
				</div>

				<hr>
				
				<!-- 병원 상세 정보 -->
				<div class="link">
					<span><img
						src="http://localhost:9000/petcarepedia/images/loc.png">${hospital.loc}</span>

					<c:if test="${hospital.hrink != null && hospital.hrink != 'X'}">
						<span><img src="http://localhost:9000/petcarepedia/images/home.png">
							<a href="${hospital.hrink}">병원 홈페이지 가기</a>
						</span>
					</c:if>

					<span><img src="http://localhost:9000/petcarepedia/images/call.png">${hospital.tel}</span>
				</div>

				<hr>
				
				<!-- 네이게이션바 -->
				<div class="nav">
					<span id="info_s">병원정보</span> 
					<span id="review_s">리뷰</span>
				</div>

				<hr>
				
				<!-- 병원 지도 -->
				<div class="api_info">
					<div class="api">
						<span>병원정보</span> 
						<span>위치 & 진료시간</span>
						<div class="map">
							<jsp:include page="search_result_map.jsp"></jsp:include>
						</div>

						<span class="api_home">${hospital.loc}</span>
					</div>

					<div class="time">
						<ul>
							<li>영업시간</li>
							<li>야간 진료 여부</li>
							<li>휴일 진료 여부</li>
							<li>특수동물 취급 여부</li>
							<li>소개</li>
						</ul>

						<ul>
							<li>${hospital.htime}</li>
							<li>${hospital.ntime}</li>
							<li>${hospital.holiday}</li>
							<li>${hospital.animal}</li>
							<c:if test="${! hospital.intro.equals('X')}">
								<li>${hospital.intro}</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>

			<hr>

		</section>

		<section class="review">
			<div class="list">
				<!-- 리뷰 정보 -->
				<div class="grade">
					<span>리뷰 ${fn:length(RM_select)}</span>

					<div class="total">
						<!-- 점수에 따라 -->
						<c:choose>
							<c:when test="${star.rstar>=1}">
								<span>${star.rstar} / 5</span>
							</c:when>

							<c:otherwise>
								<span>0 / 5</span>
							</c:otherwise>
						</c:choose>
						
						<!-- 별점 표시 -->
						<c:if test="${star.rstar>=1 && star.rstar<2}">
							<span> ⭐ </span>
						</c:if>

						<c:if test="${star.rstar>=2 && star.rstar<3}">
							<span> ⭐⭐ </span>
						</c:if>

						<c:if test="${star.rstar>=3 && star.rstar<4}">
							<span> ⭐⭐⭐ </span>
						</c:if>

						<c:if test="${star.rstar>=4 && star.rstar<5}">
							<span> ⭐⭐⭐⭐ </span>
						</c:if>

						<c:if test="${star.rstar>=5}">
							<span> ⭐⭐⭐⭐⭐ </span>
						</c:if>
					</div>
				</div>
				<form name="filterForm" action="/petcarepedia/search_result.do" method="GET">
					<input type="hidden" name="hid" value="${hospital.hid}">
					<input type="hidden" id="filterCheck" value="${filter}">
				    <select name="filter" id="filter" class="filter" onchange="this.form.submit()">
				    	<option value="" selected>리뷰 정렬</option>
					    <option value="basic">기본 정렬</option>
					    <option value="like">좋아요 많은 순서</option>
					    <option value="totalUp">별점 높은 순서</option>
					    <option value="totalDown">별점 낮은 순서</option>
					</select>
				</form>
				
				<!-- 리뷰 리스트 -->
				<c:choose>
					<c:when test="${fn:length(RM_select) == 0}">
						<div class="review_card_no">
							<img id="review_img" src="http://localhost:9000/petcarepedia/images/review.png">
							<p>등록된 리뷰가 아직 없습니다.</p>
						</div>
					</c:when>

					<c:otherwise>
						<c:forEach var="RM_select" items="${RM_select}">
							<div class="review_card">
								<div class="member">
									<div class="name">
										<!-- if문으로 등록된 이미지 없을 시 해당 이미지로 출력되게 하기 -->
										<img src="http://localhost:9000/petcarepedia/images/cat.png">
										<span>${RM_select.nickname}</span>
									</div>

									<hr class="member_hr">
									
									<span class="stext">⭐
									 <fmt:formatNumber type="number" pattern="0" value="${RM_select.rstar}" /> / 5
									</span>
									
									<hr class="member_hr">
									
									<c:choose>
							            <c:when test="${RM_select.rstar<1}">
							              <span class="stot">별점 </span>
							            </c:when>
							            <c:when test="${RM_select.rstar>=1 && RM_select.rstar<2}">
							              <span class="stot">별점 ⭐</span>
							            </c:when>
							            <c:when test="${RM_select.rstar>=2 && RM_select.rstar<3}">
							              <span class="stot">별점 ⭐⭐</span>
							            </c:when>
							            <c:when test="${RM_select.rstar>=3 && RM_select.rstar<4}">
							              <span class="stot">별점 ⭐⭐⭐</span>
							            </c:when>
							            <c:when test="${RM_select.rstar>=4 && RM_select.rstar<5}">
							              <span class="stot">별점 ⭐⭐⭐⭐</span>
							            </c:when>
							            <c:when test="${RM_select.rstar>=5}">
							              <span class="stot">별점 ⭐⭐⭐⭐⭐</span>
							            </c:when>
									</c:choose>
								</div>

								<div class="write">
									<p>${RM_select.rcontent}</p>
								</div>

								<div class="date">
									<span>작성 일자 : ${RM_select.rdate}</span> 
									<span> </span>
									
									<!-- 좋아요 -->
									<form name="likeForm" action="likeProc.do" method="post">
										<input type="hidden" name="hid" value="${hospital.hid}">
										<input type=hidden name="rid" value="${RM_select.rid}">
										<input type="hidden" name="mid" value="${sessionScope.svo.mid}">
										<input type="hidden" name="likeresult" value="${RM_select.likeresult}">

										<!-- session 체크 이후 -->
										<c:choose>
											<c:when test="${sessionScope.svo.mid != null}">
												<c:choose>
													<c:when test="${sessionScope.svo.mid == RM_select.mid}">
														<c:if test="${RM_select.likeresult==0}">
															<a href="javascript:;" class="icon heart">
																<button type="submit" id="like" class="like disabled check" data-rid="${RM_select.rid}" disabled>
																	좋아요&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
																	<!-- <span class="heart">♥</span>  -->
																	<img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기">
																	<span class="like-count">${RM_select.rlike}</span>
																</button>
															</a>
														</c:if>
														
														<c:if test="${RM_select.likeresult!=0}">
															<a href="javascript:;" class="icon heart">
																<button type="submit" id="like" class="like active disabled check" data-rid="${RM_select.rid}" disabled>
																	좋아요&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
																	<!-- <span class="heart">♥</span>  -->
																	<img src="https://cdn-icons-png.flaticon.com/512/803/803087.png" alt="찜하기">
																	<span class="like-count">${RM_select.rlike}</span>
																</button>
															</a>
														</c:if>
													</c:when>
														
													 <c:otherwise>
													 	<c:if test="${RM_select.likeresult==0}">
															<a href="javascript:;" class="icon heart">
																<button type="submit" id="like" class="like check" data-rid="${RM_select.rid}">
																	좋아요&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
																	<!-- <span class="heart">♥</span>  -->
																	<img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기">
																	<span class="like-count">${RM_select.rlike}</span>
																</button>
															</a>
														</c:if>
														
														<c:if test="${RM_select.likeresult!=0}">
															<a href="javascript:;" class="icon heart">
																<button type="submit" id="like" class="like active check" data-rid="${RM_select.rid}">
																	좋아요&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
																	<!-- <span class="heart">♥</span>  -->
																	<img src="https://cdn-icons-png.flaticon.com/512/803/803087.png" alt="찜하기">
																	<span class="like-count">${RM_select.rlike}</span>
																</button>
															</a>
														</c:if>
													</c:otherwise>
												</c:choose>
											</c:when>
										
											<c:otherwise>
												<a href="javascript:;" class="icon">										
													<button type="submit" id="like" class="like non" data-rid="${RM_select.rid}">								
														좋아요&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp								
														<!-- <span class="heart">♥</span>  -->								
														<img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기"> 
														<span class="like-count">${RM_select.rlike}</span>							
													</button>									
												</a>
											</c:otherwise>
										</c:choose>
									</form>
									
								<%-- <a href="javascript:;" class="icon heart">
									<button type="submit" id="like" class="like"
										data-rid="${RM_select.rid}">
										좋아요&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										<!-- <span class="heart">♥</span>  -->
										<img
											src="https://cdn-icons-png.flaticon.com/512/812/812327.png"
											alt="찜하기"> <span class="like-count">${RM_select.rlike}</span>
									</button>
								</a> --%>
								
								<!-- 신고하기 -->
								<form name="rstateForm" action="rstateProc.do" method="post">
									<c:choose>
									<c:when test="${sessionScope.svo.mid != RM_select.mid}">
										<input type="hidden" name="mid" value="${sessionScope.svo.mid}">
										<input type="hidden" name="rid" value="${RM_select.rid}">
										<input type="hidden" name="hid" value="${hospital.hid}">
										<button type="button" class="rstate" name="rstate" data-rid="${RM_select.rid}">신고하기</button>
									</c:when>
									
									<c:otherwise>
										<button type="button" class="rstate" name="rstate" hidden></button>
									</c:otherwise>
									</c:choose>
								</form>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
			</div>
		</section>
	</div>

	<!-- footer -->
	<div class="footer-wrapper">
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>