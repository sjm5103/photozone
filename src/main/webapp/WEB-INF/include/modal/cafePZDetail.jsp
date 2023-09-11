<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 카페PZ 디테일 모달 -->
<script>
$(document).ready(function() {
    $("#PZuserInsta").click(function() {
        // 현재 선택된 디테일에 해당하는 insta 값을 가져옴
        var cafePZDetailinsta = $("#cafePZDetailInsta").text();
        console.log("인스타찍었다");
        // 인스타그램 프로필 URL을 생성
        var instaProfileUrl = "https://www.instagram.com/" + cafePZDetailinsta;
        console.log(instaProfileUrl);
        // 새 창에서 인스타그램 프로필 페이지 열기
        window.open(instaProfileUrl, "_blank");
    });
    $("#deleteCafePZ").click(function() {
    	var unq = $("#cafePZUnq").val();
    	location = "/pz/deleteCafePZ.do?unq="+unq
    });
});
</script>
<div id="modalCafePZDetail">
	<div id="modalCafePZDetailWrapper">
		<div id="modalCafePZDetailHeader">
			<input type="hidden" id="cafePZUnq">
	        <div style="height:40%;" class="flex-row">
	        	<h2 id="cafePZDetailUserid"></h2>
	    	</div>
	    	<div style="height:40%;" class="flex-row">
	    		<img src="image/insta_icon.jpg" style="width: 20px; height: 20px; margin-top:20px;">
	    		<h3 id="cafePZDetailInsta"></h3>
	    		<div style="flex-grow: 1; text-align: right;">
			        <input type="button" id="deleteCafePZ" value="삭제">
			    </div>
    		</div>
		</div>	   	 
	    <div class="flex-row">
		    <div style="width:360px; height:400px; background-color:skyblue; display: flex; align-items: center; justify-content: center;">
		    	<img id="cafePZDetailImage" src="" alt="cafePZDetailImage" style="width:360px; height:400px;">
		    </div>
		</div>
		<div id="cafePZButtons" style="margin-top: 15px;">
			<button type="button" id="PZuserGood">좋아요</button>
			<button type="button" id="PZuserInsta">인스타그램</button>
		</div>
	</div>
	<span id="closeModalCafePZDetail">&times;</span>
</div>