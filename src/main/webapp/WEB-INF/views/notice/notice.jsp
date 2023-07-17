<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 공지사항</title>
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/kang_style.css">
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
	           $(location).attr('href', "http://localhost:9000/petcarepedia/notice.do?page="+e.page);         
	    });
		
 	});
</script> 
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	<!-- content -->
	<div class="content">
		<section class="notice">
			<div id=title_l>
				<h1 class="title">공지사항</h1>
			</div>
			<table class="notice">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성일자</th>
					<th>조회수</th>
				</tr>
				<c:forEach var="list" items="${list }">
					<tr>
						<td>${list.rno }</td>
						<td><a href="notice_content.do?nid=${list.nid }">${list.title }</a></td>
						<td>${list.ndate }</td>
						<td>${list.nhits }</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5"><div id="ampaginationsm"></div></td>
				</tr>
			</table>
		</section>
	</div>
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>