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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

<link rel="stylesheet" href="${contextPath}/resources/css/place/placeView.css">

</head>

<body>
	<jsp:include page="../common/header.jsp" />

	<div class="container-fluid placeMain" id="placeMain">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				
					<div class="row">
						<div class="col-md-12">
							<img class="d-block w-100 pt" alt="Carousel Bootstrap First" src="${contextPath}${firstFilePath}/${firstFileName}"/>
						</div>
					</div>
				
				
				
				<div class="row" id="PlaceHeader">
					<div class="col-md-8">
						<div class="view-header">
							<span>${place.placeTitle}</span> <span>별점 ${place.avgRating}</span>
								
							<c:if test="${!empty loginMember }">
			      		 	<c:choose>
			            <c:when test="${scrapFl == 0 }">
			               <img src="${contextPath}/resources/images/scrap11.png" class="scrap">
			            </c:when>
			         
			            <c:otherwise>
			              <img src="${contextPath}/resources/images/scrap22.png" class="scrap">
			            </c:otherwise>
			         </c:choose>
							</c:if>
							 
							 <br>
							<c:set var="loca" value="${fn:split(place.location,',')[1]}" />
							
							<span><b>${fn:split(loca,' ')[0]} - ${place.categoryName}</b></span> <br>
							<span>뷰 ${place.readCount}</span>
							<span>댓글 ${place.reviewCount}</span>
							<span>스크랩</span>
							<span id="favoriteCount">${place.favoriteCount}</span>
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
					<div class="col-md-12">
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
					<div class="col-md-12 placeContentArea">	
						<h3>${place.placeTitle}</h3><br>
						
						${place.placeContent }
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12 btnBox">	
						<a class="btn ehsheYellow"
								href="${contextPath}/place/placeList">목록으로</a>		
								
						<c:url var="updateUrl" value="${place.placeNo}/update" />
								
						<c:if
						test="${(loginMember != null) && (place.adminNo == loginMember.memberNo)}">
						<a href="${updateUrl}" class="btn ehsheYellow ml-1 mr-1">수정</a>
						<button id="deleteBtn" class="btn ehsheYellow">삭제</button>
					</c:if>		
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
	</div>

		

	<jsp:include page="../common/footer.jsp" />

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8adb912f319f193a5fe45f741e8466c&libraries=services"></script>
	<script>
		var lat = ${place.latitude};
		var lng = ${place.longitude};
		
		var mapWrapper = document.getElementById('mapWrapper'); //지도를 감싸고 있는 DIV태그

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapCenter = new kakao.maps.LatLng(lat , lng), // 지도의 가운데 좌표
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


<script>
	//스크랩 기능
  var scrapFl = ${scrapFl};
  var placeNo = ${place.placeNo};
  
  $(".scrap").on("click",function() {
     
	  var url;
     
     if(scrapFl == 0){
     	url = "insertScrap";
     }else{
     	url = "deleteScrap";
     }
     	
     
     $.ajax({
    	 url : url,
         data : {"placeNo" : placeNo},
         success : function(result){
            if(scrapFl == 0){
         	   scrapFl = 1;
               $(".scrap").attr("src", "${contextPath}/resources/images/scrap22.png");
            }else{
         	   scrapFl = 0;
               $(".scrap").attr("src", "${contextPath}/resources/images/scrap11.png");
            }
            
            selectFavoriteCount();
            
         },error : function(){
            console.log("즐겨찾기 실패");
         }
     })
     
  });
  
  // 즐겨찾기 개수 카운트
  function selectFavoriteCount(){
     $.ajax({
        url : "selectScrapCount",
        data : {"placeNo" : placeNo},
        success : function(favoriteCount){
           $("#favoriteCount").text(favoriteCount);
        },error : function(){
           console.log("좋아요 카운트 실패")
        }
     });
  }
</script>

</body>
</html>