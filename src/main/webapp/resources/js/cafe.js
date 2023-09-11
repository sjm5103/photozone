	
$(function() {
	//사업자
		$("#cafeSignupIdCheckButton").click(function() {
		var cafeidCheck = $("#cafeSignupIdCheck").val();
		if(cafeidCheck == "true") {
			alert("이미 중복확인이 되었습니다.");
			return;
		}
		
		var cafeid = $("#signupCafeid").val();
		$.ajax({
	        url: 'idCheck.do',
	        type: 'POST',
	        data: { cafeid: cafeid },
	        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
	        dataType: 'text',
	        success: function (result) {
	            if (result){
	                alert("아이디 사용이 가능합니다");
					$("#cafeSignupIdCheck").val("true");
	            } else {
	                alert("아이디 사용이 불가능합니다");
				}
        	},
			error: function() {
				alert("전송 실패");
			}
    	});
	});
	
	$("#signupCafenameCheckButton").click(function() {
		var cafename = $("#signupCafenameCheck").val();
		if(cafename == "true") {
			alert("이미 중복확인이 되었습니다.");
			return;
		}
		
		var cafename = $("#signupCafeName").val();
		$.ajax({
	        url: 'cafenameCheck.do',
	        type: 'POST',
	        data: { cafename:cafename },
	        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
	        dataType: 'text',
	        success: function (result) {
	            if (result){
	                alert("카페이름 사용이 가능합니다");
					$("#signupCafenameCheck").val("true");
	            } else {
	                alert("카페이름 사용이 불가능합니다");
				}
        	},
			error: function() {
				alert("전송 실패");
			}
    	});
	});
	
	$("#goSignUpButton3").click(function() {
		 var form = $('#cafeSignupForm')[0];  	    
   		var data = new FormData(form);
		$.ajax({
	        url: 'cafeSignup.do',
	        type: 'POST',
	        data: data,
			enctype:'multipart/form-data',
			contentType : false,
        	processData : false,
	        dataType: 'json',
   			cache:false,
	        success: function (result) {
	            if (result){
	                alert("사업자 가입 신청이 완료되었습니다. 관리자의 승인을 기다려주세요.");
	            } else {
					alert("사업자 가입 신청 실패. 주소를 확인해주세요.");
				}
        	},
			error: function() {
			}
    	});
		$("#modalCafeSignUp").css("display", "none");
	});
	
	$("#LoginCafeSubmit").click(function() {
		var cafeid = $("#loginCafeid").val();
		var pwd = $("#loginCafePwd").val();
		var autoCafeLogin = $('#autoCafeLogin').is(':checked');;
		if(!(!!cafeid.trim())) {
			alert("아이디를 입력해주세요.");
			return;
		}
		if(!(!!pwd.trim())) {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		location.href='/pz/cafeLogin.do?cafeid='+cafeid+'&pwd='+pwd+'&autoLogin='+autoCafeLogin;
	});
	
	$("#cafeLogoutButton").click(function() {
		location.href='/pz/cafeLogout.do';
	});
	
	$("#mypageCafenameCheckButton").click(function() {
		var cafename = $("#mypageCafenameCheck").val();
		var beforeCafename = $("#mypageBeforeCafename").val();
		var afterCafename = $("#mypageCafename").val();
		if(beforeCafename === afterCafename) {
			alert("닉네임이 동일합니다.");
			return;
		}
		if(cafename == "true") {
			alert("이미 중복확인이 되었습니다.");
			return;
		}
		
		$.ajax({
	        url: 'cafenameCheck.do',
	        type: 'POST',
	        data: { cafename:afterCafename },
	        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
	        dataType: 'text',
	        success: function (result) {
	            if (result){
	                alert("닉네임 사용이 가능합니다");
					$("#mypageCafenameCheck").val("true");
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
		var cafenameCheck = $("#mypageCafenameCheck").val();
		var beforeCafename = $("#mypageBeforeCafename").val();
		var afterCafename = $("#mypageCafename").val();
		
		if(beforeCafename != afterCafename) {
			if(cafenameCheck == "false") {
				alert("닉네임 중복을 확인해주세요.");
				return;
			}
		}
		
		var pwd = $("#mypagePwd").val();
		if(!(!!pwd.trim())){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		
		var mypage = $("#cafeMypageForm").serialize();
		$.ajax({
	        url: 'updateCafe.do',
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
	$("#cafeMenu").click(function() {
		console.log("cafeMenu");
		var form = $('#cafeMenuForm')[0];
		var data = new FormData(form);
		$.ajax({
	        url: 'addCafeMenu.do',
	        type: 'POST',
	        data: data,
			enctype:'multipart/form-data',
			contentType : false,
        	processData : false,
	        dataType: 'json',
   			cache:false,
	        success: function (result) {
	            if (result){
	            } else {
				}
        	},
			error: function() {
				alert("전송 실패");
			}
    	});
	});
});