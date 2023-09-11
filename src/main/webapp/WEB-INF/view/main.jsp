<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge; chrome=1">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=0c4pccox49"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="js/map/MarkerClustering.js"></script>

<script src="js/main.js"></script>
<script src="js/user.js"></script>
<script src="js/cafe.js"></script>
<script src="js/place.js"></script>
<script src="js/admin.js"></script>
<script src="js/cafePZ.js"></script>
<script src="js/PZ.js"></script>
<link href="css/main.css" rel="stylesheet">

</head>
<body>
	<!-- 메인지도 -->
	<div id="mapContainer">
		<div id="map"></div>
	</div>

	<!-- 아이콘박스 -->
	<a href="main.do">
	<div id="photoZoneBox">
		<img src="image/icon/camera_icon.png"
			id="photoZoneImage"> PhotoZone
	</div>
	</a>

	<!-- 좌측버튼 -->
	<div id="userButtons_left">
	<button type="button" id="myLocationButton">
        <img src="image/icon/myLocation_icon.png">
    </button>
    <!-- <button type="button" id="cafeListDetail">
    ㅎㅇ
    </button> -->
	<c:if test="${session != null}">
        <c:if test="${userVo.userid != null}">
            <button type="button" id="myPageButton">
                <img src="image/icon/myPage_icon.png">
            </button>
        </c:if>
        <c:if test="${cafeVo.cafeid != null}">
            <button type="button" id="myCafePageButton">
                <img src="image/icon/cafePage_icon.png">
            </button>
        </c:if>
        <c:if test="${userVo.auth == 'Y' || userVo.auth == 'M'}">
        <button type="button" id="adminPageButton">
				<img src="image/icon/adminPage_icon.png">
		</button>
		</c:if>
	</c:if>
	</div>
	
	<!-- 하단버튼 -->
	<c:if test="${session != null}">
		<div id="userButtons_bottom">
			<button type="button" id="location">
				<img src="image/icon/wifi_icon.png">위치추가
			</button>
		</div>
	</c:if>
	
	<!-- 우측상단버튼 -->
	<c:if test="${session == null}">
		<div id="userButtons_right">
			<button type="button" id="signUpButton">회원가입</button>
			<button type="button" id="loginButton">로그인</button>
		</div>
	</c:if>
	<c:if test="${session != null}">
		<div id="userButtons_right">
			 <c:if test="${userVo.userid != null}">
	            <button type="button" id="logoutButton">로그아웃</button>
	        </c:if>
	        <c:if test="${cafeVo.cafeid != null}">
	            <button type="button" id="cafeLogoutButton">로그아웃</button>
	        </c:if>
		</div>
	</c:if>


	<!-- 회원가입약관 및 회원가입 모달 -->
	<%@ include file="../include/modal/signup.jsp" %>
	
	<!-- 사업자 회원가입 모달 -->
	<%@ include file="../include/modal/cafeSignup.jsp" %>
	
	<!-- 로그인 모달 -->
	<%@ include file="../include/modal/login.jsp" %>
	
	<!-- 사업자로그인 모달 -->
	<%@ include file="../include/modal/cafeLogin.jsp" %>
	
	<!-- 마이페이지 모달 -->
	<%@ include file="../include/modal/mypage.jsp" %>
	
	<!-- 카페 마이페이지 모달 -->
	<%@ include file="../include/modal/cafeMypage.jsp" %>
	
	<!-- 카페 마이페이지 메뉴등록 모달 -->
	<%@ include file="../include/modal/cafeMenuRegister.jsp" %>
	
	<!-- 관리자페이지 모달 -->
	<%@ include file="../include/modal/adminPage.jsp" %>
	
	<!-- 위치 등록 정보 허가 모달 -->
	<%@ include file="../include/modal/addLocationAccept.jsp" %>
	
	<!-- 핀포인트 찍었을때 카페정보 -->
	<%@ include file="../include/modal/cafeinfo.jsp" %>
	
	<!-- 카페 메뉴목록 보기 -->
	<%@ include file="../include/modal/cafeMenu.jsp" %>
	
	<!-- 카페PZ 목록보기 -->
	<%@ include file="../include/modal/cafePZList.jsp" %>
	
	<!-- 카페PZ 디테일 -->
	<%@ include file="../include/modal/cafePZDetail.jsp" %>
	
	<!-- 핀포인트 찍었을때 PZ정보 -->
	<%@ include file="../include/modal/pzinfo.jsp" %>
	
	<!-- PZ 목록보기 -->
	<%@ include file="../include/modal/PZList.jsp" %>
	
	<!-- PZ 디테일 -->
	<%@ include file="../include/modal/PZDetail.jsp" %>
	
	<!-- 게시물 작성(PZ) -->
	<%@ include file="../include/modal/PZWrite.jsp" %>

	<!-- 게시물 작성(CAFE PZ) -->
	<%@ include file="../include/modal/cafePZWrite.jsp" %>
	
	<!-- 위치추가 모달 -->
	<%@ include file="../include/modal/addLocation.jsp" %>
	
	<script>
		$(function() {
			$("#myLocationButton").click(function() {
				getLocation();
			});
		});
	
		var mapOptions = {
			scaleControl: false,
		   logoControl: false,
		    mapDataControl: false,
		    zoomControl: true,
	        minZoom: 6,
		    center: new naver.maps.LatLng(37.3595704, 127.105399),
		    zoom: 15
		};
		var map = new naver.maps.Map('map', mapOptions);
		map.setSize(new naver.maps.Size(screen.availWidth, screen.availHeight));
	
		function getLocation() {
		    if (navigator.geolocation) { // GPS를 지원하면
		        navigator.geolocation.getCurrentPosition(function(position) {
		              var center = new naver.maps.LatLng(position.coords.latitude, position.coords.longitude);
		              map.setCenter(center);
		              map.setZoom(15, true);
		        }, function(error) {
		              console.error(error);
		        }, {
		              enableHighAccuracy: false,
		              maximumAge: 0,
		              timeout: Infinity
		        });
		      } else {
		        alert('GPS를 지원하지 않습니다');
		      }
		}
		getLocation();
		
		var markers = [];
		var markerInfos = [];
		//주소 배열
		var addrs = [];
	</script>

    <c:forEach var="map" items="${maps}">
		<script>
			var marker = new naver.maps.Marker({
				position: new naver.maps.LatLng(${map.y}, ${map.x}),
				map: map,
				title: "${map.longName}",
				shape: {
			        coords: [11, 0, 9, 0, 6, 1, 4, 2, 2, 4,
			                0, 8, 0, 12, 1, 14, 2, 16, 5, 19,
			                5, 20, 6, 23, 8, 26, 9, 30, 9, 34,
			                13, 34, 13, 30, 14, 26, 16, 23, 17, 20,
			                17, 19, 20, 16, 21, 14, 22, 12, 22, 12,
			                22, 8, 20, 4, 18, 2, 16, 1, 13, 0],
			        type: 'poly'
			    }
			});
			
			markers.push(marker);
			
			var info = new Map();
			info.set("x", ${map.x});
			info.set("y", ${map.y});
			markerInfos.push(info);
			
			//주소 배열 등록
			addrs.push("${map.addr}");
		</script>
	</c:forEach>
	
	<script>
		naver.maps.Event.addListener(map, 'idle', function() {
		    updateMarkers(map, markers);
		});
	
		function updateMarkers(map, markers) {
		    var mapBounds = map.getBounds();
		    var marker, position;
	
		    for (var i = 0; i < markers.length; i++) {
	
		        marker = markers[i]
		        position = marker.getPosition();
	
		        if (mapBounds.hasLatLng(position)) {
		            showMarker(map, marker);
		        } else {
		            hideMarker(map, marker);
		        }
		    }
		}
	
		function showMarker(map, marker) {
		    if (marker.setMap()) return;
		    marker.setMap(map);
		}
	
		function hideMarker(map, marker) {
		    if (!marker.setMap()) return;
		    marker.setMap(null);
		}
		
		/* <input type="hidden" id="addr"> */
		function listInit(seq) {
			$("#addr").val(addr[seq]);
		}
		
		// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
		function getClickHandler(seq) {
		    return function(e) {
		        var marker = markers[seq];
		        var addr = addrs[seq];
		        
		        var center = new naver.maps.LatLng(markerInfos[seq].get("y"), markerInfos[seq].get("x"));
		        map.setCenter(center);
		        
		        console.log("click");
		        $.ajax({
		        	type: "POST",
		        	url: "determineTable.do",
		        	data: { "addr": addr },
		        	dataType: 'text',
		        	success: function(table){
		        		if(table == "cafeInfo"){
		        			console.log(addr);
		        			openCafeInfo(addr);
		        		} else{
		        			console.log(addr);
		        			openPZInfo(addr);
		        		}
		        	},
		            error: function(xhr, status, error) {
		            	console.log(addr);
		                console.error("AJAX 요청 실패:", error);
		            }
		        })
		        
		    }
		}
		
		function openCafeInfo(addr) {
		    $.ajax({
		        type: "POST",
		        url: "cafeInfo.do", // 서버 컨트롤러의 URL
		        data: { addr: addr },
		        dataType: 'json',
		        success: function(response) {
		            console.log("jsonDATA : ", response);
		            console.log(addr);
		            document.getElementById("cafeInfo").setAttribute("data-json", JSON.stringify(response));
		            
		            // JSON 데이터를 읽어와서 원하는 작업 수행
		            var jsonData = JSON.parse(document.getElementById("cafeInfo").getAttribute("data-json"));
		            /* document.getElementById("cafeId").textContent = jsonData.cafeid; */
		            document.getElementById("cafeName").textContent = jsonData.cafename;
		            document.getElementById("cafeAddress").textContent = jsonData.addr;
		            document.getElementById("cafePhotoPath").src = "image/"+jsonData.photopath;
		            
		            // cafeList를 열 때 해당 cafe의 addr 값을 가져오도록 수정
		            $("#cafePZListButton").data("addr", addr);
		            // cafeMenu를 열 때 해당 cafe의 addr 값을 가져오도록 수정
		            $("#cafeMenuButton").data("addr", addr);
		         	// 좋아요버튼클릭 AND 인스타를 열 때 해당 cafe의 addr 값을 가져오도록 수정
		            $("#cafeLikesButton").data("addr", addr);
		            $("#cafeInstagramButton").data("addr", addr);
		            $("#cafeWriteAddr").val(jsonData.addr);
	                $("#cafeWriteCafename").val(jsonData.cafename);
		            // 모달표시
		            console.log(jsonData.addr);
		            console.log(jsonData.photopath);
		            document.getElementById("modalCafeInfo").style.display = "block";
		        },
		        error: function(xhr, status, error) {
		            console.error("AJAX 요청 실패:", error);
		        }
		    });
		}
	 
	 function openPZInfo(addr) {
	        $.ajax({
	            type: "POST",
	            url: "pzInfo.do", // 서버 컨트롤러의 URL
	            data: { addr: addr },
	            dataType: 'json',
	            success: function(response) {
	            console.log("jsonDATA : ", response);
 				document.getElementById("pzInfo").setAttribute("data-json", JSON.stringify(response));
	             
	            // JSON 데이터를 읽어와서 원하는 작업 수행
	            var jsonData = JSON.parse(document.getElementById("pzInfo").getAttribute("data-json"));
	            document.getElementById("pzAddr").textContent = jsonData.addr;
	            console.log("addr은 불렀음");
	            document.getElementById("pzPlaceName").textContent = jsonData.placeName;
	            console.log("name은 불렀음");
	            document.getElementById("pzPhotoPath").src = "image/"+jsonData.photoPath;
	            console.log("photoPath은 불렀음");
	            
	            // PZList를 열 때 해당 PZ의 addr 값을 가져오도록 수정
	            $("#pzNoticeList").data("addr", addr);
	         	// 좋아요버튼클릭 AND 인스타를 열 때 해당 PZ의 addr 값을 가져오도록 수정
	            $("#PZLikesButton").data("addr", addr);
	            $("#PZInstagramButton").data("addr", addr);
	    		 //모달표시
 		        $("#pzWriteAddr").val(jsonData.addr);
         		$("#pzWritePlacename").val(jsonData.placeName);
	    		console.log(jsonData.photoPath);
	    		document.getElementById("modalPZInfo").style.display = "block";
	            },
	            error: function(xhr, status, error) {
	                console.error("AJAX 요청 실패:", error);
	            }
	        });
    	}
		
		for (var i=0; i<markers.length; i++) {
		    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
		}
		
		naver.maps.Event.addListener(map, 'click', function(e) {
			document.getElementById("modalCafeInfo").style.display = "none";
			document.getElementById("modalPZInfo").style.display = "none";
		})
		
		var htmlMarker1 = {
		    content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(image/map/cluster-marker-1.png);background-size:contain;"></div>',
		    size: N.Size(40, 40),
		    anchor: N.Point(20, 20)
		};
		var htmlMarker2 = {
		    content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(image/map/cluster-marker-2.png);background-size:contain;"></div>',
		    size: N.Size(40, 40),
		    anchor: N.Point(20, 20)
		};
		var htmlMarker3 = {
		    content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(image/map/cluster-marker-3.png);background-size:contain;"></div>',
		    size: N.Size(40, 40),
		    anchor: N.Point(20, 20)
		};
		var htmlMarker4 = {
		    content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(image/map/cluster-marker-4.png);background-size:contain;"></div>',
		    size: N.Size(40, 40),
		    anchor: N.Point(20, 20)
		};
		var htmlMarker5 = {
			content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(image/map/cluster-marker-5.png);background-size:contain;"></div>',
		    size: N.Size(40, 40),
		    anchor: N.Point(20, 20)
		};
		
		var markerClustering = new MarkerClustering({
	        minClusterSize: 2,
	        maxZoom: 8,
	        map: map,
	        markers: markers,
	        disableClickZoom: false,
	        gridSize: 120,
	        icons: [htmlMarker1, htmlMarker2, htmlMarker3, htmlMarker4, htmlMarker5],
	        indexGenerator: [10, 100, 200, 500, 1000],
	        stylingFunction: function(clusterMarker, count) {
	            $(clusterMarker.getElement()).find('div:first-child').text(count);
	        }
	    });
	</script>

</body>
</html>