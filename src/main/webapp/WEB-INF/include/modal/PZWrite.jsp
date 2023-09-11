<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
$(document).ready(function(){
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                $('#PZPhotoTable').css('background-image', 'url(' + e.target.result + ')');
            }

            reader.readAsDataURL(input.files[0]); // convert to base64 string
        }
    }

    $("#pzPhoto").change(function() {
        readURL(this);
    });
});
</script> 
    
<div id="modalPZWrite">
	<form id="pzWriteForm">
	<div id="modalPZWriteWrapper">
		<div id="modalPZWriteHeader">
			<h2>게시물 작성</h2>
		</div>
		<div class="PZWriteContent">
	      <div id="PZPhotoTable" style="width: 300px; height: 400px; background-color: lightgray; text-align: center; display: flex; flex-direction: column; justify-content: center;">
	         <label for="pzPhoto">사진등록</label>
	            <input type="file" id="pzPhoto" name="photo" style="margin: 0 auto;">
	      </div>
		    <input type="hidden" name="userid" value="${userVo.userid}">
			<input type="hidden" name="nickname" value="${userVo.nickname}">
			<input type="hidden" name="insta" value="${userVo.insta}">
			<input type="hidden" name="addr" id="pzWriteAddr">
         	<input type="hidden" name="placename" id="pzWritePlacename">
			<div id="PZWriteSubmit">
				<button id="PZNoticeWriteSubmitButton">등록하기</button>
			</div>
		</div>
	</div>
	</form>
	<span id="closeModalPZWrite">&times;</span>
</div>