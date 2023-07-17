<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/admin1.css">
	<link rel="stylesheet" href="http://localhost:9000/mycgv_jsp/css/am-pagination.css">
	<script src="http://localhost:9000/pecarepedia/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/petcarepedia/js/mycgv_jsp_jquery.js"></script>
	<script src="http://localhost:9000/petcarepedia/js/am-pagination.js"></script>
		<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
	<title>펫캐어피디아 | 관리자</title>
<script>
	$(document).ready(function(){
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: '${maxSize}',	// max page size
		    totals:  '${totals}',	// total pages	
		    page: 	 '${page}',		// initial page		
		    pageSize:'${pageSize}',	// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText:'&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/mycgv_jsp/board_list_json.do?page="+e.page);         
	    });
		
 	});
</script>
</head>
<body>
<!-- header -->
	<jsp:include page="../admin_header.jsp"></jsp:include>
	
	<div class="d1">
		<section class="hospital">
			<section id = "section1">
				<div>
					<nav>
						<ul>
							<li>병원관리</li>
							<li><a href = "http://localhost:9000/petcarepedia/admin_hospital_list.do">병원 관리</a></li>
							<li><a href = "http://localhost:9000/petcarepedia/admin_member/member_list.do">회원 관리</a></li>
							<li><a href = "http://localhost:9000/petcarepedia/admin_reserve/reserve_list.do">예약 관리</a></li>
							<li><a href = "http://localhost:9000/petcarepedia/admin_review/review_list.do">신고 리뷰 관리</a></li>
							<li><a href = "http://localhost:9000/petcarepedia/admin_admin_notice/admin_notice.do">공지 사항 관리</a></li>
						</ul>
					</nav>
				</div>
			</section>
		<form name="hopitalForm" action="hospital_list_data.do" method="post">
		<section id="section2">
			<div class="d2">
				<input type="text" class="search_bar" placeholder="병원명 입력">
				<button type="button" class="button1">
					<a href="http://localhost:9000/petcarepedia/admin_hospital_list_detail.do">
						<img src="http://localhost:9000/petcarepedia/images/foot_sky.png">
					</a>
				</button>
			</div>
			<script>
				$(document).ready(function(){
					var pager = jQuery('#ampaginationsm').pagination({
					
					    maxSize: '${maxSize}',	// max page size
					    totals:  '${totals}',	// total pages	
					    page: 	 '${page}',		// initial page		
					    pageSize:'${pageSize}',	// max number items per page
					
					    // custom labels		
					    lastText: '&raquo;&raquo;', 		
					    firstText:'&laquo;&laquo;',		
					    prevText: '&laquo;',		
					    nextText: '&raquo;',
							     
					    btnSize:'sm'	// 'sm'  or 'lg'		
					});
					
					jQuery('#ampaginationsm').on('am.pagination.change',function(e){
						   jQuery('.showlabelsm').text('The selected page no: '+e.page);
				           $(location).attr('href', "http://localhost:9000/mycgv_jsp/board_list_json.do?page="+e.page);         
				    });
					
			 	});
			</script>
			</section>
		</form>
		</section>
	</div>
	<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>