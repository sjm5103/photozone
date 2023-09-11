<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Hanna&display=swap">
<style>
#modalCafeInfoHeader {
    font-family: 'Hanna', sans-serif;
}
</style>
<script>
    // HTML 요소에서 JSON 데이터 불러오기
    var jsonData = JSON.parse(document.getElementById("cafeInfo").getAttribute("data-json"));
    
	 // JSON 데이터를 사용하여 원하는 작업 수행
    var cafeNameElement = document.getElementById("cafeName");
    cafeNameElement.textContent = jsonData.cafename;
    
    var cafeAddrElement = document.getElementById("cafeAddress");
    cafeAddrElement.textContent = jsonData.addr;
    
    var cafePhotoPathElement = document.getElementById("cafePhotoPath");
    cafePhotoPathElement.src = "image/" + jsonData.cafePhotoPath;
</script>
<div id="modalCafeInfo">
<!-- 숨겨진 input 필드에 JSON 데이터 설정 -->
<input type="hidden" id="cafeInfo" data-json="" />
	<div id="modalCafeInfoWrapper">
	    <div id="modalCafeInfoHeader">
		    <div style="width: 100%; height: 90px;">
			    <div style="height: 40%; display: flex; align-items: center; text-align: center;">
			        <h2 id="cafeName" style="margin: 0 auto;"></h2>
			    </div>
			    <div style="height: 40%; display: flex; align-items: center; text-align: center;">
			        <font color="gray"><h3 id="cafeAddress" style="margin: 0 auto;"></h3></font>
			    </div>
			</div>
		</div>
		<div id="modalCafeInfoContent">
			<img id="cafePhotoPath">
		</div>
		<div id="cafeInfoSideButton" 
		style="display: flex; 
    	justify-content: center; 
    	width: 260px; margin-top:10px;">
    	<input type="hidden" id="cafeAddrInfo">
		<button id="cafePZListButton">목록보기</button>
		<button id="cafeMenuButton">메뉴보기</button>
		</div>
	</div>
	<span id="closeModalCafeInfo">&times;</span>
</div>