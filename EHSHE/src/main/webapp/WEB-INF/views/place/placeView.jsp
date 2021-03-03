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
<title>EHSHE 데이트</title>
<script src="https://kit.fontawesome.com/5a7a3b1a34.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="${contextPath}/resources/css/place/placeView.css">


<style>

</style>
</head>

<body>
	<jsp:include page="../common/header.jsp" />

	<div class="container-fluid boardMain">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="carousel slide" id="carousel-258703">
					<ol class="carousel-indicators">
						<li data-slide-to="0" data-target="#carousel-258703"
							class="active"></li>
						<li data-slide-to="1" data-target="#carousel-258703"></li>
						<li data-slide-to="2" data-target="#carousel-258703"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" alt="Carousel Bootstrap First"
								src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg" />
							<div class="carousel-caption">
								<h4>First Thumbnail label</h4>
								<p></p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Second"
								src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg" />
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p></p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Third"
								src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg" />
							<div class="carousel-caption">
								<h4>Third Thumbnail label</h4>
								<p></p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carousel-258703"
						data-slide="prev"><span class="carousel-control-prev-icon"></span>
						<span class="sr-only">Previous</span></a> <a
						class="carousel-control-next" href="#carousel-258703"
						data-slide="next"><span class="carousel-control-next-icon"></span>
						<span class="sr-only">Next</span></a>
				</div>
				<div class="row">
					<div class="col-md-8">
						<div class="view-header">
							<span>${place.placeTitle}</span> <span>별점 4.7</span> <span>🔰
								즐겨찾기</span> <br>
							<c:set var="loca" value="${fn:split(place.location,',')[1]}" />
							
							<span>${fn:split(loca,' ')[0]} - ${place.categoryName}</span> <br>
							<span>뷰 ${place.readCount} 댓글 234 스크랩 312</span>
						</div>
						<div class="view-body menuTable">
							<table>
								<tr>
									<td>주소</td>
									<td>${fn:split(place.location,',')[1]}</td>
								</tr>
								<tr>
									<td></td>
									<td>${fn:split(place.location,',')[2]}</td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td>${place.phone}</td>
								</tr>
								<tr>
									<td>분류</td>
									<td>${place.categoryName}</td>
								</tr>
								<tr>
									<td>영업시간</td>
									<td>${place.businessHours}</td>
								</tr>
								<tr>
									<td>가격대</td>
									<td>${place.priceRange}</td>
								</tr>
								<tr>
									<td>주차</td>
									<td>${place.parking}</td>
								</tr>
								<tr>
									<td>휴일</td>
									<td>${place.holiday}</td>
								</tr>
								<tr>
									<td>${place.enroll}</td>
									<td>${place.enrollContents}</td>
								</tr>
							</table>

						</div>

						<!-- <div class="map_wrap">
							<div id="map"
								style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
						</div> -->
						
						
						
					</div>
					<div class="col-md-4"></div>
				</div>
				
				<c:set var="la" value="${place.latitude}"/>
				<c:set var="lo" value="${place.longitude}"/>
				
				<div class="row">
					<div class="col-md-12 replyArea">
							<div class="map_wrap">
						    <div id="mapWrapper" style="width:50%;height:300px;float:left">
						        <div id="map" style="width:100%;height:100%"></div> <!-- 지도를 표시할 div 입니다 -->
						    </div>
						    <div id="rvWrapper" style="width:50%;height:300px;float:left">
						        <div id="roadview" style="width:100%;height:100%"></div> <!-- 로드뷰를 표시할 div 입니다 -->
						    </div>
						</div>
					</div>
				</div>
					


				<div class="row">
					<div class="col-md-12 replyArea">
					
						<jsp:include page="placeReview.jsp"/>
					</div>
				</div>
				
			</div>
			<div class="col-md-2"></div>
		</div>

	<script>
		var lat11 = ${place.latitude};
		var lng11 = ${place.longitude};
	</script>

	<jsp:include page="../common/footer.jsp" />

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8adb912f319f193a5fe45f741e8466c&libraries=services"></script>
	<script>
		/* var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(${place.latitude}, ${place.longitude}), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${loca}', function(result, status) {
		
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
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${place.placeTitle}</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});     */
		
		
		var mapWrapper = document.getElementById('mapWrapper'); //지도를 감싸고 있는 DIV태그

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapCenter = new kakao.maps.LatLng(33.450422139819736 , 126.5709139924533), // 지도의 가운데 좌표
		    mapOption = {
		        center: mapCenter, // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		map.addOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW); //지도 위에 로드뷰 도로 올리기

		var rvContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
		var rv = new kakao.maps.Roadview(rvContainer); //로드뷰 객체
		var rvClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

		toggleRoadview(mapCenter);

		// 마커 이미지를 생성합니다.
		var markImage = new kakao.maps.MarkerImage(
		    'https://t1.daumcdn.net/localimg/localimages/07/2018/pc/roadview_minimap_wk_2018.png',
		    new kakao.maps.Size(26, 46),
		    {
		        // 스프라이트 이미지를 사용합니다.
		        // 스프라이트 이미지 전체의 크기를 지정하고
		        spriteSize: new kakao.maps.Size(1666, 168),
		        // 사용하고 싶은 영역의 좌상단 좌표를 입력합니다.
		        // background-position으로 지정하는 값이며 부호는 반대입니다.
		        spriteOrigin: new kakao.maps.Point(705, 114),
		        offset: new kakao.maps.Point(13, 46)
		    }
		);

		// 드래그가 가능한 마커를 생성합니다.
		var rvMarker = new kakao.maps.Marker({
		    image : markImage,
		    position: mapCenter,
		    draggable: true,
		    map: map
		});

		//마커에 dragend 이벤트를 할당합니다
		kakao.maps.event.addListener(rvMarker, 'dragend', function(mouseEvent) {
		    var position = rvMarker.getPosition(); //현재 마커가 놓인 자리의 좌표
		    toggleRoadview(position); //로드뷰를 토글합니다
		});

		//지도에 클릭 이벤트를 할당합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent){
		    
		    // 현재 클릭한 부분의 좌표를 리턴 
		    var position = mouseEvent.latLng; 

		    rvMarker.setPosition(position);
		    toggleRoadview(position); //로드뷰를 토글합니다
		});

		//로드뷰 toggle함수
		function toggleRoadview(position){

		    //전달받은 좌표(position)에 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄웁니다
		    rvClient.getNearestPanoId(position, 50, function(panoId) {
		        if (panoId === null) {
		            rvContainer.style.display = 'none'; //로드뷰를 넣은 컨테이너를 숨깁니다
		            mapWrapper.style.width = '100%';
		            map.relayout();
		        } else {
		            mapWrapper.style.width = '50%';
		            map.relayout(); //지도를 감싸고 있는 영역이 변경됨에 따라, 지도를 재배열합니다
		            rvContainer.style.display = 'block'; //로드뷰를 넣은 컨테이너를 보이게합니다
		            rv.setPanoId(panoId, position); //panoId를 통한 로드뷰 실행
		            rv.relayout(); //로드뷰를 감싸고 있는 영역이 변경됨에 따라, 로드뷰를 재배열합니다
		        }
		    });
		}
	
	// 게시글 삭제
	$("#deleteBtn").on("click", function(){
				if(confirm("게시글을 삭제하시겠습니까?")){
					location.href = "deleteAction/" + ${place.placeNo};
				}
	});
	
	
</script>


</body>
</html>