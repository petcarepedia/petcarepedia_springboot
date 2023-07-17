<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 관리자 공지 관리</title>
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/kang_admin.css">
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/am-pagination.css">
<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/petcarepedia/js/am-pagination.js"></script>
<script>
	$(document).ready(function(){
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: '${maxSize}',	    		// max page size
		    totals: '${totals}',	// total pages	
		    page: '${page}',		// initial page		
		    pageSize: '${pageSize}',			// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/petcarepedia/admin_notice.do?page="+e.page);         
	    });
		
 	});
</script> 
</head>
<body>
	<!-- header -->
	<jsp:include page="../admin_header.jsp"></jsp:include>
	
	<div class="d1">
		<section class="notice">
			<section id = "section1">
					<div>
						<nav>
							<ul>
								<li>공지사항 관리</li>
								<li><a href = "admin_hospital_list.do">병원 관리</a></li>
								<li><a href = "admin_member_list.do">회원 관리</a></li>
								<li><a href = "admin_reserve_list.do">예약 관리</a></li>
								<li><a href = "admin_review_list.do">신고 리뷰 관리</a></li>
								<li><a href = "admin_notice.do">공지사항 관리</a></li>
							</ul>
						</nav>
					</div>
				</section>
		<section id="section2">
			<div class="d2">
				<button class="button1"><img src="http://localhost:9000/petcarepedia/images/foot_sky.png" hidden></button>
			</div>
			
				<table class="table" id=ad_nt_list>
					<tr>
						<td colspan="5" >
							<button type="button" class="button"><a href="admin_notice_write.do">등록</a></button>
						</td>
					</tr>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일자</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="list" items="${list }">
						<tr>
							<td>${list.rno }</td>
							<td><a href="admin_notice_content.do?nid=${list.nid }">${list.title }</a></td>
							<td>${list.ndate }</td>
							<td>${list.nhits }</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5"><div id="ampaginationsm"></div></td>
					</tr>
				</table>
			</section>
		</section>
	</div>
	<!-- footer -->
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>