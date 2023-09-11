<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="modalInsengNoticeWrite">
	<div id="modalInsengNoticeWriteWrapper">
		<div id="modalInsengNoticeWriteHeader">
			<h2>게시물 작성</h2>
		</div>
		<div id="insengPhotoTable" style="margin-left: auto; margin-right: auto;">
		사진등록
		</div>
		<div class="insengNoticeWriteContent">
			<div>
				주소 <input type="text" placeholder="주소를 검색해주세요"><button id="cafeNoticeWriteLocation">위치찾기</button>
			</div>
			<div>
				장소 <input type="text" placeholder="장소명을 선택해주세요"><button id="cafeNoticeWriteCafe">장소찾기</button>
			</div>		
			<div>
				제목 <input type="text" placeholder="-">		
			</div>
			<div>
				내용 <input type="text" placeholder="-">		
			</div>
			<div id="insengNoticeWriteSubmit">
				<button id="insengNoticeWriteSubmitButton">등록하기</button>
			</div>
		</div>
	</div>
	<span id="closeModalInsengNoticeWrite">&times;</span>
</div>