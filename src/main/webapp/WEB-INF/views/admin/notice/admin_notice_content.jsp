<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 관리자 공지사항</title>
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/kang_style.css">
<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jsp_jquery_kang.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.10/dist/sweetalert2.all.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.10/dist/sweetalert2.min.css" rel="stylesheet">
</head>
<body>
	<!-- header -->
	<jsp:include page="../admin_header.jsp"></jsp:include>
	<div class="content">
		<section class="notice">
			<div id="title_l">
				<h1 class="title">공지사항 상세보기</h1>
			</div>
			<table class="notice_content">
				<tr>
					<td>${nvo.title }</td>
				</tr>
				<tr>
					<td>
						${nvo.ncontent }
					</td>
				</tr>
			</table>
			<div id="date">${nvo.ndate }</div>
			<div class="nc_button_r">
				<a href="admin_notice_update/${nvo.nid }/"><button type="button" class="ad_button">수정</button></a>
					<form name="deleteForm" action="admin_notice_delete" method="post">
						<input type="hidden" name="nid" value="${nvo.nid }">
						<input type="hidden" name="page" value="${page }">
						<button type="button" class="ad_button" id="noticeDelBtn">삭제</button>
					</form>
				<a href="/admin_notice/${page}/"><button type="button" class="ad_button">목록</button></a>
			</div>
		</section>
	</div>
	<!-- footer -->
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>