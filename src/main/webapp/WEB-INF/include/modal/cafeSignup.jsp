<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="modalCafeSignUp">
	<form id="cafeSignupForm" method = "post" enctype="multipart/form-data">
    <!-- 사업자 회원가입 내용 -->
    <div id="modalCafeSignUpWrapper">
   		<input type="hidden" id="cafeSignupIdCheck" value="false">
		<input type="hidden" id="signupCafenameCheck" value="false">
	    <h2>회원가입_<small>(사업자)</small></h2>
        <label for="cafeId">아이디 </label>
        <div class="input-with-button">
            <input type="text" id="signupCafeid" name=cafeid placeholder="(6 ~ 12자로 입력해주세요.)" required minlength="6" maxlength="12">
            <button type="button" id="cafeSignupIdCheckButton">중복확인</button>
        </div>
        
        <label for="password">비밀번호 <span></span></label>
        <input type="password" id="cafePwd" name="pwd" placeholder="(8 ~ 16자, 영문자, 숫자, 대문자로 입력해주세요.)" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,16}$">
        
        <label for="confirmPassword">비밀번호 확인</label>
        <input type="password" id="cafeConfirmPwd" name="confirmPassword" required>
        
   		<label for="cafeName">카페명</label>
	    <div class="input-with-button">
	        <input type="text" id="signupCafeName" name="cafename" placeholder="카페명을 입력하세요."required>
	        <button type="button" id="signupCafenameCheckButton">중복확인</button>
	    </div>
	
        <label for="address">주소</label>
        <input type="text" id="cafeAddr" name="addr" placeholder="주소를 입력하세요." required>
        
        <label for="phoneNumber">연락처</label>
        <div class="phone-input">
            <input type="tel" id="cafePhoneNumber1" name="phoneNumber1" pattern="(010|011)" required>
            <span>-</span>
            <input type="tel" id="cafePhoneNumber2" name="phoneNumber2" pattern="[0-9]{4}" required>
            <span>-</span>
            <input type="tel" id="cafePhoneNumber3" name="phoneNumber3" pattern="[0-9]{4}" required>
        </div>
         
        <label for="instagram">인스타그램</label>
        <input type="text" id="instagram" name="insta" placeholder="인스타그램 계정을 입력하세요." required>
		
	        <label for="cafeMainPhoto">카페 메인 사진</label>
	         <input type="file" id="cafeMainPhoto" name="photo">
		
	        <label for="cafeLicense">사업자 등록증</label>
	         <input type="file" id="cafeLicense" name="certify">
    		<button type="button" id="goSignUpButton3">회원가입</button>
	</div>
	</form>
    <span id="closeModalCafeSignUp">&times;</span>
</div>