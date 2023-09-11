<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="modalMyCafePage">
	<form id="cafeMypageForm">
		<div id="modalMyCafePageWrapper">
		    <h2>마이페이지<small>_사업자</small></h2>
				<input type="hidden" id="mypageCafenameCheck" value="false">
				<input type="hidden" id="mypageBeforeCafename" value="${cafeVo.cafename}">
			    <input type="hidden" name="cafeid" value="${cafeVo.cafeid}">
			    <label for="cafeId">아이디 </label>
			    <div class="input-with-button">
			        <input type="text" id="mypageCafeid" value="${cafeVo.cafeid}" disabled>
			    </div>
			    
			    <label for="password">현재 비밀번호<span></span></label>
			    <input type="password" id="mypagePwd" name="pwd" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,16}$">
			    
			    <label for="password">변경 비밀번호<span></span></label>
			    <input type="password" id="mypageChangePwd" name="changePwd" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,16}$">

			    <label for="nickname">카페이름</label>
			    <div class="input-with-button">
			        <input type="text" id="mypageCafename" name="cafename" value="${cafeVo.cafename}" required>
			        <button type="button" id="mypageCafenameCheckButton">중복확인</button>
			    </div>

			    <label for="adress">주소 <span></span></label>
			    <input type="text" id="cafeAddr" name="addr" value="${cafeVo.addr}" required>
			    
			    <label for="phoneNumber">연락처</label>
			    <div class="phone-input">
			        <input type="tel" id="mypagePhoneNumber1" name="phoneNumber1" pattern="(010|011)" value="${cafeVo.phoneNumber1}" required>
			        <span>-</span>
			        <input type="tel" id="mypagePhoneNumber2" name="phoneNumber2" pattern="[0-9]{4}" value="${cafeVo.phoneNumber2}" required>
			        <span>-</span>
			        <input type="tel" id="mypagePhoneNumber3" name="phoneNumber3" pattern="[0-9]{4}" value="${cafeVo.phoneNumber3}" required>
			    </div>
			    
			    <label for="instagram">인스타 <span></span></label>
			    <input type="text" id="mypageInsta" name="insta" value="${cafeVo.insta}" required>
		    <div id="cafeMyPageButton">
		    	<button type="button" id="cafeMenuRegister">메뉴등록</button>
		    	<button type="button" id="cafeModify">수정하기</button>
	    	</div>
	    </div>
	    <span id="closeModalMyCafePage">&times;</span>
    </form>
</div>