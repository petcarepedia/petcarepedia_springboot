<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
	<title>펫캐어피디아 | 검색 결과</title>
	<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/search_main.css">
	
	<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/petcarepedia/js/search_main.js"></script>
	<script src="http://localhost:9000/petcarepedia/js/search_main_map.js"></script>
	<script>
	/* 검색바 */
	$(document).ready(function(){
		let shname = "${shname}";
		let output = "<p style='margin-top:15px; font-size:14px; display:inline-block'><strong>'${shname}'</strong> 검색 결과 <strong>${size}</strong>건</p>";
		output += "<a href='http://localhost:9000/petcarepedia/search_main.do' style='margin-left:10px; ";
		output += "font-size:12px; color:lightgray;'>병원목록 새로고침</a>";
		if(shname!=""){
			$("h1.title").after(output);
		}
	});
	</script>
</head>

<body>
	<!-- header -->
	<div class="header-wrapper">
		<jsp:include page="../header.jsp"></jsp:include>	
	</div>
	
	<!-- content -->
	<div class="search_main">
	
		<!-- 필터 -->
		<section class="filter">
		<h1 class="title">동물병원</h1>
		
			<!-- 지역 필터 -->
			<div class="area">
				<div class="text_area">
					<span>지역구분</span>
				</div>
						
				<div class="check_area">
					<ul>	
						<li><input type="checkbox" class="gloc" name="gloc" value="*" checked="checked"><span>서울 전체</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="강남구" data-filter="강남구"><span>강남구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="강동구" data-filter="강동구"><span>강동구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="강북구" data-filter="강북구"><span>강북구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="강서구" data-filter="강서구"><span>강서구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="관악구" data-filter="관악구"><span>관악구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="광진구" data-filter="광진구"><span>광진구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="구로구" data-filter="구로구"><span>구로구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="금천구" data-filter="금천구"><span>금천구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="노원구" data-filter="노원구"><span>노원구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="도봉구" data-filter="도봉구"><span>도봉구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="동대문구" data-filter="동대문구"><span>동대문구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="동작구" data-filter="동작구"><span>동작구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="마포구" data-filter="마포구"><span>마포구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="서대문구" data-filter="서대문구"><span>서대문구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="서초구" data-filter="서초구"><span>서초구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="성동구" data-filter="성동구"><span>성동구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="성북구" data-filter="성북구"><span>성북구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="송파구" data-filter="송파구"><span>송파구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="양천구" data-filter="양천구"><span>양천구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="영등포구" data-filter="영등포구"><span>영등포구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="용산구" data-filter="용산구"><span>용산구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="은평구" data-filter="은평구"><span>은평구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="종로구" data-filter="종로구"><span>종로구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="중구" data-filter="중구"><span>중구</span></li>
						<li><input type="checkbox" class="gloc" name="gloc" value="중랑구" data-filter="중랑구"><span>중랑구</span></li>
					</ul>
				</div>
			</div>
			
			<!-- 시간 필터 -->
			<div class="time">
				<div class="text_time">
					<span>진료시간</span>
				</div>
			
				<div class="check_time">
					<ul>
						<li><input type="checkbox" name="time" id="time" value="time"><span>진료중</span></li>
						<li><input type="checkbox" name="time" id="holiday" value="휴O"><span>휴일진료</span></li>
						<li><input type="checkbox" name="time" id="ntime" value="야O"><span>야간진료</span></li>
					</ul>
				</div>
			</div>
			
			<!-- 특수동물 필터 -->
			<div class="animal">
				<div class="text_animal">
					<span>특수 동물</span>
				</div>
				
				<div class="check_animal">
					<ul>
						<li><input type="checkbox" name="animal" id="animal" value="동O"><span>취급</span></li>
					</ul>
				</div>
			</div>
		</section>

	<div class="s2">
	<!-- 검색리스트 -->
		<section class="list">
			<div class="hlist">
				
				<!-- 병원 리스트 -->
				<c:forEach var="list" items="${list}">
					<ul id="dataList">
						<li data-filter="${list.gloc} * 휴${list.holiday} time 야${list.ntime} 동${list.animal}">
					
							<div class="list1">
								<!-- 병원 정보 -->
								<div class="hinfo">
									<span>${list.hname}</span>
									<span>${list.tel}</span>
									<span id="rstar" name="rstar" class="rstar">⭐ ${list.rstar}</span>
									<input type="hidden" id="hid" name="hid" value="${list.hid}">
									<input type="hidden" id="startTime" name="startTime" value="${list.starttime}">
									<input type="hidden" id="endTime" name="endTime" value="${list.endtime}">
									<input type="hidden" id="holiday" name="holiday" value="휴일: ${list.holiday}" data-filter="${list.holiday}">
									<input type="hidden" id="ntime" name="ntime" value="야간: ${list.ntime}" data-filter="${list.ntime}">
								
									<span id="harea" value="${list.gloc}">${list.gloc}</span>
									<span id="htime">진료 중</span>
									<a href="http://localhost:9000/petcarepedia/search_result.do?hid=${list.hid}">
										<button type="button" class="hservation" id="${list.hid}">
											병원 상세보기&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp>
										</button>
									</a>
								</div>
								
								<!-- 병원 이미지 -->
								<div class="himg">
									<c:choose>
									    <c:when test="${list.hsfile != null}">	
									        <%-- <img src="${list.img}" width="122px" height="122px"> --%>
									        <img src="http://localhost:9000/petcarepedia/upload/${list.hsfile}" width="122px" height="122px">
									    </c:when>
									    <c:otherwise>
									    </c:otherwise>
									</c:choose>						
								</div>
							</div>
						</li>
					</ul>
				</c:forEach>
			</div>
		</section>
		
		<!-- 지도API -->
		<section class="api">
			<div class="hapi">
				<jsp:include page="search_main_map.jsp"></jsp:include>	
			</div>
		</section>
		
		</div>
	</div> 
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>	
</body>
</html>