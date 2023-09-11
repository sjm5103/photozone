/**
 * 
 */
// CAFEPZ이미지를 클릭했을 때 CAFEPZDetail 모달 열기
function imageClickHandler(unq, imageUrl, cafePZDetailuserid, cafePZDetailinsta) {
	
	$("#cafePZUnq").val(unq);
  
  // 모달 내부의 이미지 소스 변경
  $("#cafePZDetailImage").attr("src", imageUrl);
   // 모달 내 정보 표시
  $("#cafePZDetailUserid").text(cafePZDetailuserid);
  $("#cafePZDetailInsta").text(cafePZDetailinsta);

  // 모달 열기
  $("#modalCafePZDetail").css("display", "block");
  
}


// PZ이미지를 클릭했을 때 PZ Detail 모달 열기
function PZimageClickHandler(unq, PZimageUrl, PZDetailuserid, PZDetailinsta) {
  
	$("#PZUnq").val(unq);
  // 모달 내부의 이미지 소스 변경
  $("#PZDetailImage").attr("src", PZimageUrl);
  // 모달 내 정보 표시
  $("#PZDetailUserid").text(PZDetailuserid);
  $("#PZDetailInsta").text(PZDetailinsta);
  // 모달 열기
  $("#modalPZDetail").css("display", "block");
  
}

$(function() {
	//위치추가 모달열림
	$("#location").click(function() {
		$("#modalLocation").css("display", "block");
	});
	//관리자페이지 모달열림
	$("#adminPageButton").click(function() {
		$("#modalAdminPage").css("display", "block");
	});
	//위치등록 허가 모달
	$("#updateLocationData").click(function() {
		$("#modalUpdateLocationData").css("display", "block");
	});
	//카페등록 허가 모달
	$("#updateCafeLocationData").click(function() {
		$("#modalUpdateCafeLocationData").css("display", "block");
	});
	//핀포인트로 카페열고 내부 PZ목록보기 버튼누를시 카페글 목록 모달열림
	$("#cafePZListButton").click(function() {
		console.log("버튼 클릭됨");
		// cafeInfo에서 저장한 addr 값을 가져옴
    	var addr = $(this).data("addr");
		console.log("주소 값:", addr);
		$.ajax({
			type: "POST",
			url: "cafePZList.do", // 컨트롤러의 URL
			data: { addr : addr },
			dataType: 'json',
			success: function(response) {
			  console.log("JSON 데이터:", response); // 반환된 JSON 데이터 확인
		      // 이미지 클릭 핸들러에 데이터 전달
			  var cafeId = response.CafeVo.cafeid; // 카페 아이디
			  var cafeName = response.CafeVo.cafename; // 카페 이름
			  var cafeInsta = response.CafeVo.insta; // 카페 인스타그램
			  var cafeAddr = response.CafeVo.addr; // 카페 주소
			  
			  $("#cafeInfoName").text(cafeName);
			  $("#cafeInfoId").text(cafeId);
			  $("#cafeInfoInsta").text(cafeInsta);
			  $("#cafeInfoAddr").text(cafeAddr);
			  $("#cafePZDetailName").text(cafeName);
			  $("#cafePZDetailId").text(cafeId);
		      $("#cafePZDetailInsta").text(cafeInsta);
				
			  // 기존 데이터 제거
           	  $("#cafePZListTable").empty();
				for (var i = 0; i < response.CafePZList.length; i++) {
					var unq = response.CafePZList[i].unq;
		        var cafePZuserid = response.CafePZList[i].userid;
		        var cafePZinsta = response.CafePZList[i].insta;
		        var cafePZphotopath = response.CafePZList[i].photopath;
				var cafePZDetailuserid = response.CafePZList[i].userid;
		        var cafePZDetailinsta = response.CafePZList[i].insta;
				var imageUrl = 'image/' + cafePZphotopath;
		        // 이미지에 링크를 추가하고 onclick 이벤트 설정
   				var tr = '<tr><td style="width:35%;"><a href="javascript:void(0);" onclick="imageClickHandler(\''+unq+'\',\'' + imageUrl + '\',\'' + cafePZDetailuserid + '\',\'' + cafePZDetailinsta + '\')"><img src="' + imageUrl + '" style="width:119px; height:90px;"></a></td><td>' + cafePZuserid + '<br>' + cafePZinsta + '</td></tr>';
		
		        $("#cafePZListTable").append(tr);
		    };
		
		    $("#modalCafeListInfo").css("display", "block");
		},
			error: function(xhr, status, error) {
				console.log("Error:", error);
			}
		});
	});
	
	//핀포인트로 PZ열고 내부 목록보기 버튼누를시 PZ 목록 모달열림
	$("#pzNoticeList").click(function() {
		console.log("버튼 클릭됨");
		// cafeInfo에서 저장한 addr 값을 가져옴
    	var addr = $(this).data("addr");
		console.log("PZ주소 값:", addr);
		$.ajax({
			type: "POST",
			url: "pzList.do", // 컨트롤러의 URL
			data: { addr: addr },
			dataType: 'json',
			success: function(response) {
				console.log("JSON 데이터:@@@", response); // 반환된 JSON 데이터 확인
				$("#pzListAddr").text(response.PlaceVo.addr);
				$("#pzListPlaceName").text(response.PlaceVo.placeName);
				$("#pzListExplain").text(response.PlaceVo.explain);
				// 기존 데이터 제거
           	    $("#PZListTable").empty();
				for (var i = 0; i < response.PZList.length; i++) {
					var unq = response.PZList[i].unq;
		        var PZuserid = response.PZList[i].userid;
		        var PZinsta = response.PZList[i].insta;
		        var PZphotopath = response.PZList[i].photopath;
				var PZDetailuserid = response.PZList[i].userid;
		        var PZDetailinsta = response.PZList[i].insta;
			    var PZimageUrl = 'image/' + PZphotopath;
		        var tr = '<tr><td style="width:35%;"><a href="javascript:void(0);" onclick="PZimageClickHandler(\''+unq+'\',\''+ PZimageUrl + '\', \'' + PZDetailuserid + '\', \'' + PZDetailinsta + '\')"><img src="' + PZimageUrl  + '" style="width:119px; height:90px;"></td><td>' + PZuserid + '<br>' + PZinsta + '</td></tr>';
		
		        $("#PZListTable").append(tr);
		    };
		
		    $("#modalPZListInfo").css("display", "block");
		},
			error: function(xhr, status, error) {
				console.log("Error:", error);
			}
		});
	});
	//cafeinfo에서 자세히보기 버튼(메뉴목록) 클릭시
	$("#cafeMenuButton").click(function() {
		console.log("버튼 클릭됨");
		// cafeInfo에서 저장한 addr 값을 가져옴
    	var addr = $(this).data("addr");
		console.log("주소 값:", addr);
		$.ajax({
			type: "POST",
			url: "getCafeMenu.do", // 컨트롤러의 URL
			data: { addr: addr },
			dataType: 'json',
			success: function(response) {
				console.log(response);
				$("#detailCafeName").text(response.cafename);
				$("#detailCafeInsta").text("인스타: " + response.insta);
				var time = response.opentime + " ~ " + response.closetime;
				$("#detailCafeOpen").text("오픈시간: " + time);
				$("#detailCafeAddr").text(response.addr);
				// 기존 데이터 제거
           	  	$("#cafeMenuTable").empty();
				for(var i = 0; i < response.menuNames.length; i ++) {
					var menuName = response.menuNames[i];
					var menuPrice = response.prices[i];
					var menuPath = response.menuPaths[i];
					var menuImageUrl = 'image/' + menuPath;
					var tr = '<tr><td style="width:30%;"><img src="'+ menuImageUrl +'"></td><td>'+menuName+'('+menuPrice+')</td></tr>';
					$("#cafeMenuTable").append(tr);
				}
				$("#modalCafeMenuInfo").css("display", "block");
			},
			error: function(xhr, status, error) {
				console.log("Error:", error);
			}
		});
	});
	
	//마이(사업자)페이지에서 메뉴등록 모달보기
	$("#cafeMenuRegister").click(function() {
		$("#modalCafeMenuRegister").css("display", "block");
	});
	
	//카페 info좋아요버튼 클릭시
	$("#cafeLikesButton").click(function(){
		console.log("좋아요 버튼 클릭됨");
		// cafeInfo에서 저장한 addr 값을 가져옴
    	var addr = $(this).data("addr");
		console.log("좋아요 누른 주소 값:", addr);
		$.ajax({
			type: "POST",
			url: "updateCafeLikes.do", // 컨트롤러의 URL
			data: { addr: addr },
			dataType: 'json',
			success: function(result) {
				if(result == true){
				} else{
				}
			},
			error: function(xhr, status, error) {
				console.log("Error:", error);
			}
		});
	});
	//카페인포에서 인스타버튼 클릭시
	$("#cafeInstagramButton").click(function(){
		console.log("인스타버튼 클릭됨");
		// cafeInfo에서 저장한 addr 값을 가져옴
    	var addr = $(this).data("addr");
		console.log("인스타 주소 찾을 아이디 값:", addr);
		$.ajax({
			type: "POST",
			url: "getCafeInstaId.do", // 컨트롤러의 URL
			data: { addr: addr },
			dataType: 'text',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8", // UTF-8 설정
			success: function(cafeInstaId) {
			console.log(cafeInstaId);
			// cafeInstaId를 사용하여 URL 생성
        	var instaUrl = "https://www.instagram.com/" + cafeInstaId;
			console.log(instaUrl);
	        // 새 창에서 URL 열기
	        window.open(instaUrl, "_blank");
			},
			error: function(xhr, status, error) {
				console.log("Error:", error);
			}
		});
	})
	//카페 게시글 쓰기
	$("#cafePZWrite").click(function() {
		console.log("cafepz게시글 클릭");
		$("#modalCafePZWrite").css("display", "block");
	});
	//PZ게시글 쓰기
	$("#PZWrite").click(function() {
		console.log("pz게시글 클릭");
		$("#modalPZWrite").css("display", "block");
	});
	/* ============================로그인창처리=========================================== */
	$(".input-field").on("input", function() {
		var idValue = $("#userid").val();
		var passwordValue = $("#pwd").val();

		if (idValue !== "" && passwordValue !== "") {
			$("#LoginSubmit").prop("disabled", false);
		} else {
			$("#LoginSubmit").prop("disabled", true);
		}
	});
	/* ============================로그인창처리=========================================== */
	$(".input-field2").on("input", function() {
		var idValue = $("#cafeid").val();
		var passwordValue = $("#pwd").val();

		if (idValue !== "" && passwordValue !== "") {
			$("#cafeLoginSubmit").prop("disabled", false);
		} else {
			$("#cafeLoginSubmit").prop("disabled", true);
		}
	});
	/* ============================로그아웃버튼=========================================== */
	$("#logoutButton").click(function() {
		location.href = '/pz/logout.do';
	});
	/* ============================로그아웃버튼=========================================== */
	$("#cafeLogoutButton").click(function() {
		location.href = '/pz/cafeLogout.do';
	});
	/*==============================닫기버튼==================================*/
	$("#closeModalLocation").click(function() {
		$("#modalLocation").fadeOut();
	});
	$("#locationCancelButton").click(function() {
		$("#modalLocation").fadeOut();
	});
	$("#closeModalAdminPage").click(function() {
		$("#modalAdminPage").fadeOut();
	});
	$("#closeModalUpdateLocationData").click(function() {
		$("#modalUpdateLocationData").fadeOut();
	});
	$("#closeModalUpdateCafeLocationData").click(function() {
		$("#modalUpdateCafeLocationData").fadeOut();
	});
	$("#closeModalCafeInfo").click(function() {
		$("#modalCafeInfo").fadeOut();
	});
	$("#closeModalCafeListInfo").click(function() {
		$("#modalCafeListInfo").fadeOut();
	});
	$("#closeModalPZInfo").click(function() {
		$("#modalPZInfo").fadeOut();
	});
	$("#closeModalPZListInfo").click(function() {
		$("#modalPZListInfo").fadeOut();
	});
	$("#closeModalPZDetail").click(function() {
		$("#modalPZDetail").fadeOut();
	});
	$("#closeModalCafePZDetail").click(function() {
		$("#modalCafePZDetail").fadeOut();
	});
	$("#closeModalCafePZWrite").click(function() {
		$("#modalCafePZWrite").fadeOut();
	});
	$("#closeModalPZWrite").click(function() {
		$("#modalPZWrite").fadeOut();
	});
	$("#closeModalCafeListDetail").click(function() {
		$("#modalCafeListDetail").fadeOut();
	});
	$("#closeModalCafeMenuInfo").click(function() {
		$("#modalCafeMenuInfo").fadeOut();
	});
	$("#closeModalCafeMenuRegister").click(function() {
		$("#modalCafeMenuRegister").fadeOut();
	});
	// 모달 컨텐츠 클릭 시 닫히지 않도록
	$("#modalAgree").click(function(e) {
		e.stopPropagation();
	});

	$("#modalSignUp").click(function(e) {
		e.stopPropagation();
	});

	$("#modalLogin").click(function(e) {
		e.stopPropagation();
	});

	$("#modalMyPage").click(function(e) {
		e.stopPropagation();
	});

	$("#modalLocation").click(function(e) {
		e.stopPropagation();
	});

});

