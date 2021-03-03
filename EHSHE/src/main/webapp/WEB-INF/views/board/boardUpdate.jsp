<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextPath"
	value="${pageContext.servletContext.contextPath}" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>나만의 장소 수정</title>
<!-- summernote 사용 시 필요한 css 파일 추가 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="${contextPath}/resources/summernote/css/summernote-lite.css">

<link rel="stylesheet"
	href="${contextPath}/resources/css/board/insertBoard.css">

<style>
.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>

</head>

<body>
	<jsp:include page="../common/header.jsp" />

	<!-- summernote 사용 시 필요한 js 파일 추가 -->
	<script src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
	<script
		src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
	<script src="${contextPath}/resources/summernote/js/mySummernote.js"></script>

	<div class="container-fluid boardMain">
		<form action="updateAction" name="updateAction"
			enctype="multipart/form-data" method="post" role="form"
			onsubmit="return validate();">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-12">
							<h4>나만의 장소 수정</h4>
						</div>
					</div>
					<div class="row tableArea">
						<div class="col-md-9">
							<table class="table1">
								<tr class="name">
									<td>장소명</td>
									<td><input class="form-control" type="text"
										name="boardTitle" id="placeName" value="${board.boardTitle }"
										required></td>
								</tr>
								<tr>
									<td>종류</td>
									<td><input class="form-control" type="text"
										name="categoryName" id="categoryName"
										value="${board.categoryName }" required></td>
								</tr>
								<tr class="thumbnail">
									<td>이미지</td>
									<td>
										<div class="boardImg" id="titleImgArea">
											<img id="titleImg" width="200" height="120">
										</div>

										<div id="fileArea" style="margin-top: 4px;">
											<input type="file" id="img0" name="image"
												onchange="LoadImg(this, 0)" required>
										</div>
									</td>
									<td></td>
								</tr>
								<tr class="addr">
									<td>주소</td>
									<td><input type="text" id="post" name="post"
										class="form-control postcodify_postcode5" required></td>
									<td>
										<button type="button" class="btn btn-secondary btn-sm"
											id="postcodify_search_button">검색</button>
									</td>
								</tr>
								<tr class="addr1">
									<td>도로명 주소</td>
									<td colspan="2"><input type="text"
										class="form-control postcodify_address" name="address1"
										id="address1"></td>
								</tr>
								<tr class="addr2">
									<td>상세주소</td>
									<td colspan="2"><input type="text"
										class="form-control postcodify_details" name="address2"
										id="address2"></td>
								</tr>
								<tr>
									<td>위치</td>
									<td colspan="2"><input type="hidden" id="lat"
										name="latitude" required> <input type="hidden" id="lng"
										name="longitude" required>
										<div class="map_wrap">
											<div id="map"
												style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
											<div class="Addr">
												<span class="title">지도중심기준 행정동 주소정보</span> <span
													id="centerAddr"></span>
											</div>
											<div id="toggle">
											 	<fieldset>
													<input type="radio" name="chk_info" value="autoLoc" id="autoLoc" checked="checked">
													<label for="kraken">주소로 좌표 지정</label>
													<input type="radio" name="chk_info" value="clickLoc" id="clickLoc">
													<label for="kraken">직접 좌표 지정</label>
												</fieldset>
											</div>
										</div></td>
								</tr>
							</table>
						</div>
						<div class="col-md-3"></div>
					</div>
					<div class="row introduceArea">
						<div class="col-md-12">
							<h5>소개</h5>
							<textarea class="form-control" id="summernote"
								name="boardContent" rows="10" style="resize: none;">${board.boardContent }</textarea>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 buttonArea">
							<button class="btn btn-secondary insert-place" type="submit">수정</button>
							<a class="btn btn-secondary insert-place"
								href="${sessionScope.returnListURL}">취소</a>
						</div>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</form>
	</div>

	<jsp:include page="../common/footer.jsp" />

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8adb912f319f193a5fe45f741e8466c&libraries=services"></script>
	<script>
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(${board.latitude}, ${board.longitude}), // 지도의 중심좌표
	        level: 4 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	
    $("#address2").focus(function() {
	    
    	var here = $("#address1").val();
    	var pTitle = $("#placeName").val();
    	
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(here, function(result, status) {
		
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
		
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
		
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + pTitle + '</div>'
			        });
			        infowindow.open(map, marker);
		
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});
			
   	});
	
</script>

	<!-- 주소 api를 쓰기위한 jQeury Postcodify 로딩 -->
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
	// 주소 api
	$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
	});
</script>

	<script>		

	// 이미지 영역을 클릭해도 파일선택을 할수 있도록 onclick 이벤트롤 작성
	$(function(){
			$("#titleImg").on("click", function(){ 
				$("#img0").click();
			});
			
		});

		// 업로드된 파일을 img 태그에 보여지게하는 함수
		function LoadImg(value, num) {
			if(value.files && value.files[0]){ // 해당 요소에 업로드된 파일이 있을 경우
				var reader = new FileReader();
				reader.readAsDataURL(value.files[0]);
				reader.onload = function(e){
					$(".boardImg").eq(num).children("img").attr("src", e.target.result);
   			   	}
			}
		}
		
		// 유효성 검사
		function validate() {
			if ($("#placeName").val().trim().length == 0) {
				alert("제목을 입력해 주세요.");
				$("#placeName").focus();
				return false;
			}

			if ($("#summernote").val().trim().length == 0) {
				alert("내용을 입력해 주세요.");
				$("#summernote").focus();
				return false;
			}
			
			$location = $("<input>", {type : "hidden", name : "location",
				value : $("#post").val() + "," + $("#address1").val() + "," + $("#address2").val()
			});
		
			$("form[name='updateAction']").append($location);
			
		}
		
</script>

</body>
</html>