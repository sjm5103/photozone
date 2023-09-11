<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Hanna&display=swap">
<style>
 body{
  font-family: 'Hanna', sans-serif;
}
</style>
<!-- 카페메뉴보기 -->
<div id="modalCafeMenuInfo">
    <div id="modalCafeMenuInfoWrapper">
        <div id="modalCafeMenuHeader" class="flex-container">
	   	 	<h2 id="detailCafeName"></h4>
		    <div class="flex-row">
		        <h4 id="detailCafeOpen"></h4>
		    </div>
		    <div>
		    	<h3 id="detailCafeAddr"></h3>
		    </div>
		</div>
        <div id="modalCafeMenuInfoContent">
        	<table id="cafeMenuTable">
		   </table>
        </div>
    </div>
    <span id="closeModalCafeMenuInfo">&times;</span>
</div>
