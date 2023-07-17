$(document).ready(function(){
	
	jQuery.fn.center = function () {
	    this.css("position","absolute");
	    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
	    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
	    return this;
	}
	
	/**************
	 * 회원가입 - 아이디 중복 체크
	 */
	$("#btnCheckId").click(function(){
		$.ajax({
				url : "id_check.do?mid="+$("#id").val(),
				success : function(result){
					if(result == 1){
						$("#idcheck_msg").text("중복된 아이디입니다.").css("color","red")
						.css("font-size","12px").css("display","block").css("clear","both")
						.css("padding-top","5px")
						.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
						
						$("form[name='joinForm'] #id").val("").focus();
					}else if(result == 0){
						$("#idcheck_msg").text("사용 가능한 아이디입니다.").css("color","#7AB2CC")
						.css("font-size","12px").css("display","block").css("clear","both")
						.css("padding-top","5px")
						.prepend("<img src='http://localhost:9000/petcarepedia/images/check.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
						
						$("form[name='joinForm'] #pass").focus();
					}
				}
			});
	});
	
	/**************
	 * 회원가입 - 이메일 체크
	 */
	 $('#btnAuthEmail').click(function() {
		const email = $('#email').val(); // 이메일 주소값 얻어오기!
		
		$.ajax({
			type : 'get',
			url : "mail_check.do?email="+email,
			success : function (data) {
				$('#cemail').show();
				$('#btnCheckEmail').show();
				$("#data").val(data);
				$('#btnAuthEmail').text("인증번호 재전송").css("background","#FFB3BD");
				
				Swal.fire({
		            icon: 'success',                         
		            title: '인증번호가 전송되었습니다.',         
		            confirmButtonColor:'#98dfff',
		            confirmButtonText:'확인'
		        });
			}			
		}); // end ajax
	}); // end send eamil
	
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('#btnCheckEmail').click(function () {
		const inputCode = $("#cemail").val();
		const resultMsg = $('#emailauthcheck_msg');
		const code = $("#data").val();
		
		if(inputCode == code){
			Swal.fire({
	            icon: 'success',                         
	            title: '인증번호가 일치합니다.',         
	            confirmButtonColor:'#98dfff',
	            confirmButtonText:'확인'
	        });
	        
			$('#cemail').hide();
			$('#btnCheckEmail').hide();
			
			$("#emailauthcheck_msg").text("이메일 인증 완료").css("color","#7AB2CC")
			.css("font-size","12px").css("display","block").css("clear","both")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/petcarepedia/images/check.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
			
			$("#btnAuthEmail").attr("disabled",true).css("background","#D9D9D9").css("cursor","not-allowed");
			$("#email").attr('readonly',true);
		}else{
			Swal.fire({
	            icon: 'error',                         
	            title: '인증번호가 일치하지 않습니다.',         
	            confirmButtonColor:'#98dfff',
	            confirmButtonText:'확인'
	        });
	        
			$("#emailauthcheck_msg").text("").css("display","none");
		}
	});
	
	/**************
	 * 회원가입 - 유효성 체크
	 */
	let reg_id = /^(?=.*?[a-z])(?=.*?[0-9]).{4,20}$/;
	let reg_pw = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;
	let regPhone= /^\d{2,3}-?\d{3,4}-?\d{4}$/;
	let reg_nick = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;
	let reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	//아이디 정규식 체크
	$("form[name='joinForm'] #id").keyup(function(){
		if(!reg_id.test($("form[name='joinForm'] #id").val())){
			$("#idcheck_msg").text("4~20자의 영문, 숫자를 포함하여 입력하세요.").css("color","red")
			.css("font-size","12px").css("display","block").css("clear","both")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
			
			$("#btnCheckId").attr("disabled",true).css("background","#D9D9D9").css("cursor","not-allowed");
		} else {
			$("#idcheck_msg").text("").css("display","none");
			
			$("#btnCheckId").attr("disabled",false).css("background","#98dfff").css("cursor","pointer");
		}
	});
	//이메일 정규식 체크
	$("form[name='joinForm'] #email").keyup(function(){
		if(!reg_email.test($("#email").val())){
			$("#emailcheck_msg").text("올바른 이메일 형식이 아닙니다.").css("color","red")
			.css("font-size","12px").css("display","block").css("clear","both")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
			
			$("#btnAuthEmail").attr("disabled",true).css("background","#D9D9D9").css("cursor","not-allowed").text("인증번호 전송");
			$('#cemail').hide();
			$('#btnCheckEmail').hide();
			$("#emailauthcheck_msg").text("").css("display","none");
		} else {
			$.ajax({
				url : "mail_mulcheck.do?email="+$("#email").val(),
				success : function(result){
					if(result >= 1){
						$("#emailcheck_msg").text("중복된 이메일입니다.").css("color","red")
						.css("font-size","12px").css("display","block").css("clear","both")
						.css("padding-top","5px")
						.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
						
						$("#btnAuthEmail").attr("disabled",true).css("background","#D9D9D9").css("cursor","not-allowed").text("인증번호 전송");
						$('#cemail').hide();
						$('#btnCheckEmail').hide();
						$("#emailauthcheck_msg").text("").css("display","none");
					}else if(result == 0){
						$("#emailcheck_msg").text("").css("display","none");
			
						$("#btnAuthEmail").attr("disabled",false).css("background","#98dfff").css("cursor","pointer").text("인증번호 전송");
						$('#cemail').hide();
						$('#btnCheckEmail').hide();
						$("#emailauthcheck_msg").text("").css("display","none");
					}
				}
			});
		}
	});
	//비밀번호 정규식 체크
	$("#pass").keyup(function(){
		if(!reg_pw.test($("#pass").val())){
			$("#pwcheck_msg").text("8~16자의 영문, 숫자, 특수문자로 입력하세요.").css("color","red")
			.css("font-size","12px").css("display","block").css("clear","both")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
		} else {
			$("#pwcheck_msg").text("안전한 비밀번호입니다.").css("color","#7AB2CC")
			.css("font-size","12px").css("display","block").css("clear","both")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/petcarepedia/images/check.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
		}
	});
	//비밀번호 확인 유효성 체크
	$("#cpass").keyup(function(){
		if($("#cpass").val() == $("#pass").val()){
			if(!reg_pw.test($("#cpass").val())){
				$("#cpwcheck_msg").text("8~16자의 영문, 숫자, 특수문자로 입력하세요.").css("color","red")
				.css("font-size","12px").css("display","block").css("clear","both")
				.css("padding-top","5px")
				.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
			} else{
				$("#cpwcheck_msg").text("비밀번호가 일치합니다.").css("color","#7AB2CC")
				.css("font-size","12px").css("display","block").css("clear","both")
				.css("padding-top","5px")
				.prepend("<img src='http://localhost:9000/petcarepedia/images/check.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
			}
		} else {
			$("#cpwcheck_msg").text("비밀번호가 일치하지 않습니다.").css("color","red")
			.css("font-size","12px").css("display","block").css("clear","both")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
		}
	});
	//성명 유효성 체크
	$("form[name='joinForm'] #name").blur(function(){
		if($("form[name='joinForm'] #name").val() == ""){
			$("#namecheck_msg").text("성명을 입력하세요.").css("color","red")
			.css("font-size","12px").css("display","block").css("clear","both")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
		} else {
			$("#namecheck_msg").text("").css("display","none");
		}
	});
	//휴대폰 유효성 체크
	$("form[name='joinForm'] #phone").keyup(function(){
		if(!regPhone.test($("form[name='joinForm'] #phone").val())){
			$("#phonecheck_msg").text("올바른 연락처를 입력하세요.").css("color","red")
			.css("font-size","12px").css("display","block").css("clear","both")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
		} else {
			$("#phonecheck_msg").text("").css("display","none");
		}
	});
	
	//별명 유효성 체크
	$("#nickname").keyup(function(){
		if(!reg_nick.test($("#nickname").val())){
			$("#nickcheck_msg").text("특수문자와 초성 및 모음 제외 2~16자로 입력하세요.").css("color","red")
			.css("font-size","12px").css("display","block").css("clear","both")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
		} else {
			$("#nickcheck_msg").text("").css("display","none");
		}
	});
	
	//약관동의 전체체크
	$("#termAll").click(function(){
		if($("#termAll").is(':checked')){
			$("form[name='termForm'] input:checkbox[name='term']").prop('checked',true);
		} else {
			$("form[name='termForm'] input:checkbox[name='term']").prop('checked',false);
		}
	});
	$("form[name='termForm'] input:checkbox[name='term'],.term-modal").click(function(){
		if($("#term1").is(':checked')&&$("#term2").is(':checked')&&$("#term3").is(':checked')&&$("#term4").is(':checked')){
			$("#termAll").prop('checked',true);
		} else {
			$("#termAll").prop('checked',false);
		}
	});
	
	//약관동의 유효성 체크
	$(".terms,.term-modal").click(function(){
		if($("#term1").is(':checked') && $("#term2").is(':checked')){
			$("#termcheck_msg").text("").css("display","none");
		} else {
			$("#termcheck_msg").text("필수 약관에 모두 동의해주세요.").css("color","red")
			.css("font-size","12px").css("display","block").css("clear","both")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
		}
	});
	//이용약관 모달
	$(".btnModalOpen").click(function(){
		let val = $(this).attr("id");
		$.ajax({
					url : "join_term_data.do?term="+val,
					success : function(result){
							let name = JSON.parse(result).name;
							let content = JSON.parse(result).content;
							
							$(".title").html("<p id='tname'>"+name+"</p><input type='hidden' id='termNum' value='"+val+"'>");
							$(".title").after("<div class='termcont' id='tcontent'>"+content+"</div>");
							
							$(".term-box").show();
							$(".back").show();
						}
				})
	})
	
	$("#btnModalClose").click(function(){
		$("#tname").remove();
		$("#tcontent").remove();
		$(".term-box").hide();
		$(".back").hide();
	})
	$("#btnModalAgree").click(function(){
		let termNum = $("#termNum").val();
		$("#term"+termNum).prop("checked",true);
		$("#tname").remove();
		$("#tcontent").remove();
		$(".term-box").hide();
		$(".back").hide();
	})
	
	$.joinValidationCheck = function() {
		if($("#idcheck_msg").text() == "사용 가능한 아이디입니다."
			&& $("#pwcheck_msg").text() == "안전한 비밀번호입니다."
			&& $("#cpwcheck_msg").text() == "비밀번호가 일치합니다."
			&& $("#pass").val() == $("#cpass").val()
			&& $("form[name='joinForm'] #name").val() != ""
			&& $("form[name='joinForm'] #phone").val() != ""
			&& $("#phonecheck_msg").text() != "올바른 연락처를 입력하세요."
			&& $("form[name='joinForm'] #nickname").val() != ""
			&& $("#nickcheck_msg").text() != "특수문자와 초성 및 모음 제외 2~16자로 입력하세요."){
			$("#btnJoin").attr("disabled",false);
		} else {
			$("#btnJoin").attr("disabled",true);
		}
	}
	
	//회원가입 버튼 abled
	$("form[name='joinForm'] input").on({
		blur: function(){$.joinValidationCheck();},
		focus: function(){$.joinValidationCheck();},
		click: function(){$.joinValidationCheck();},
		keyup: function(){$.joinValidationCheck();}
	});
	
	
	/**************
	 * 비밀번호 재설정 - 유효성 체크
	 */
	 $.pwUpdatePassCheck = function(){
		if(!reg_pw.test($("#pass").val())){
			$("#pwcheck_msg").text("8~16자의 영문, 숫자, 특수문자로 입력하세요.").css("color","red")
			.css("font-size","12px").css("display","block").css("clear","both")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
		} else {
			$.ajax({
					url : "pass_mulcheck.do?mid="+$("form[name='pwUpdateForm'] #mid").val()+"&pass="+$("form[name='pwUpdateForm'] #pass").val(),
					success : function(result){
						if(result >= 1){
							$("#pwcheck_msg").text("기존과 동일한 비밀번호로는 변경할 수 없습니다.").css("color","red")
							.css("font-size","12px").css("display","block").css("clear","both")
							.css("padding-top","5px")
							.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
						}else if(result == 0){
							$("#pwcheck_msg").text("안전한 비밀번호입니다.").css("color","#7AB2CC")
							.css("font-size","12px").css("display","block").css("clear","both")
							.css("padding-top","5px")
							.prepend("<img src='http://localhost:9000/petcarepedia/images/check.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
						}
					}
				});
		}
	};
	//비밀번호 정규식 체크
	$("form[name='pwUpdateForm'] #pass").on({
		keyup:function(){$.pwUpdatePassCheck();},
		focus:function(){$.pwUpdatePassCheck();},
		blur:function(){$.pwUpdatePassCheck();}
	});
	
	$.pwUpdateCpassCheck = function(){
		if($("#cpass").val() == $("#pass").val()){
			if(!reg_pw.test($("#cpass").val())){
				$("#cpwcheck_msg").text("8~16자의 영문, 숫자, 특수문자로 입력하세요.").css("color","red")
				.css("font-size","12px").css("display","block").css("clear","both")
				.css("padding-top","5px")
				.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
			} else{
				$.ajax({
					url : "pass_mulcheck.do?mid="+$("form[name='pwUpdateForm'] #mid").val()+"&pass="+$("form[name='pwUpdateForm'] #cpass").val(),
					success : function(result){
						if(result >= 1){
							$("#cpwcheck_msg").text("기존과 동일한 비밀번호로는 변경할 수 없습니다.").css("color","red")
							.css("font-size","12px").css("display","block").css("clear","both")
							.css("padding-top","5px")
							.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
						}else if(result == 0){
							$("#cpwcheck_msg").text("비밀번호가 일치합니다.").css("color","#7AB2CC")
							.css("font-size","12px").css("display","block").css("clear","both")
							.css("padding-top","5px")
							.prepend("<img src='http://localhost:9000/petcarepedia/images/check.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
						}
					}
				});
			}
		} else {
			$("#cpwcheck_msg").text("비밀번호가 일치하지 않습니다.").css("color","red")
			.css("font-size","12px").css("display","block").css("clear","both")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
		}
	}
	//비밀번호 확인 유효성 체크
	$("form[name='pwUpdateForm'] #cpass").on({
		keyup:function(){$.pwUpdateCpassCheck();},
		focus:function(){$.pwUpdateCpassCheck();},
		blur:function(){$.pwUpdateCpassCheck();}
	});
	
	$.pwUpdateValidationCheck = function() {
		if($("#pwcheck_msg").text() == "안전한 비밀번호입니다."
			&& $("#cpwcheck_msg").text() == "비밀번호가 일치합니다."
			&& $("#pass").val() == $("#cpass").val()){
			$("#btnPwUpdate").attr("disabled",false);
		} else {
			$("#btnPwUpdate").attr("disabled",true);
		}
	}
	//재설정 버튼 abled
	$("form[name='pwUpdateForm'] input").on({
		blur: function(){$.pwUpdateValidationCheck();},
		keyup: function(){$.pwUpdateValidationCheck();}
	});
	
	/**************
	 * 아이디찾기 - 유효성 체크
	 */
	 //이메일 정규식 체크
	$("form[name='idFindForm'] #email, form[name='pwFindForm'] #email").keyup(function(){
		if(!reg_email.test($("#email").val())){
			$("#emailcheck_msg").text("올바른 이메일 형식이 아닙니다.").css("color","red")
			.css("font-size","12px").css("display","block").css("clear","both")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
		} else {
			$("#emailcheck_msg").text("").css("display","none");
		}
	});
	
	$.idFindValidationCheck = function() {
		if($("#name").val() != "" 
			&& $('#email').val() != ""
			&& $("#emailcheck_msg").text() != "올바른 이메일 형식이 아닙니다."){
			$("#btnIdFind").attr("disabled",false);
		} else {
			$("#btnIdFind").attr("disabled",true);
		}
	}
	//찾기 버튼 abled
	$("form[name='idFindForm'] input").on({
		blur: function(){$.idFindValidationCheck();},
		focus: function(){$.idFindValidationCheck();},
		click: function(){$.idFindValidationCheck();},
		keyup: function(){$.idFindValidationCheck();}
	});
	
	/**************
	 * 비밀번호찾기 - 유효성 체크
	 */
	$.pwFindValidationCheck = function() {
		if($("#id").val() != "" 
			&& $('#name').val() != ""
			&& $('#email').val() != ""
			&& $("#emailcheck_msg").text() != "올바른 이메일 형식이 아닙니다."){
			$("#btnPwFind").attr("disabled",false);
		} else {
			$("#btnPwFind").attr("disabled",true);
		}
	}
	//찾기 버튼 abled
	$("form[name='pwFindForm'] input").on({
		blur: function(){$.pwFindValidationCheck();},
		focus: function(){$.pwFindValidationCheck();},
		click: function(){$.pwFindValidationCheck();},
		keyup: function(){$.pwFindValidationCheck();}
	});
	
	/**************
	 * 로그인 - 유효성 체크
	 */
	$.loginValidationCheck = function() {
		if($("#id").val() != "" 
			&& $('#pass').val() != ""){
			$("#btnLogin").attr("disabled",false);
		} else {
			$("#btnLogin").attr("disabled",true);
		}
	}
	//로그인 버튼 abled
	$("form[name='loginForm'] input").on({
		blur: function(){$.loginValidationCheck();},
		focus: function(){$.loginValidationCheck();},
		click: function(){$.loginValidationCheck();},
		keyup: function(){$.loginValidationCheck();}
	});
	
	/**************
	 * 회원가입 - 다음 주소 찾기 API
	 */
	$("#btnSearchAddr").click(function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	$("#addr").val("("+data.zonecode+") "+ data.address);
	        	$("#term1").focus();
	        }
	    }).open();
		
	}); //search address
	
	/**************
	 * 로그인 - 아이디, 비밀번호 찾기
	 */
	$('#btnBackLogin').click(function(){
		location.href = "login.do";
	})
	$('#btnBackJoin').click(function(){
		location.href = "http://localhost:9000/petcarepedia/join.do";
	})
	
	$('#btnMenuIdFind').click(function(){
		location.href = "login_idfind.do";
	})
	$('#btnMenuPwFind').click(function(){
		location.href = "login_pwfind.do";
	})
	
	//검색바 alert
	$("#btnMainSearch-index").click(function(){
		if($("#hname-index").val()==""){
			Swal.fire({
	            icon: 'info',                         
	            title: '검색어 미입력',         
	            text: '찾고싶은 동물병원의 이름을 입력해주세요', 
	            confirmButtonColor:'#98dfff',
	  			confirmButtonText:'확인' 
	        });
		} else {
			indexSearchForm.submit();
		}
	});
	
	$("#psee").click(function(){
		if($("#psee").is(':checked')){
			$("#pass").attr('type','text');
		} else {
			$("#pass").attr('type','password');
		}
	});
	$("#cpsee").click(function(){
		if($("#cpsee").is(':checked')){
			$("#cpass").attr('type','text');
		} else {
			$("#cpass").attr('type','password');
		}
	});
	
	$('#btn-screenup').click(function() {
	    window.scrollTo({top: 0, behavior:'smooth'});
	});
	$('#btn-screendown').click(function() {
	    window.scrollTo({top: $(document).height(), behavior:'smooth'});
	});
	
	
	/**
	*회원가입 step1
	*/
	//mouseover
	$("#user").mouseover(function(){
		$("#user").css({
			"background":"#98dfff",
			"margin": "-20px 20px 0 0",
			"transition": "background 1s, margin 1s"
		})
		$("#user > i,#user >h1,#user >p").css({
			"color":"white",
			"transition": "color 1s"
		})
	});
	$("#user").mouseleave(function(){
		$("#user").css({
			"background":"white",
			"margin": "0",
			"transition": "background 1s, margin 1s"
		})
		$("#user > i").css({
			"color":"#98dfff",
			"transition": "color 1s"
		})
		$("#user >h1,#user >p").css({
			"color":"#636363",
			"transition": "color 1s"
		})
	});
	
	$("#manager").mouseover(function(){
		$("#manager").css({
			"background":"#FFB3BD",
			"margin": "60px 0 0 20px",
			"transition": "background 1s, margin 1s"
		})
		$("#manager > i,#manager >h1,#manager >p").css({
			"color":"white",
			"transition": "color 1s"
		})
	});
	$("#manager").mouseleave(function(){
		$("#manager").css({
			"background":"white",
			"margin": "40px 0 0 0",
			"transition": "background 1s, margin 1s"
		})
		$("#manager > i").css({
			"color":"#FFB3BD",
			"transition": "color 1s"
		})
		$("#manager >h1,#manager >p").css({
			"color":"#636363",
			"transition": "color 1s"
		})
	});
	
	//click이벤트
	$("#user").click(function(){
		location.href = "join_step2.do?grade=user";
	})
	$("#manager").click(function(){
		location.href = "join_step2.do?grade=manager";
	})
	
	/**
	*회원가입 step2
	*/
	$("#btn1step").click(function(){
		location.href = "join.do";
	})
	$("#btn3step").click(function(){
		if($("#term1").is(':checked') && $("#term2").is(':checked')){
			location.href = "join_step3.do?grade="+$("#grade").val();
		} else {
			Swal.fire({
	            icon: 'warning',                         
	            title: '필수 약관에 모두 동의해주세요',         
	            confirmButtonColor:'#98dfff',
	  			confirmButtonText:'확인' 
	        });
		}
	})
	
	/**
	*회원가입 step3
	*/
	$("#btn2step").click(function(){
		location.href = "join_step2.do?grade="+$("#grade").val();
	})
	$("#btn4step").click(function(){
		if($("#emailauthcheck_msg").text() == "이메일 인증 완료"
			&& $("form[name='joinForm'] #email").val() != ""){
			location.href = "join_step4.do?grade="+$("#grade").val()+"&email="+$("#email").val();
		} else {
			Swal.fire({
	            icon: 'warning',                         
	            title: '이메일 인증을 완료해주세요',         
	            confirmButtonColor:'#98dfff',
	  			confirmButtonText:'확인' 
	        });
		}
	})
	
	/**
	*회원가입 step4
	*/
	$("#btnPstep").click(function(){
		location.href = "join_step3.do?grade="+$("#grade").val();
	})
	
	
}); //ready





