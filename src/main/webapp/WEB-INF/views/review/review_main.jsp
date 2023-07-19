<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 리뷰사전</title>
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/kang_style.css">
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/petcarepedia_song.css">
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/am-pagination.css">
<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jsp_jquery_kang.js"></script>
<script src="http://localhost:9000/petcarepedia/js/kang_review.js"></script>
<script src="http://localhost:9000/petcarepedia/js/am-pagination.js"></script>
<script>
	$(document).ready(function(){
		var gloc = '${page.gloc}';
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
           $(location).attr('href', "http://localhost:9000/petcarepedia/review_main/"+e.page+"/");
   		 });
 	});
</script> 
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
		<div id="brbox" class="review">
			<jsp:include page="/best_review_list"></jsp:include>
		</div>
		<section id="filter">	
		<div id="filter_page" class="review">
			<p>상세검색</p>
			<form name="ReviewSearchForm" action="review_main_search" method="get">
				<table id="filter_lo" class="filter">
					<tr>
						<th rowspan='3'>지역구분</th>
						<td><input type="checkbox" name="filter_location" checked="checked"> 서울전체</td>
						<td><input type="checkbox" name="filter_location" value="강남구"> 강남구</td>
						<td><input type="checkbox" name="filter_location" value="강동구"> 강동구</td>
						<td><input type="checkbox" name="filter_location" value="강북구"> 강북구</td>
						<td><input type="checkbox" name="filter_location" value="강서구"> 강서구</td>
						<td><input type="checkbox" name="filter_location" value="관악구"> 관악구</td>
						<td><input type="checkbox" name="filter_location" value="광진구"> 광진구</td>
						<td><input type="checkbox" name="filter_location" value="구로구"> 구로구</td>
						<td><input type="checkbox" name="filter_location" value="금천구"> 금천구</td>
						<td><input type="checkbox" name="filter_location" value="노원구"> 노원구</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="filter_location" value="도봉구"> 도봉구</td>
						<td><input type="checkbox" name="filter_location" value="동대문구"> 동대문구</td>
						<td><input type="checkbox" name="filter_location" value="동작구"> 동작구</td>
						<td><input type="checkbox" name="filter_location" value="마포구"> 마포구</td>
						<td><input type="checkbox" name="filter_location" value="서대문구"> 서대문구</td>
						<td><input type="checkbox" name="filter_location" value="서초구"> 서초구</td>
						<td><input type="checkbox" name="filter_location" value="성동구"> 성동구</td>
						<td><input type="checkbox" name="filter_location" value="성북구"> 성북구</td>
						<td><input type="checkbox" name="filter_location" value="송파구"> 송파구</td>
						<td><input type="checkbox" name="filter_location" value="양천구"> 양천구</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="filter_location" value="영등포구"> 영등포구</td>
						<td><input type="checkbox" name="filter_location" value="용산구"> 용산구</td>
						<td><input type="checkbox" name="filter_location" value="은평구"> 은평구</td>
						<td><input type="checkbox" name="filter_location" value="종로구"> 종로구</td>
						<td><input type="checkbox" name="filter_location" value="중구"> 중구</td>
						<td><input type="checkbox" name="filter_location" value="중랑구"> 중랑구</td>
						<td> </td>
						<td> </td>
						<td> </td>
						<td> </td>
					</tr>
				</table>
			</form>
		</div>
		</section>
		<section id="review">
		<div id="review" class="review">
			<div id="title">
				<span>리뷰</span>
				<c:choose>
					<c:when test="${sessionScope.svo.mid == null}">
						<span><a href="/login">리뷰쓰기 ></a></span>
					</c:when>
					<c:otherwise>
						<span><a href="/mypage_reservation2">리뷰쓰기 ></a></span>
					</c:otherwise>
				</c:choose>
			</div>
			<ul>
				<c:forEach var="list" items="${list }">
					<li class="review_list">
						<ul>
							<li id="list_left" class="list">
								<p><img src="http://localhost:9000/petcarepedia/images/cat.png"><span>${list.nickname }</span></p>
								<div id="star">
									<div id="avg">
										⭐ ${list.rstar } / 5.0
									</div>
								</div>
							</li>
								<li id="list_middle" class="list">
									<a href="/review_content/${list.rid }/${page.reqPage}/">
										<div id="review_hname">${list.hname }</div>
										<div class="rvc">
											${list.rcontent }
										</div>
									</a>
								</li>
							<li id="list_right" class="list">
								<div>
									도움이 되었어요
									<span>
										<!-- ♥️ -->
										<img src="https://cdn-icons-png.flaticon.com/512/803/803087.png" alt="찜하기" style="height:14px; display: inline-block; vertical-align: -2px;"> 
									</span>
									${list.rlike }
								</div>
								<table>
									<tr>
										<td>작성일자</td>
										<td>${list.rdate }</td>
									</tr>
								</table>
							</li>
						</ul>
					</li>
				</c:forEach>
				<li><div id="ampaginationsm"></div></li>
			</ul>
		</div>
		</section>
	<!-- </form> -->
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>