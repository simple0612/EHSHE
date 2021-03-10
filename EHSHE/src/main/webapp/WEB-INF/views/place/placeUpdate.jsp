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
<title>관리자 장소 수정</title>
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
	href="${contextPath}/resources/css/place/insertPlace2.css">

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
	<script src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
	<script src="${contextPath}/resources/summernote/js/mySummernote2.js"></script>

	<div class="container-fluid" id="placeMain">
		<form action="updateAction" name="updateAction"
			enctype="multipart/form-data" method="post" role="form"
			onsubmit="return validate();">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">

					<div class="row updateP">
						<div class="col-md-12">
							<h4>장소 수정</h4>
						</div>
					</div>
					
					<div class="col-md-10">
						<table class="table1">
							<tbody>
							
								<tr class="name">
									<td>장소 이름</td>
									<td colspan="2"><input class="form-control mr-sm-2" type="text"
									name="placeTitle" id="placeTitle" value="${place.placeTitle}"/></td>
								</tr>
								
								<tr class="thumbnail">
									<td>이미지</td>
									<td colspan="2">
										<div class="placeImg" id="titleImgArea">
											<img id="titleImg" width="200" height="120">
										</div>

										<div id="fileArea" style="margin-top: 4px;">
											<input type="file" id="img0" name="image" onchange="LoadImg(this, 0)"> 
										</div>
									</td>
								</tr>
								
								<tr class="addr">
									<td >주소</td>
									<td>
										<input type="text" id="post" name="post" 
										class="form-control postcodify_postcode5" value="${fn:split(place.location,',')[0]}" required>
									</td>
									<td>
										<button type="button" class="btn btn-secondary btn-sm" id="postcodify_search_button">검색</button>
									</td>
								</tr>
								<tr class="addr1">
									<td>도로명 주소</td>
									<td colspan="2">
										<input type="text" class="form-control postcodify_address" name="address1" id="address1"
										value="${fn:split(place.location,',')[1]}">
									</td>
								</tr>
								<tr class="addr2">
									<td>상세주소</td>
									<td colspan="2">
										<input type="text" class="form-control postcodify_details" name="address2" id="address2"
										value="${fn:split(place.location,',')[2]}">
									</td>
								</tr>
								<tr>
									<td>분류</td>
									<td colspan="2"><input class="form-control mr-sm-2" type="text" name="categoryName" id="categoryName"
									value="${place.categoryName}"/></td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td colspan="2"><input class="form-control mr-sm-2" type="text" name="phone" id="phone"
									value="${place.phone}"/></td>
								</tr>
								<tr>
									<td>영업시간</td>
									<td colspan="2"><input class="form-control mr-sm-2" type="text" name="businessHours" id="businessHours"
									value="${place.businessHours}"/></td>
								</tr>
								<tr>
									<td>가격대</td>
									<td colspan="2"><input class="form-control mr-sm-2" type="text" name="priceRange" id="priceRange"
									value="${place.priceRange}"/></td>
								</tr>
								<tr>
									<td>주차</td>
									<td colspan="2"><input class="form-control mr-sm-2" type="text" name="parking" id="parking"
									value="${place.parking}"/></td>
								</tr>
								<tr>
									<td>휴일</td>
									<td colspan="2"><input class="form-control mr-sm-2" type="text" name="holiday" id="holiday"
									value="${place.holiday}"/></td>
								</tr>
								<tr>
									<td><input class="form-control mr-sm-2" type="text" name="enroll" id="enroll"
									value="${place.enroll}"/></td>
									<td colspan="2"><input class="form-control mr-sm-2" type="text" name="enrollContents" id="enrollContents"
									value="${place.enrollContents}"/></td>
								</tr>
								
								<tr>
									<td>위치</td>
									<td colspan="2">
										<input type="hidden" id="lat" name="latitude" value="${place.latitude}" required>
										<input type="hidden" id="lng" name="longitude" value="${place.longitude}" required>
										<div class="map_wrap">
										<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
											<div class="Addr">
												<span class="title">지도중심기준 행정동 주소정보</span>
												<span id="centerAddr"></span>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-2"></div>
					
					
					
				<div class="row updateContentArea">
					<div class="col-md-12">
						<h5>소개</h5>
						<textarea class="form-control" id="summernote" name="placeContent" rows="10" style="resize: none;">
						${place.placeContent}
						</textarea>
					</div>
				</div>
				
				<div class="row updateBtnArea">
					<div class="col-md-12">
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
		var lat = ${place.latitude}
		var lng = ${place.longitude}
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
			level : 4
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		infowindow = new kakao.maps.InfoWindow({
			zindex : 1
		}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 지도에 마커를 표시합니다
		marker.setMap(map);

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			searchDetailAddrFromCoords(mouseEvent.latLng, function(result,
					status) {
				if (status === kakao.maps.services.Status.OK) {
					var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
							+ result[0].road_address.address_name + '</div>'
							: '';
					detailAddr += '<div>지번 주소 : '
							+ result[0].address.address_name + '</div>';

					var content = '<div class="bAddr">'
							+ '<span class="title">법정동 주소정보</span>'
							+ detailAddr + '</div>';

					// 마커를 클릭한 위치에 표시합니다 
					marker.setPosition(mouseEvent.latLng);
					marker.setMap(map);

					// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
					infowindow.setContent(content);
					infowindow.open(map, marker);

					$("#lat").val(mouseEvent.latLng.getLat());
					$("#lng").val(mouseEvent.latLng.getLng());
				}
			});
		});

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
					callback);
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');

				for (var i = 0; i < result.length; i++) {
					// 행정동의 region_type 값은 'H' 이므로
					if (result[i].region_type === 'H') {
						infoDiv.innerHTML = result[i].address_name;
						break;
					}
				}
			}
		}
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
		// 이미지 배치
		<c:forEach var="at" items="${attachmentList}">
			$(".placeImg").eq(${at.fileLevel}).children("img").attr("src", "${contextPath}${at.filePath}/${at.fileName}");
		</c:forEach>
		
		// 이미지 영역을 클릭해도 파일선택을 할수 있도록 onclick 이벤트롤 작성
		$(function() {
			$("#titleImg").on("click", function() {
				$("#img0").click();
			});
	
		});

		// 업로드된 파일을 img 태그에 보여지게하는 함수
		function LoadImg(value, num) {
			if (value.files && value.files[0]) { // 해당 요소에 업로드된 파일이 있을 경우
				var reader = new FileReader();
				reader.readAsDataURL(value.files[0]);
				reader.onload = function(e) {
					$(".placeImg").eq(num).children("img").attr("src",
							e.target.result);
				}
			}
		}
		
		// 유효성 검사
		function validate() {
			if ($("#placeTitle").val().trim().length == 0) {
				alert("제목을 입력해 주세요.");
				$("#placeTitle").focus();
				return false;
			}

			if ($("#summernote").val().trim().length == 0) {
				alert("내용을 입력해 주세요.");
				$("#summernote").focus();
				return false;
			}

			if ($("#lat").val().trim().length == 0) {
				alert("좌표를 입력해 주세요.");
				$("#lat").focus();
				return false;
			}

			$location = $("<input>", {
				type : "hidden",
				name : "location",
				value : $("#post").val() + "," + $("#address1").val() + ","
						+ $("#address2").val()
			});
			$("form[name='updateAction']").append($location);

		}
	</script>

</body>
</html>