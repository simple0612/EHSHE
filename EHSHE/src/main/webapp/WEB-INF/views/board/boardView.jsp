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
<title>나만의 장소</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="${contextPath}/resources/css/board/boardView.css">


</head>

<style>
.markerImg {
	width: 148px;
	height: 85px;
}

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

<body>
	<jsp:include page="../common/header.jsp" />

	<div class="container-fluid" id="boardMain">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-12 h-boardView">
							<img src="${contextPath}${firstFilePath}/${firstFileName}">
							<div class="h-textArea">
								<h3>${board.boardTitle}</h3>
								<h5>${board.categoryName}</h5>
								<c:set var="loca" value="${fn:split(board.location,',')[1]}" />
								<h4>${fn:split(loca,' ')[0]} ${fn:split(loca,' ')[1]}</h4>
								
								<div class="iLike">
								<c:if test="${(!empty loginMember ) && (board.memberNo != loginMember.memberNo)}">
			       			<c:choose>
			            <c:when test="${likeFl == 0 }">
			               <img src="${contextPath}/resources/pImages/h2.png" class="like">
			               <br>
			     					<span id="likeFl">좋아요 하기</span>
			            </c:when>
			         
			            <c:otherwise>
			              <img src="${contextPath}/resources/pImages/h1.png" class="like">
			              <br>
			     					<span id="likeFl">좋아요 취소</span>
			            </c:otherwise>
			         </c:choose>
							</c:if>
							</div>
							
							</div>
					</div>
				</div>
							

				


				<div class="row subInfoArea">
					<div class="col-md-12 subInfo">
						
					
						<span>작성자 : ${fn:substring(board.memberId,0,2)}****</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
						<fmt:formatDate var="createDate" value="${board.boardCreateDate }"
							pattern="yyyy-MM-dd" />
						<span>작성일 : ${createDate}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
					</div>
				</div>


				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<div class="content-area">
						<% pageContext.setAttribute("newLine", "\n"); %>
						${fn:replace(board.boardContent, newLine, "<br>")}
						</div>
						<div class="map_wrap">
							<div id="map"
								style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
							<div class="hAddr">
								<span class="title">지도중심기준 행정동 주소정보</span> <span id="centerAddr"></span>
							</div>
						</div>
					</div>

					<div class="col-md-1"></div>
				</div>

				<div class="row">
					<div class="col-md-12 btnBox">
						<div class="">

							<c:if test="${empty sessionScope.returnListURL}">
								<c:set var="returnListURL" value="../board/boardList" scope="session" />
							</c:if>
							<a class="btn ehsheYellow"
								href="${sessionScope.returnListURL}">목록으로</a>					
							<!-- href="../board/boardList">목록으로</a> -->

							<c:url var="updateUrl" value="${board.boardNo}/update" />

							<!-- 로그인된 회원이 글 작성자인 경우 -->
							<c:if
								test="${(loginMember != null) && (board.memberNo == loginMember.memberNo)}">
								<button id="deleteBtn" class="btn ehsheYellow">삭제</button>
								<a href="${updateUrl}" class="btn ehsheYellow ml-1 mr-1">수정</a>
							</c:if>

						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12 replyArea">
						<jsp:include page="reply.jsp"/>
					</div>
				</div>
				
			</div>
			<div class="col-md-2"></div>
		</div>
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
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(${board.latitude}, ${board.longitude}); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
	var iwContent = 
		'<div><img class="markerImg" src="${contextPath}${firstFilePath}/${firstFileName}"/></div><div style="padding:5px;text-align:center;">${board.boardTitle}</div>'; 
		
	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    content : iwContent
	});

	// 마커에 마우스오버 이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'mouseover', function() {
	  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
	    infowindow.open(map, marker);
	});

	// 마커에 마우스아웃 이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'mouseout', function() {
	    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
	    infowindow.close();
	});
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	
	function searchAddrFromCoords(coords, callback) {
	    // 좌표로 행정동 주소 정보를 요청합니다
	    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	}
	
	function searchDetailAddrFromCoords(coords, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
	
	// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        var infoDiv = document.getElementById('centerAddr');
	
	        for(var i = 0; i < result.length; i++) {
	            // 행정동의 region_type 값은 'H' 이므로
	            if (result[i].region_type === 'H') {
	                infoDiv.innerHTML = result[i].address_name;
	                break;
	            }
	        }
	    }    
	}
	
	// 게시글 삭제
	$("#deleteBtn").on("click", function(){
				if(confirm("게시글을 삭제하시겠습니까?")){
					location.href = "deleteAction/" + ${board.boardNo};
				}
	});
	
</script>


   <script>
      var likeFl = ${likeFl}; // 좋아요 여부 0/1
      var boardNo = ${board.boardNo}; // 게시글 번호
   
      
      // 좋아요 기능
      $(".like").click(function() {
         
         var url;
         
         if(likeFl == 0){
         	url = "insertLike";
         }else{
         	url = "deleteLike";
         }
         	
         $.ajax({
            url : url,
            data : {"boardNo" : boardNo},
            success : function(result){
               // 좋아요 여부 상태 변경
               if(likeFl == 0){
                  likeFl = 1;
                  $(".like").attr("src", "${contextPath}/resources/pImages/h1.png");
                  $("#likeFl").text("좋아요 취소");
               }
               else{
                  likeFl = 0;
                  $(".like").attr("src", "${contextPath}/resources/pImages/h2.png");
                  $("#likeFl").text("좋아요 하기");
               }
               
               selectLikeCount();
            },error : function(){
               console.log("좋아요 실패")
            }
         });

      });
      
      /* // 좋아요 개수 카운트
      function selectLikeCount(){
         $.ajax({
            url : "selectLikeCount",
            data : {"boardNo" : boardNo},
            success : function(likeCount){
               $("#likeCount").text(likeCount);
            },error : function(){
               console.log("좋아요 카운트 실패")
            }
         });
      } */
   </script>



</body>
</html>