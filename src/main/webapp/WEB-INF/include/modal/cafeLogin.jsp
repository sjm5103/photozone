<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="modalCafeLogin">
    <div id="modalCafeLoginWrapper">
    	<h2><b>로그인</b><small>(사업자)</small></h2>
        <div class="input-container">
		    <input type="text" id="loginCafeid" name="cafeid" class="input-field" placeholder="Enter ID" required>
		</div>
	    <div class="input-container">
		    <input type="password" id="loginCafePwd" name="pwd" class="input-field" placeholder="Password" required>
		</div>
     
        <button type="button" id="LoginCafeSubmit">로그인</button>
        <div id="loginCafeOptions">
            <label>
                <input type="checkbox" id="autoCafeLogin"> 자동로그인
            </label>
            <a href="#">아이디 찾기</a> /
            <a href="#">비밀번호 찾기</a>
        </div>
        
        <div id="goSignUp">
            <p>아직 계정이 없으신가요?</p>
            <button type="button" id="goSignUpButton4">회원가입</button>
        </div>
    </div>
    <span id="closeModalCafeLogin">&times;</span>
</div>
    