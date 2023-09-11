/**
 * 유저 관련 자바스크립트
 */
$(function() {
	// 체크 박스 상태 변경 시 이벤트 처리
	$("#AgreeChk input[type='checkbox']").change(function() {
	    var isChecked = $(this).prop("checked"); // 체크 박스의 상태 가져오기
	    $("#goSignUpButton").prop("disabled", !isChecked); // 회원가입 버튼 활성화/비활성화
	});
	//메인에서 회원가입 눌렀을시 (로그인창꺼지고) 약관동의화면띄우기
	$("#signUpButton").click(function() {
	    $("#modalLogin").fadeOut();
	    $("#modalAgree").css("display", "block"); // 모달 노출 변경
	    $("#goSignUpButton").prop("disabled", true);// 초기에는 회원가입 버튼 비활성화
	});        
	// 약관동의 화면에서 회원가입 버튼 클릭 시 모달 닫고 회원가입창 나오게
	$("#goSignUpButton").click(function() {
	    $("#modalAgree").fadeOut();
	    $("#modalSignUp").css("display", "block");
	});
	//메인에서 로그인버튼 눌렀을시 (회원가입창꺼지고) 로그인모달띄우기
	$("#loginButton").click(function() {
	    $("#modalAgree").fadeOut();
	    $("#modalSignUp").fadeOut();
	    $("#modalLogin").css("display", "block");
	});
	//로그인창에서 사업자로그인 클릭시 사업자로그인 모달 띄우기
   $("#cafeLoginButton").click(function() {
       $("#modalLogin").fadeOut();
      $("#modalCafeLogin").css("display", "block");
   });
	//로그인버튼눌른후 회원가입 누를시 (로그인버튼꺼지고) 약관동의 모달 띄우기
	$("#goSignUpButton2").click(function() {
	    $("#modalLogin").fadeOut();
	    $("#modalAgree").css("display", "block");
	});
	//카페로그인버튼눌른후 회원가입 누를시 (로그인버튼꺼지고) 약관동의 모달 띄우기
	$("#goSignUpButton4").click(function() {
	    $("#modalCafeLogin").fadeOut();
	    $("#modalAgree").css("display", "block");
	});
	//마이페이지버튼 누르면 마이페이지 모달 열림
	$("#myPageButton").click(function() {
		$("#modalMyPage").css("display", "block");
	});
	//마이(카페)페이지버튼 누르면 마이페이지 모달 열림
	$("#myCafePageButton").click(function() {
		$("#modalMyCafePage").css("display", "block");
	});
	//사업자회원가입 모달열림
	$("#cafeSignUpLink").click(function() {
	    $("#modalSignUp").fadeOut();
		$("#modalCafeSignUp").css("display", "block");
	});
	/*닫기버튼*/
	$("#closeModalAgree").click(function() {
		$("#modalAgree").fadeOut();
	 });

	$("#closeModalMyPage").click(function() {
		$("#modalMyPage").fadeOut();
	});
	
	$("#closeModalMyCafePage").click(function() {
		$("#modalMyCafePage").fadeOut();
	});
	
	$("#closeModalCafeMenuListInfo").click(function() {
		$("#modalCafeMenuListInfo").fadeOut();
	});
	
	$("#closeModalCafeSignUp").click(function() {
	    $("#modalCafeSignUp").fadeOut();
	    resetLoginForm();
	});
	
	// 회원가입모달 닫기 버튼 클릭 이벤트
	$("#closeModalSignUp").click(function() {
	    $("#modalSignUp").fadeOut();
	    resetSignForm();
	});

	// 로그인 모달 닫기 버튼 클릭 이벤트
	$("#closeModalLogin").click(function() {
	    $("#modalLogin").fadeOut();
	    resetLoginForm(); // 입력 필드 초기화 함수 호출
	});
	// 사업자 로그인 모달 닫기 버튼 클릭 이벤트
   $("#closeModalCafeLogin").click(function() {
       $("#modalCafeLogin").fadeOut();
   });
	
	function resetSignForm() {
	    $("#userid").val(""); // 아이디 입력 필드 초기화
	    $("#pwd").val(""); // 비밀번호 입력 필드 초기화
	    // 추가적으로 다른 입력 필드도 초기화해야 한다면 여기에 추가하면 됩니다.
	}
	
	function resetLoginForm() {
	    $("#userid").val(""); // 아이디 입력 필드 초기화
	    $("#pwd").val(""); // 비밀번호 입력 필드 초기화
	    // 추가적으로 다른 입력 필드도 초기화해야 한다면 여기에 추가하면 됩니다.
	}
	
	$("#signupUserid").change(function() {
		$("#signupIdCheck").val("false");
	});
	
	//사용자 
	$("#signupIdCheckButton").click(function() {
		var idCheck = $("#signupIdCheck").val();
		if(idCheck == "true") {
			alert("이미 중복확인이 되었습니다.");
			return;
		}
		
		var userid = $("#signupUserid").val();
		$.ajax({
	        url: 'idCheck.do',
	        type: 'POST',
	        data: { userid: userid },
	        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
	        dataType: 'text',
	        success: function (result) {
	            if (result == true){
	                alert("아이디 사용이 가능합니다");
					$("#signupIdCheck").val("true");
	            } else {
	                alert("아이디 사용이 불가능합니다");
				}
        	},
			error: function() {
				alert("전송 실패");
			}
    	});
	});
	
	$("#signupNickname").change(function() {
		$("#signupNicknameCheck").val("false");
	});
	
	$("#signupNicknameCheckButton").click(function() {
		var nickname = $("#signupNicknameCheck").val();
		if(nickname == "true") {
			alert("이미 중복확인이 되었습니다.");
			return;
		}
		
		var nickname = $("#signupNickname").val();
		$.ajax({
	        url: 'nicknameCheck.do',
	        type: 'POST',
	        data: { nickname:nickname },
	        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
	        dataType: 'text',
	        success: function (result) {
	            if (result == true){
	                alert("닉네임 사용이 가능합니다");
					$("#signupNicknameCheck").val("true");
	            } else {
	                alert("닉네임 사용이 불가능합니다");
				}
        	},
			error: function() {
				alert("전송 실패");
			}
    	});
	});
	
	$("#signUpSubmit").click(function() {
		var idCheck = $("#signupIdCheck").val();
		var nicknameCheck = $("#signupNicknameCheck").val();
		if(idCheck == "false") {
			alert("아이디 중복을 확인해주세요.");
			return;
		}
		if(nicknameCheck == "false") {
			alert("닉네임 중복을 확인해주세요.");
			return;
		}
		
		var data = $("#signupForm").serialize();
		$.ajax({
	        url: 'userSignup.do',
	        type: 'POST',
	        data: data,
	        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
	        dataType: 'text',
	        success: function (result) {
	            if (result){
	            } else {
				}
        	},
			error: function() {
				alert("전송 실패");
			}
    	});
		$("#modalSignUp").css("display", "none");
	});
	
	$("#loginSubmit").click(function() {
		var userid = $("#loginUserid").val();
		var pwd = $("#loginPwd").val();
		var autoLogin = $('#autoLogin').is(':checked');;
		if(!(!!userid.trim())) {
			alert("아이디를 입력해주세요.");
			return;
		}
		if(!(!!pwd.trim())) {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		location.href='/pz/login.do?userid='+userid+'&pwd='+pwd+'&autoLogin='+autoLogin;
	});
	
/*	$("#logoutButton").click(function() {
		location.href='/pz/logout.do';
		location.href='/pz/cafeLogout.do';
	});*/
	
	
	
	$("#mypageNicknameCheckButton").click(function() {
		var nickname = $("#mypageNicknameCheck").val();
		var beforeNickname = $("#mypageBeforeNickname").val();
		var afterNickname = $("#mypageNickname").val();
		if(beforeNickname === afterNickname) {
			alert("닉네임이 동일합니다.");
			return;
		}
		if(nickname == "true") {
			alert("이미 중복확인이 되었습니다.");
			return;
		}
		
		$.ajax({
	        url: 'nicknameCheck.do',
	        type: 'POST',
	        data: { nickname:afterNickname },
	        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
	        dataType: 'text',
	        success: function (result) {
	            if (result){
	                alert("닉네임 사용이 가능합니다");
					$("#mypageNicknameCheck").val("true");
	            } else {
	                alert("닉네임 사용이 불가능합니다");
				}
        	},
			error: function() {
				alert("전송 실패");
			}
    	});
	});
	$("#mypageButton").click(function() {
		var nicknameCheck = $("#mypageNicknameCheck").val();
		var beforeNickname = $("#mypageBeforeNickname").val();
		var afterNickname = $("#mypageNickname").val();
		
		if(beforeNickname != afterNickname) {
			if(nicknameCheck == "false") {
				alert("닉네임 중복을 확인해주세요.");
				return;
			}
		}
		
		var pwd = $("#mypagePwd").val();
		if(!(!!pwd.trim())){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		
		var mypage = $("#mypageForm").serialize();
		$.ajax({
	        url: 'updateUser.do',
	        type: 'POST',
	        data: mypage,
	        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
	        dataType: 'text',
	        success: function (result) {
				if(result == 1) {
					alert("정보가 변경되었습니다.");
				}
				else if(result == 2) {
					alert("비밀번호가 일치하지 않습니다.");
				}
				else {
					alert("정보 변경에 실패했습니다.");
				}
        	},
			error: function() {
				alert("전송 실패");
			}
    	});
	});
});