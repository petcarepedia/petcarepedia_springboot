<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 리뷰수정</title>
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/mypage.css">
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/petcarepedia_song.css">
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/kang_review_write.css">
<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jquery_yeol.js"></script>
<script src="http://localhost:9000/petcarepedia/js/kang_review_write.js"></script>
<script>
	window.onload = function(){
		var ele = document.getElementsByName('rstar');
		var count = ${reviewVo.rstar};
		for(var i = 0; i < count; i++) {
			ele[4-i].checked = true;
		}
	}
</script>

</head>
<body>
		<!-- header -->
	 <jsp:include page="../header.jsp"></jsp:include>
	<div id = "content">
		<section id = "review_revise">
			<h1 id = "title">리뷰수정</h1>
			<hr>
			<form name="updateForm" action="review_update_proc.do" method="post" enctype="multipart/form-data">
			<input type = "hidden" name = "rid" value = "${reviewVo.rid}">
				<section id = "section1">
					<div>
						<nav>
							<ul>
							<li>마이페이지</li>
							<li><a href = "mypage_member_information.do">회원 정보</a></li>
							<li><a href = "mypage_reservation.do">예약 내역</a></li>
							<li><a href = "mypage_my_review.do">내가 쓴 리뷰</a></li>
							<li><a href = "mypage_bookmark.do">즐겨찾기</a></li>
							<li><a href = "mypage_signout.do">회원 탈퇴</a></li>
							</ul>
						</nav>
					</div>
				</section>
				<div id = "aside">
					<section>
						<img src = "http://localhost:9000/petcarepedia/images/cat.png">
						<span>${reviewVo.nickname}</span>
						<span>의사의 진료는 어떠셨나요?</span>
						<span>별점을 다시 선택해주세요</span>
						<div id = "star">
							<fieldset>
								<input type="radio" name="rstar" value="5" id="rate1"><label class="slabel"
									for="rate1">★</label>
								<input type="radio" name="rstar" value="4" id="rate2"><label class="slabel"
									for="rate2">★</label>
								<input type="radio" name="rstar" value="3" id="rate3"><label class="slabel"
									for="rate3">★</label>
								<input type="radio" name="rstar" value="2" id="rate4"><label class="slabel"
									for="rate4">★</label>
								<input type="radio" name="rstar" value="1" id="rate5"><label class="slabel"
									for="rate5">★</label>
							</fieldset>
						</div>
					</section>
					<textarea name="rcontent" id = "rcontent" placeholder="진료에 대한 경험을 진솔하게 작성해주세요(30~50자내)" maxlength = "200">${reviewVo.rcontent}</textarea>
					<div id="test_cnt">(0 / 200)</div>
					<c:choose>
						<c:when test="${reviewVo.rfile1 != null}">
							<div class="filebox">
								<label class="fblabel" for="file1">업로드</label>
								<input class="upload-name" value="${reviewVo.rfile1 }" id="file1name" disabled="disabled">
								<input type="file" name="files" id="file1" class="upload-hidden">
								<input type="hidden" name="rfile1" value="${reviewVo.rfile1} ">
								<input type="hidden" name="rsfile1" value="${reviewVo.rsfile1} ">
							</div>
						</c:when>
						<c:otherwise>
							<div class="filebox">
								<label class="fblabel" for="file1">업로드</label>
								<input class="upload-name" value="파일 없음" disabled="disabled">
								<input type="file" name="files" id="file1" class="upload-hidden"> 
							</div>
						</c:otherwise>							
					</c:choose>
					<c:choose>
						<c:when test="${reviewVo.rfile2 != null}">
							<div class="filebox">
								<label class="fblabel" for="file2">업로드</label>
								<input class="upload-name" value="${reviewVo.rfile2 }" id="file2name" disabled="disabled">
								<input type="file" name="files" id="file2" class="upload-hidden">
								<input type="hidden" name="rfile2" value="${reviewVo.rfile2} ">
								<input type="hidden" name="rsfile2" value="${reviewVo.rsfile2} ">
							</div>
						</c:when>
						<c:otherwise>
							<div class="filebox">
								<label class="fblabel" for="file2">업로드</label>
								<input class="upload-name" value="파일 없음" disabled="disabled">
								<input type="file" name="files" id="file2" class="upload-hidden"> 
							</div>
						</c:otherwise>							
					</c:choose>
					<a href = "mypage_review_content.do?rid=${reviewVo.rid} ">
						<button type = "button" id = "cancle">취소</button>
					</a>
					<button type = "button" id = "btnReviewUpdate">수정완료</button>
				</div>
			</form>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>