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
<title>결제 확인</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="${contextPath}/resources/css/board/boardList.css">


</head>

<body>
	<jsp:include page="../common/header.jsp" />

	<div class="container-fluid payMeny">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-12">
						<h1 class="myPlace-header">
							<br> <br> <br> 즐겨찾기<br> <br> <br>

							<div>


								<a href="${contextPath}/page/mypagemain"><img
									src="${contextPath}/resources/images/myfavorite.png"
									style="width: 200px; height: 200px; margin-bottom: 5px"></a>
							</div>

						</h1>

					</div>
				</div>



				<div class="container pay-list">
					<!-- 게시글  얻어오기 -->

					<div>
						<table class="table table-hover table-striped" id="list-table">
							<tr>


								<th>장소 번호</th>
								<th>장소 제목</th>
								<th>장소 내용</th>
								<th>장소 생성일</th>
								<th>전화번호</th>

							</tr>


							<c:if test="${empty bookList}">
								<tr>
									<td colspan="5">존재하는 게시글이 없습니다.</td>
								</tr>
							</c:if>

							<c:if test="${!empty bookList}">
								<c:forEach var="book" items="${bookList}" varStatus="vs">



									<tr class="cklist">

										<td>${book.placeNo}</td>
										<td>${book.placeTitle}</td>
										<td>${book.placeContent}</td>
										<td>${book.placeCtreateDate}</td>
										<td>${book.phone}</td>

									</tr>


								</c:forEach>
							</c:if>
						</table>
					</div>

					<hr>


				</div>






				<div class="row">
					<div class="col-md-12 insert-btn"></div>
				</div>

				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="pagination-area">
							<ul class="pagination">
								<%-- 주소 조합 작업 --%>
								<c:url var="pageUrl" value="?" />

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

				<div class="col-md-2"></div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
	</div>

	<jsp:include page="../common/footer.jsp" />


	<script>
		$(".cklist").on("click", function() {
			var placeNo = $(this).children().eq(0).text();

			console.log(placeNo);

			var placeViewURL = "${contextPath}/place/" + placeNo;

			location.href = placeViewURL;
		});

		$(".placeList").on("click", function() {
			location.href = "${contextPath}/place/placeList";
		});
	</script>




</body>
</html>