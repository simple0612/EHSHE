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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="${contextPath}/resources/css/board/boardList.css">


</head>

<body>
	<jsp:include page="../common/header.jsp" />

	<div class="container-fluid boardMain">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-12">
						<h3 class="myPlace-header">나만의 장소</h3>
					</div>
				</div>
				<div class="row myPlace">
					<c:if test="${empty bList }">
						<div class="col-md-3">
							<div class="row">
								<div class="card">
									<img class="card-img-top" alt="Bootstrap Thumbnail"
										src="${contextPath}/resources/images/thumbnailBox.png" />
									<div class="card-block">
										<span class="card-title">존재하는 게시글이 없습니다.</span>&nbsp;<span
											class="card-like">&nbsp;</span><br> <span
											class="card-text">&nbsp;</span><br> <span
											class="card-writer">&nbsp;</span>
									</div>
								</div>
							</div>
						</div>
					</c:if>

					<c:if test="${!empty bList }">
						<c:forEach var="board" items="${bList}" varStatus="vs">
							<div class="col-md-3">
								<div class="row">
									<div class="card">
										<div style="display: none;">${board.boardNo}</div>
										<c:forEach var="th" items="${thList}">
											<c:if test="${th.boardNo == board.boardNo}">
											<img class="card-img-top" alt="Bootstrap Thumbnail" src="${contextPath}${th.thumbnailFilePath}/${th.fileName}" />
											</c:if>
										</c:forEach>

										<div class="card-block">
											<span class="card-title">${board.boardTitle}</span>
											<span class="card-like">❤ ${board.readCount}</span><br>
												<c:set var = "loca" value = "${fn:split(board.location,',')[1]}" />
											<span class="card-text">${fn:split(loca,' ')[0]} - ${fn:split(loca,' ')[1]}</span><br>
											<c:set var = "length" value ="${fn:length(board.memberId)}"/>
											<span class="card-writer">${fn:substring(board.memberId,0,2)}****</span>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>

				<div class="row">
					<div class="col-md-12 insert-btn">
						<c:if test="${!empty loginMember }">
							<a class="btn ehsheYellow float-right writeBtn" 
								href="${contextPath}/board/insertBoard">글쓰기</a>
						</c:if>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="pagination-area">
							<ul class="pagination">
								<%-- 주소 조합 작업 --%>
								<c:url var="pageUrl" value="?"/>

								<!-- 화살표에 들어갈 주소를 변수로 생성 -->
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
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<form class="form-inline selectBox">
							<select class="form-control mr-sm-2 search-bottom" type="text">
								<option value="all">전체</option>
								<option value="title">제목</option>
								<option value="category">카테고리</option>
								<option value="location">위치</option>
							</select> <input id="search-input" class="form-control mr-sm-2"
								type="text" />
							<button class="btn ehsheYellow my-2 my-sm-0" type="button">
								검색</button>
						</form>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />

	<c:set var="returnListURL" 
					value="${contextPath}/board/boardlist/${pageUrl}cp=${pInfo.currentPage}"
					scope="session"/>

	<script>
		// 게시글 상세보기 기능 (jquery를 통해 작업)
		$(".card").on("click", function() {
			var boardNo = $(this).children().eq(0).text();
	
			var boardViewURL = "${contextPath}/board/" + boardNo;
			
			// var boardViewURL = "../" + boardNo;

			location.href = boardViewURL;
		});
	</script>




</body>
</html>