<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
    // HTML 요소에서 JSON 데이터 불러오기
    var jsonData = JSON.parse(document.getElementById("pzInfo").getAttribute("data-json"));
    
	 // JSON 데이터를 사용하여 원하는 작업 수행
    var pzPlaceNameElement = document.getElementById("pzPlaceName");
    pzPlaceNameElement.textContent = jsonData.placeName;
    
    /* var pzExplainElement = document.getElementById("pzExplain");
    pzExplainElement.textContent = jsonData.explain; */
    
    var pzAddrElement = document.getElementById("pzAddr");
    pzAddrElement.textContent = jsonData.addr;
    
    var pzPhotoPathElement = document.getElementById("pzPhotoPath");
    pzPhotoPathElement.src = "image/" + jsonData.photoPath;
</script>
<div id="modalPZInfo">
<!-- 숨겨진 input 필드에 JSON 데이터 설정 -->
<input type="hidden" id="pzInfo" data-json="" />
	<div id="modalPZInfoWrapper">
	    <div id="modalPZInfoHeader">
	    <div style="width: 100%; height: 70px;">
		    <div style="height: 30%; display: flex; align-items: center; text-align: center;">
		        <h2 id="pzPlaceName" style="margin: 0 auto;"></h2>
		    </div>
		    <div style="height: 60%; display: flex; align-items: center; text-align: center;">
		         <font color="gray"><h3 id="pzAddr" style="margin: 0 auto;"></h3></font>
		    </div>
		</div>
		</div>
		<div id="pzInfoSideButton" 
		style="display: flex; 
    	justify-content: center; 
    	width: 260px;">
		<button id="pzNoticeList">목록보기</button>
		</div>
		<div id="modalPZInfoContent">
			<div id="pzPhotoContainer">
				<img id="pzPhotoPath">
			</div>
			<div id="pzSocialButtons">
				<button id="pzLikeButton">좋아요</button>
				<button id="pzInstagramButton">인스타그램</button>
			</div>
		</div>
	</div>
	<span id="closeModalPZInfo">&times;</span>
</div>