<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 즐겨찾기</title>
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/mypage.css">
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/petcarepedia_song.css">
<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jquery_yeol.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
function bookmark(bmid) {
	Swal.fire({
        title: '즐겨찾기를 해제하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#FFB3BD',
    	cancelButtonColor: '#98DFFF',
        confirmButtonText: '승인',
        cancelButtonText: '취소'
	}).then((result) => {
        if (result.isConfirmed) {
        	Swal.fire({
  			  icon: 'success',                         
  			  text: '해제가 완료되었습니다.',  
  			  confirmButtonColor:'#98dfff',
  			  confirmButtonText:'확인'
  			}).then(() => {
                location.href = "bookmark_delete_proc.do?bmid=" + bmid;
            });
        }
    });
}

</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<div id = "content2">
		<section id = "bookmark">
			<h1 id = "title">즐겨찾기</h1>
			<hr>
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
			<section id = "section2">
				<c:choose>
					<c:when test = "${list.size() == 0}">
						<div class="review_card_no">
							<img id="review_img"
								src="http://localhost:9000/petcarepedia/images/review.png">
							<span>즐겨찾기 내역이 존재하지 않습니다.</span>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var = "bookmarkVo" items = "${list}">
								<%-- <input type = "hidden" name = "bmid" id = "bmid" value = "${bookmarkVo.bmid}"> --%>
								<div id = "aside1">
									<span>${bookmarkVo.hname}</span>
									<span>${bookmarkVo.gloc}</span>
									<a href = "http://localhost:9000/petcarepedia/search_result.do?hid=${bookmarkVo.hid}">병원 상세보기 ></a>
									<button type = "button" id = "btnBookmarkDelete" onclick = "bookmark('${bookmarkVo.bmid}')">
										<img src = "http://localhost:9000/petcarepedia/images/bookmark_yellow.png">
									</button>
			<%-- 						<a href = "bookmark_delete.do?bmid=${bookmarkVo.bmid}">
										<img src = "http://localhost:9000/petcarepedia/images/bookmark2.png">
									</a> --%>
								</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</section>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>