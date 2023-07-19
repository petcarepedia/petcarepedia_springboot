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
		var hname = "${hname}";
		var gloc = "${gloc}";
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
			   if(hname!=null && hname!="" ){
				   $(location).attr('href', "http://localhost:9000/admin_hospital_list/"+e.page+"/"+hname+"/");
			   }else if(gloc!=null && gloc!=""){
				   $(location).attr('href', "http://localhost:9000/admin_hospital_list/"+e.page+"/"+gloc+"/");
			   }else {
				   $(location).attr('href', "http://localhost:9000/admin_hospital_list/"+e.page+"/");
			   }
	                    
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
							<li><a href = "http://localhost:9000/admin_hospital_list/1/">병원 관리</a></li>
							<li><a href = "http://localhost:9000/admin_member_list/1/">회원 관리</a></li>
							<li><a href = "http://localhost:9000/admin_reserve_list/1/">예약 관리</a></li>
							<li><a href = "http://localhost:9000/admin_review_list/1/">신고 리뷰 관리</a></li>
							<li><a href = "http://localhost:9000/admin_notice/1/">공지 사항 관리</a></li>
						</ul>
					</nav>
				</div>
			</section>
			<section id="section2">
				<div id="d5">
					<select id="search" name="search">
						<option value="hname" selected>병원명</option>
						<option value="gloc" >지역구</option>
					</select>
				</div>
					<div class="d2" id = "d6" >
						<input type="text"  class="search_bar" id ="search_hname" placeholder="병원명 입력" value="${hname}" >
						<button type="submit" class="button1" id="btn_hname" >
							<img src="http://localhost:9000/petcarepedia/images/foot_sky.png">
						</button>
					</div>
					<div class="d2" id = "d7" style="display:none;">
						<input type="text"  class="search_bar" id ="search_gloc" placeholder="지역구 입력" value="${gloc}" >
						<button type="submit" class="button1" id="btn_gloc" >
							<img src="http://localhost:9000/petcarepedia/images/foot_sky.png">
						</button>
					</div>
					<div></div>
				<table class="table">
					<tr>
						<td colspan="5" >
							<a href="http://localhost:9000/admin_hospital_write">
								<button type="button" class="button4">등록하기</button>
							</a>
						</td>
					</tr>
					<!-- <tr>
						<td colspan="5" >
							<select>
								<option name="table" id="new"> 최신 순</option>
								<option name="table"  id="old"> 오래된 순</option>		
							</select>
						</td>
					</tr> -->
					<tr>
						<th>번호</th>
						<th>병원명</th>
						<th>기타 동물 여부</th>
						<th>야간 진료 여부</th>
						<th>공휴일 진료 여부</th>
					</tr>
					<c:forEach var="hospital" items="${list}">
					<tr>
						<td>${hospital.rno}</td>
						<td><a href="admin_hospital_content/${hospital.hid}/${page.reqPage}/">${hospital.hname}</a></td>
						<td>${hospital.animal}</td>
						<td>${hospital.ntime}</td>
						<td>${hospital.holiday}</td>
						
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