<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 내가 쓴 리뷰</title>
<link rel="stylesheet" href="http://localhost:9000/css/mypage.css">
<link rel="stylesheet" href="http://localhost:9000/css/petcarepedia_song.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/petcarepedia_jquery_yeol.js"></script>
<link rel="stylesheet" href="http://localhost:9000/css/am-pagination.css">
<script src="http://localhost:9000/js/am-pagination.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>
<script>
	$(document).ready(function(){
		var mid = "${sessionScope.svo.mid}";
		var page = "${page}";
		
		var pager = jQuery('#ampaginationsm').pagination({

			maxSize: '${page.pageCount}',	    		// max page size
			totals: '${page.dbCount}',	// total pages
			page: '${page.reqPage}',		// initial page
			pageSize: '${page.pageSize}',			// max number items per page
			
			    // custom labels		
			    lastText: '&raquo;&raquo;', 		
			    firstText: '&laquo;&laquo;',		
			    prevText: '&laquo;',		
			    nextText: '&raquo;',
					     
			    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
				   $(location).attr('href', "http://localhost:9000/mypage_my_review/"+e.page + "/");
	    });
		
 	});
</script> 
</head>
<body>
	 <jsp:include page="../header.jsp"></jsp:include>
	<div id = "content2">
		<section id = "my_review">
			<h1 id = "title">내가 쓴 리뷰</h1>
			<hr>
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
						<c:when test = "${list.size() == 0}">
							<div class="review_card_no">
								<img id="review_img"
									src="http://localhost:9000/images/review.png">
								<span>작성된 리뷰가 존재하지 않습니다.</span>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach var = "review" items = "${list}">
								<div id = "aside1">
									<a href = "http://localhost:9000/search_result/${review.hid}">
										<span>${review.hname}</span>
									</a>
									<span>${review.tel}</span>
									<span>
										<span>${review.gloc}</span>
									</span>
									<img src = "http://localhost:9000/images/cat.png">
									<span>${review.nickname}</span>
								</div>
								<div id = "aside2">
									<c:choose>
										<c:when test="${review.rsfile1 != null || review.rsfile2 != null }">
											<a href="http://localhost:9000/upload/${review.rsfile1}" data-title="사진" data-lightbox="example-set"><img src="http://localhost:9000/upload/${review.rsfile1 }" alt=""></a>
											<a style="display:none;" href="http://localhost:9000/upload/${review.rsfile2}" data-title="사진" data-lightbox="example-set"><img src="http://localhost:9000/upload/${review.rsfile2 }" alt=""></a>
										</c:when>
										<c:otherwise>
											<img src = "http://localhost:9000/images/${review.hsfile}">
										</c:otherwise>
									</c:choose>
								</div>
								<div id = "aside3">
									<span>리뷰 내용</span>
									<span> ${review.rcontent}</span>
									<span><!-- 진료 일자 : 2023-04-26 --></span>
								</div>
								<div id = "aside4">
									<a href = "mypage_review_content/${review.rid}">
										<button type = "button" id = "btnReview_content">상세보기</button>
									</a>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<c:if test = "${list.size() != 0}">
					<div id="ampaginationsm" style = "margin-left : 250px;"></div>
					</c:if>
				</section>
			</div>
		</section>
	</div>	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>