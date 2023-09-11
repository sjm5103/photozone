<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.checkbox label {
    margin-right: 8px; /* 레이블과 체크박스 사이의 간격을 설정합니다. */
}
</style>
<div id="modalLocation">
	<form id="addPlaceForm">
		<div id="modalLocationWrapper">
			<h2>위치추가하기</h2>
	        <p>위치추가에 응해주셔서 진심으로 감사합니다!</p>
	        <p>개인 신상 정보 및 타인의 신상 정보 등 민감한 정보를 신청할 경우 <br>게시물 삭제 및 활동 정지 처리 될 수 있으며 형법 제 307조 명예훼손,<br>정보통신망법 제 70조 등에 의거해 처벌 받으실 수 있음을 알려드립니다.</p>
	        <p>자택 등 민감한 정보를 내포한 위치 추가는 불가능 하며, (경산 능소화 <br>나무 집) 과 같은 명소의 경우 해당 사실을 확인 할 수 있도록 출처와 함께 신청해주세요.</p>
	    	<form>
	    	<input type="hidden" name="userid" value="${userVo.userid}">
	        	<label for="address">주소</label>
				<input type="text" id="address" name="addr" required>
				
				<label for="placeName">장소명</label>
				<input type="text" id="placeName" name="placeName">
				
				<label for="photo">사진</label>
				<input type="file" id="photo" name="photo">
				
				<label for="description">부가설명</label>
				<textarea id="explain" name="explain"></textarea>
				
				<label for="source">출처</label>
				<input type="url" id="source" name="source" placeholder="https://">
				
				<div class="checkbox" style="display: flex; align-items: left; margin-top:10px;">
				    <label for="confirm">위 내용을 충분히 읽고 인지하였으며, 상기 내용을 제보합니다.</label>
				    <input type="checkbox" id="confirm" style="margin-right:40px; margin-top:5px;" required >
				</div>
				
				<div class="buttons">
				    <button type="submit" id="addPlace">신청</button>
				    <button type="button" id="locationCancelButton">취소</button>
				</div>
	    	</form>
		</div>
		<span id="closeModalLocation">&times;</span>
	</form>
</div>