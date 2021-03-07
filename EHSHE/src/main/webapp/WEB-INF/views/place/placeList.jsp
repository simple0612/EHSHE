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

<link rel="stylesheet" href="${contextPath}/resources/css/place/placeList.css">

<style>
</style>
</head>

<body>
	<jsp:include page="../common/header.jsp" />

	<div class="container-fluid boardMain">
		<div class="row">
			<div class="col-md-2"></div>
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
				
				<h4>EHSHE 장소</h4>
				<div class="row">
					<c:if test="${!empty pList }">
						<c:forEach var="place" items="${pList}" varStatus="vs">
							<div class="col-md-6 width400">
								<div class="card">
									<div style="display: none;">${place.placeNo}</div>
									<c:forEach var="th" items="${thList}">
											<c:if test="${th.placeNo == place.placeNo}">
												<img class="card-img-top" src="${contextPath}/resources/uploadImages/210303203008_53871.jpg"/>
											</c:if>
									</c:forEach>
									<div class="card-block">
										<h6 class="card-title">
											<span>${place.placeTitle}</span><span class="" href="#">별점 4.2</span>
										</h6>
										<p class="card-text">
										<c:set var = "loca" value="${fn:split(place.location,',')[1]}" />
											<span class="" href="#">${fn:split(loca,' ')[0]}</span> - <span class="" href="#">음식점</span>
											<span class="" href="#">뷰${place.readCount} 댓글 아직</span>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
				
				
				<%-- ----------------------------페이지 네이션 --------------------------------- --%>
				<div class="row">
					<div class="col-md-2"></div>
						<div class="col-md-8">
							<div class="pagination-area">
								<ul class="pagination">
								
								<c:choose>
								<%-- 검색이 된 경우 --%>
									<c:when test="${!empty search}">
										<c:forEach items="${search.ct}" var="c">
											<c:set var="category" value="${category}ct=${c}&"/>
										</c:forEach>
										
										<c:set var="searchStr" value="${category}"/>
										
										<%-- 검색된 내용이 있다면 --%>
										<c:if test="${!empty search.sv }">
											<c:set var="searchStr" value="${category}sk=${search.sk}&sv=${search.sv}"/>
										</c:if>
										
										<c:url var="pageUrl" value="../search/?${searchStr}"/>
										<c:set var="returnListURL" value="${contextPath}/place/search/${pageUrl}cp=${pInfo.currentPage}" scope="session"/>
										
									</c:when>
									<%-- 검색이 되지 않은 경우 --%>
									<c:otherwise>
									<c:set var="returnListURL" value="${contextPath}/place/placeList/${pageUrl}cp=${pInfo.currentPage}" scope="session"/>
										<c:url var="pageUrl" value="?"/>
									</c:otherwise>
								</c:choose>
								
								
								
	
								<c:set var="firstPage" value="${pageUrl}cp=1" />
								<c:set var="lastPage" value="${pageUrl}cp=${pInfo.maxPage}" />

								<fmt:parseNumber var="c1"
									value="${(pInfo.currentPage - 1) / 10 }" integerOnly="true" />
								<fmt:parseNumber var="prev" value="${ c1 * 10 }"
									integerOnly="true" />
								<c:set var="prevPage" value="${pageUrl}cp=${prev}" />

								<fmt:parseNumber var="c2"
									value="${(pInfo.currentPage + 9) / 10 }" integerOnly="true" />
								<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }"
									integerOnly="true" />
								<c:set var="nextPage" value="${pageUrl}cp=${next}" />

								<c:if test="${pInfo.currentPage > pInfo.pageSize}">
									<li><a class="page-link" href="${firstPage}">&lt;&lt;</a></li>

									<li><a class="page-link" href="${prevPage}">&lt;</a></li>
								</c:if>

								<!-- 페이지 목록 -->
								<c:forEach var="page" begin="${pInfo.startPage}"
									end="${pInfo.endPage}">
									<c:choose>
										<c:when test="${pInfo.currentPage == page }">
											<li><a class="page-link">${page}</a></li>
										</c:when>

										<c:otherwise>
											<li><a class="page-link" href="${pageUrl}cp=${page}">${page}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:if test="${next <= pInfo.maxPage}">
									<li><a class="page-link" href="${nextPage }">&gt;</a></li>

									<li><a class="page-link" href="${lastPage }">&gt;&gt;</a></li>
								</c:if>
								</ul>
							</div>
						</div>
					<div class="col-md-2"></div>
				</div>
				
			<div class="col-md-2"></div>
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
	
</script>




</body>
</html>