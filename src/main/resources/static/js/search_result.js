$(document).ready(function(){
	var mid = $("input[name='loginId']").val(); // 로그인 확인


	/** 북마크 버튼 **/
	$("#bookmark").click(function(event) { // 북마크
		event.preventDefault(); // 페이지 바로넘어감 방지
		
		var hid = $("input[name='hid']").val();
		
		 if(mid == "") { // 미로그인시
			 Swal.fire({
				 icon: 'warning',
				 title: '로그인 확인',
				 text: '로그인을 먼저 해주세요.',
				 showConfirmButton: true, // 확인 버튼 표시
				 confirmButtonColor:'#98dfff',
				 confirmButtonText: '확인'
			 });
		 } else { // 로그인시
			$.ajax({
				url: "bookmarkProc.do",
				type: "POST",
				data: {
					hid: hid,
					mid: mid
				},
				success: function(bookmark_result) {
					if (bookmark_result === "fail") { // 이미 북마크 함	
						Swal.fire({
							icon: 'error',
							title: '즐겨찾기 해제',
							text: '즐겨찾기에서 해제했습니다.',
							showConfirmButton: true, // 확인 버튼 표시
							confirmButtonColor:'#98dfff',
							confirmButtonText: '확인'
						}).then(function() {
							location.reload(); // 확인 버튼 클릭 시 페이지 새로고침
						});
					} else if (bookmark_result === "success") { // 북마크 처리
						Swal.fire({
							icon: 'success',
							title: '즐겨찾기 추가',
							text: '즐겨찾기에 추가했습니다.',
							showConfirmButton: true, // 확인 버튼 표시
							confirmButtonColor:'#98dfff',
							confirmButtonText: '확인'
						}).then(function() {
							location.reload(); // 확인 버튼 클릭 시 페이지 새로고침
						});
					}
				}
			});
		 }
	});
	
	
	/** 예약  버튼 **/
	$("#reservation").click(function() { // 예약 버튼
		if(mid == "") { // 미로그인시
			 Swal.fire({
				 icon: 'warning',
				 title: '로그인 확인',
				 text: '로그인을 먼저 해주세요.',
				 showConfirmButton: true, // 확인 버튼 표시
				 confirmButtonColor:'#98dfff',
				 confirmButtonText: '확인'
			 });
		 } else { // 로그인시
			//var hid = $(this).val();
			//var iframeSrc = "search_reservation.do?hid=" + hid;
			var modal = $("#hmodal");
			//var iframe = $("#reservation-iframe");
			//iframe.attr("src", iframeSrc);
			modal.css("display", "block");
			$(".scrdiv *").css("display", "none");
			$(".cchat-btn *").css("display", "none");
			$(".spword-box *").css("display", "none");
			$(".spword-box").css("border", "none");
			$(".spword-box").css("box-shadow", "none");
		}
	});
	
	
	/* 모달 닫기 */
	$(".close").click(function() {
		$("#hmodal").css("display", "");
		$(".scrdiv *").css("display", "");
		$(".cchat-btn *").css("display", "");
		$(".spword-box *").css("display", "");
		$(".spword-box").css("border", "");
		$(".spword-box").css("box-shadow", "");
	});


	/** 좋아요 버튼 **/
	var scrollPositions = {}; // 버튼의 위치 정보를 저장할 객체
	
	$('.non').click(function(e) {
		e.preventDefault();
		
		var button = $(this);
		var rid = button.data('rid');
		
		/* 스크롤 위치 저장 */
		scrollPositions[rid] = $(window).scrollTop();
		
		if (button.hasClass('non')) {
			Swal.fire({
				icon: 'warning',
				title: '로그인 확인',
				text: '로그인을 먼저 해주세요.',
				showConfirmButton: true, // 확인 버튼 표시
				confirmButtonColor: '#98dfff',
				confirmButtonText: '확인'
			});
		}
	});
	
	$('.like').click(function(e) {
		e.preventDefault();
		
		var button = $(this);
		var rid = button.data('rid');
		
		/* 좋아요 처리 Ajax 호출 */
		if (mid == "") { // 미로그인시
			Swal.fire({
				icon: 'warning',
				title: '로그인 확인',
				text: '로그인을 먼저 해주세요.',
				showConfirmButton: true, // 확인 버튼 표시
				confirmButtonColor: '#98dfff',
				confirmButtonText: '확인'
			});
		} else { // 로그인시
			$.ajax({
				url: 'likeProc.do',
				method: 'POST',
				data: {
					hid: $('input[name="hid"]').val(),
					rid: rid,
					mid: mid
				},
				success: function(like_result) {
					if (like_result === "success") { // 좋아요 처리
						var count = parseInt(button.find('.like-count').text());
						count++;
						button.find('.like-count').text(count);
					} else { // 좋아요 취소
						var count = parseInt(button.find('.like-count').text());
						count--;
						button.find('.like-count').text(count);
					}
					
					/* 스크롤 위치 복원 */
					$('html, body').scrollTop(scrollPositions[rid]);
				}
			});
		}
	});
	
	
	/** 신고하기 버튼 **/
	$(".rstate").click(function() { // 신고하기
	  var button = $(this);
	  var rid = button.data('rid');
	  var hid = $("input[name='hid']").val();
	  var mid = $("input[name='mid']").val();
	
	  if (mid == "") { // 미로그인시
	    Swal.fire({
	      icon: 'warning',
	      title: '로그인 확인',
	      text: '로그인을 먼저 해주세요.',
	      showConfirmButton: true, // 확인 버튼 표시
	      confirmButtonColor: '#98dfff',
	      confirmButtonText: '확인'
	    });
	
	  } else { // 로그인시
	    Swal.fire({
	      icon: 'warning',
	      title: '신고 사유를 선택해주세요',
	      html: '<input type="radio" class="reson" name="rreson" value="개인정보유출" /> <span class="reson">개인정보유출<span> ' +
	        '<input type="radio" class="reson" name="rreson" value="광고/홍보글" /> <span class="reson">광고/홍보글<span> <br> ' +
	        '<input type="radio" class="reson" name="rreson" value="욕설/비방" /> <span class="reson">욕설/비방<span> ' +
	        '<input type="radio" class="reson" name="rreson" value="음란/선정성" /> <span class="reson">음란/선정성<span> ' +
	        '<input type="radio" class="reson" name="rreson" value="기타" /> <span class="reson">기타<span>',
	      showCancelButton: true,
	      confirmButtonColor: '#FFB3BD',
	      cancelButtonColor: '#98DFFF',
	      confirmButtonText: '신고',
	      cancelButtonText: '취소',
	    }).then((result) => {
	      if (result.isConfirmed) {
	        var rreson = $("input[name='rreson']:checked").val(); // 선택된 라디오 버튼의 값을 가져옴
	        if (rreson == null) {
	          Swal.fire({
	            icon: 'error',
	            title: '신고사유를 선택해주세요',
	            showConfirmButton: true,
	            confirmButtonText: '확인',
	            confirmButtonColor: '#98dfff'
	          }).then(() => {
	            $(".rstate").click(); // 신고 사유 재선택 창 다시 띄우기
	          });
	        } else {
	          $.ajax({
	            url: "rstateProc.do",
	            type: "POST",
	            data: {
	              mid: mid,
	              rid: rid,
	              hid: hid,
	              rreson: rreson
	            },
	            success: function(result) {
	              if (result === "fail") {
	                Swal.fire({
	                  icon: 'error',
	                  title: '이미 신고하셨습니다',
	                  text: '관리자 확인중 입니다. 잠시만 기다려 주세요.',
	                  showConfirmButton: true,
	                  confirmButtonText: '확인',
	                  confirmButtonColor: '#98dfff'
	                }).then(function() {
	                  location.reload();
	                });
	              } else if (result === "success") {
	                Swal.fire({
	                  icon: 'success',
	                  title: '신고되었습니다',
	                  text: '관리자 확인 중입니다.',
	                  showConfirmButton: true,
	                  confirmButtonText: '확인',
	                  confirmButtonColor: '#98dfff'
	                }).then(function() {
	                  location.reload();
	                });
	              }
	            }
	          });
	        }
	      }
	    });
	  }
	});


	
	/** 네비게이션 **/
	$("#info_s").click(function() {
		var offsetTop = $(".api_info").offset().top - 100;
		$('html, body').animate({
			scrollTop: offsetTop
		}, 500);
	});
	
	$("#review_s").click(function() {
		var offsetTop2 = $(".review").offset().top - 100;
		$('html, body').animate({
			scrollTop: offsetTop2
		}, 500);
	});
	
	
	/** 하트효과 **/
	$(function() {
		$('.check').click(function() {
			$(this).toggleClass('active');
			
			if ($(this).hasClass('active')) {
				$(this).find('img').attr({
					'src': 'https://cdn-icons-png.flaticon.com/512/803/803087.png',
					alt: '찜하기 완료'
				});
			} else {
				$(this).find('img').attr({
					'src': 'https://cdn-icons-png.flaticon.com/512/812/812327.png',
					alt: '찜하기'
				});
			}
		});
	});
	
	
	/** 정렬 스크롤 **/
    if ($("#filterCheck").val() != "") {
	  offsetTop = $(".list").offset().top - 100;
	  $('html, body').animate({
	    scrollTop: offsetTop
	  }, 500);
	}
	
	
	/** 공유 링크 클릭시 **/
	$("#share").click(function() {
	    if ($("#shareLink").css('display') === 'none') {
	        $("#shareLink").css('display', 'inline-block');
	    } else {
	        $("#shareLink").css('display', 'none');
	    }
	});
	
	
	
	/** 공유하기 - 카카오 **/
	$("#kakaoShare").click(function() {
		Kakao.Link.sendDefault({
			objectType: 'feed',
	    	content: {
	      		title: '팻케어피디아',
	     		description: $('.name').text(),
	      		imageUrl: 
	      			'https://cdn-icons-png.flaticon.com/512/2358/2358595.png',
	     		link: {
	       			webUrl: 'http://localhost:9000/petcarepedia/index.do',
	      		},
    		},
			buttons: [
	      		{
		        title: '사이트 이동',
		        link: {
		          webUrl: 'http://localhost:9000/petcarepedia/search_result.do?hid=' + $("input[name='hid']").val(),
		        },
	      },
	    ],
	  });
	});
	
	
	/** 공유하기 - 링크 복사 **/
	//현재 url 변수로 가져오기
	let nowUrl = window.location.href;
	
	$("#linkCopy").click(function() {
		window.navigator.clipboard.writeText(nowUrl).then(() => {
		  	Swal.fire({
				icon: 'success',
				title: '링크가 복사되었습니다',
				showConfirmButton: true,
				confirmButtonText: '확인',
				confirmButtonColor:'#98dfff'
			});
		});
	});

			 	 	
	 
	
	
	




});