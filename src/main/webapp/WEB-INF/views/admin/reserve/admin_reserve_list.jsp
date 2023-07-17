<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/admin1.css">
	<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/am-pagination.css">
	<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jquery_serin.js"></script>
	<script src="http://localhost:9000/petcarepedia/js/am-pagination.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
	<title>펫캐어피디아 | 관리자</title>
	<script>
	$(document).ready(function(){
		var mid = "${mid}";
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
			   if(mid!=null && mid!=""){
				   $(location).attr('href', "http://localhost:9000/petcarepedia/admin_reserve_list.do?page="+e.page+"&mid="+mid);
			   } else {
				   $(location).attr('href', "http://localhost:9000/petcarepedia/admin_reserve_list.do?page="+e.page);
			   }
	                    
	    });
		
 	});
	</script> 
</head>
<body>
<!-- header -->
	<jsp:include page="../admin_header.jsp"></jsp:include>
	<div class="d1">
		<section class="reserve">	
			<section id = "section1">
				<div>
					<nav>
						<ul>
							<li>예약관리</li>
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
				<div class="d2" id = "d2">
					<input type="text"  class="search_bar" id ="reserve_bar"placeholder="회원아이디 입력">
					<button type="submit" class="button1" id="reserve_btn">
						<img src="http://localhost:9000/petcarepedia/images/foot_sky.png">
					</button>
				</div>
				<table class="table">
					<tr>
						<th>번호</th>
						<th>병원명</th>
						<th>아이디</th>
						<th>예약일</th>
						<th>상태</th>
					</tr>
					<c:forEach var="bookingVo" items="${list}">
						<tr>
					      <td>${bookingVo.rno}</td>
					      <td>${bookingVo.hname}</td>
					      <td>${bookingVo.mid}</td>
					      <td class="date">${bookingVo.vdate}</td>
					      <td class="state">${bookingVo.bstate}</td>
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