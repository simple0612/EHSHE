<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>EHSHE 데이트</title>

<script src="https://kit.fontawesome.com/5a7a3b1a34.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

<link rel="stylesheet" href="${contextPath}/resources/css/place/placeMain.css">

<style>
</style>
</head>

<body>
	<jsp:include page="../common/header.jsp" />

	<div class="container-fluid boardMain">
		<div class="row">
			<div class="col-md-2 sideheart">
					<img class="" src="https://media.giphy.com/media/PfFtibPKBbQrK/giphy.gif"style="width:230px;,height:200px;margin-bottom:1000px;margin-top:200px;"><br>
					<img alt="" src="https://media.giphy.com/media/3oriNO0p3Sn0itamg8/giphy.gif" style="width:230px;,height:200px;">
			</div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-12">
						<div class="carousel slide carousel-fade" id="carousel-722581" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-slide-to="0" data-target="#carousel-722581"></li>
								<li data-slide-to="1" data-target="#carousel-722581"></li>
								<li data-slide-to="2" data-target="#carousel-722581" class="active"> </li>
							</ol>
							<div class="carousel-inner">
								<div class="carousel-item" data-interval="4000">
									<img class="d-block w-100" alt="Carousel Bootstrap First"
										src="${contextPath}/resources/images/placeMain1.png" />
									<div class="carousel-caption">
									</div>
								</div>
								<div class="carousel-item" data-interval="4000">
									<img class="d-block w-100" alt="Carousel Bootstrap Second"
										src="${contextPath}/resources/images/placeMain2.png" />
									<div class="carousel-caption">
									</div>
								</div>
								<div class="carousel-item active" data-interval="4000">
									<img class="d-block w-100" alt="Carousel Bootstrap Third"
										src="${contextPath}/resources/images/placeMain3.png" />
									<div class="carousel-caption">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12 placeMain11 moveList"> 
						<img class="" src="${contextPath}/resources/pImages/placeMain11.png"/>
					</div>
				</div>
				<div class="row">
					<c:if test="${!empty rastList }">
						<c:forEach var="rPlace" items="${rastList}" varStatus="vs">
							<div class="col-md-6 width400">
								<div class="card">
									<div style="display: none;">${rPlace.placeNo}</div>
									<c:forEach var="th" items="${thList}">
											<c:if test="${th.placeNo == rPlace.placeNo}">
												<img class="card-img-top" src="${contextPath}${th.filePath}/${th.fileName}"/>
											</c:if>
									</c:forEach>
									<div class="card-block">
										<h6 class="card-title">
											<span>${rPlace.placeTitle}</span><span class="" href="#">별점 ${rPlace.avgRating}</span>
										</h6>
										<p class="card-text">
										<c:set var = "loca" value="${fn:split(rPlace.location,',')[1]}" />
											<span class="" href="#">${fn:split(loca,' ')[0]}</span> - <span class="" href="#">${rPlace.categoryName}</span>
											<span class="" href="#">뷰 ${rPlace.readCount} 댓글 ${rPlace.reviewCount}</span>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>

				<div class="row">
					<div class="col-md-12 placeMain11 moveList"> 
						<img class="" src="${contextPath}/resources/pImages/placeMain22.png"/>
					</div>
				</div>
				
				<div class="row">
					<c:if test="${!empty bestList }">
						<c:forEach var="bPlace" items="${bestList}" varStatus="vs">
							<div class="col-md-6 width400">
								<div class="card">
									<div style="display: none;">${bPlace.placeNo}</div>
									<c:forEach var="th" items="${thList}">
											<c:if test="${th.placeNo == bPlace.placeNo}">
												<img class="card-img-top" src="${contextPath}${th.filePath}/${th.fileName}"/>
											</c:if>
									</c:forEach>
									<div class="card-block">
										<h6 class="card-title">
											<span>${bPlace.placeTitle}</span><span class="" href="#">별점 ${bPlace.avgRating}</span>
										</h6>
										<p class="card-text">
										<c:set var = "loca" value="${fn:split(bPlace.location,',')[1]}" />
											<span class="" href="#">${fn:split(loca,' ')[0]}</span> - <span class="" href="#">${bPlace.categoryName}</span>
											<span class="" href="#">뷰${bPlace.readCount} 댓글 ${bPlace.reviewCount}</span>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
				
				<div class="row">
					<div class="col-md-12 placeMain11 moveList"> 
						<img class="" src="${contextPath}/resources/pImages/placeMain33.png"/>
					</div>
				</div>
				
				<div class="row">
					<c:if test="${!empty pList }">
						<c:forEach var="place" items="${pList}" varStatus="vs">
							<div class="col-md-6 width400">
								<div class="card">
									<div style="display: none;">${place.placeNo}</div>
									<c:forEach var="th" items="${thList}">
											<c:if test="${th.placeNo == place.placeNo}">
												<img class="card-img-top" src="${contextPath}${th.filePath}/${th.fileName}"/>
											</c:if>
									</c:forEach>
									<div class="card-block">
										<h6 class="card-title">
											<span>${place.placeTitle}</span><span class="" href="#">별점 ${place.avgRating}</span>
										</h6>
										<p class="card-text">
										<c:set var = "loca" value="${fn:split(place.location,',')[1]}" />
											<span class="" href="#">${fn:split(loca,' ')[0]}</span> - <span class="" href="#">${rPlace.categoryName}</span>
											<span class="" href="#">뷰${place.readCount} 댓글 ${place.reviewCount}</span>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
				
			<div class="col-md-2"></div>
		</div>
	</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	

<script>
	// 게시글 상세조회로 이동
	$(".card").on("click", function() {
		var placeNo = $(this).children().eq(0).text();

		console.log(placeNo);
		
		var placeViewURL = "${contextPath}/place/" + placeNo;

		location.href = placeViewURL;
	});
	
	$(".moveList").on("click", function(){
		location.href = "${contextPath}/place/placeList";
	});
	
	// 검색 파라미터 유지하기
	$(function(){
		// 카테고리
		<c:forEach items="${search.ct}" var="ctName">
			$("input[name=ct]").each(function(index, item){
				if($(item).val() == "${ctName}"){
					$(item).prop("checked", true);
				}
			})
		</c:forEach>
		
		// 검색 조건 (sk)
			// 검색 조건 sk
			$("select[name=sk] > option").each(function(index,item){
				if( $(item).val() == "${sk}"){
					$(item).prop("selected", true);
				}
			});
			
			// 검색 값 sv
			$("input[name=sv]").val("${sv}");
		});	
	
	$(function(){
		$(".sideheart").fadeTo(0, 0.0);
	})
	
	$(".sideheart").hover(function(){
        $(this).fadeTo(1000, 1);
    }, function(){
        $(this).fadeTo(1000, 0);
   });
	
</script>




</body>
</html>