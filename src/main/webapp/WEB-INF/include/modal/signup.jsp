<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 회원가입약관모달 -->
<div id="modalAgree">
	<div id="modalAgreeWrapper">
		<textarea style = "width: 480px; height : 480px;" readonly id="chapter_1">
             <%@include file = "../condition1.jsp" %>
        </textarea>
	</div>
	<div id="AgreeChk">
		<input type="checkbox">동의합니다
	</div>
	<div id="goSignUpBox">
		<button type="button" id="goSignUpButton">회원가입버튼</button>
	</div>
	<span id="closeModalAgree">&times;</span>
</div>
	
<!-- 회원가입모달 -->
<div id="modalSignUp">
	<form id="signupForm">
		<div id="modalSignUpWrapper">
			<input type="hidden" id="signupIdCheck" value="false">
			<input type="hidden" id="signupNicknameCheck" value="false">
			<h2>회원가입</h2>
		    <p style="font-size: 12px; color: gray; margin-top: -10px;">사업자이신가요? <a href="#" id="cafeSignUpLink">여기</a>를 클릭하여 사업자 회원가입을 진행하세요.</p>
		    <label for="userId">아이디 </label>
		    <div class="input-with-button">
		        <input type="text" id="signupUserid" name="userid" placeholder="(6 ~ 12자로 입력해주세요.)" required minlength="6" maxlength="12">
		        <button type="button" id="signupIdCheckButton">중복확인</button>
		    </div>
		    
		    <label for="password">비밀번호 <span></span></label>
		    <input type="password" id="signupPwd" name="pwd" placeholder="(8 ~ 16자, 영문자, 숫자, 대문자로 입력해주세요.)" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,16}$">
		    
		    <label for="confirmPassword">비밀번호 확인</label>
		    <input type="password" id="signupConfirmPwd" name="confirmPassword" required>
		    
		    <label for="fullName">이름 <span></span></label>
		    <input type="text" id="signupName" name="username" placeholder="(성명을 입력하세요.)" required>
		    
		    <label for="nickname">닉네임</label>
		    <div class="input-with-button">
		        <input type="text" id="signupNickname" name="nickname" placeholder="(닉네임을 입력하세요.)"required>
		        <button type="button" id="signupNicknameCheckButton">중복확인</button>
		    </div>
		    
		    <label for="phoneNumber">연락처</label>
		    <div class="phone-input">
		        <input type="tel" id="signupPhoneNumber1" name="phoneNumber1" pattern="(010|011)" required>
		        <span>-</span>
		        <input type="tel" id="signupPhoneNumber2" name="phoneNumber2" pattern="[0-9]{4}" required>
		        <span>-</span>
		        <input type="tel" id="signupPhoneNumber3" name="phoneNumber3" pattern="[0-9]{4}" required>
		    </div>
		    
		    <label for="email">이메일</label>
		    <div class="email-input">
		        <input type="text" id="sigupEmailId" name="emailId" style="width:30%;" required>
		        <span> @&nbsp;</span>
		        <input type="text" id="sigupEmailDomain" name="emailDomain" class="input-field"
                placeholder="이메일입력" style="width: 30%;" required>
		        
		        <select id="emailCustomDomain" name="emailCustomDomain" style="width: 25%;" required onchange="handleDomainSelect()">
                    <option value="custom">직접 입력</option>
                    <option value="naver.com">naver.com</option>
                    <option value="daum.net">daum.net</option>
                    <option value="gmail.com">gmail.com</option>
                </select>
            </div>
            <button type="button" id="signUpSubmit">회원가입</button>
        </div>
    </form>
    <span id="closeModalSignUp">&times;</span>
</div>
<script>
function handleDomainSelect() {
    var emailDomainInput = document.getElementById("sigupEmailDomain");
    var selectElement = document.getElementById("emailCustomDomain");

    if (selectElement.value === "custom") {
    	emailDomainInput.removeAttribute("disabled");
    	emailDomainInput.value = '';
    	emailDomainInput.focus();
    } else {
    	emailDomainInput.setAttribute("disabled", "disabled");
    	emailDomainInput.value = selectElement.value;
    }
    console.log("Selected value:", emailDomainInput.value);
}
</script>