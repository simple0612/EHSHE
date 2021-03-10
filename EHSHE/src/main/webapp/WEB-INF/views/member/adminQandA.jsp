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
							<br> <br><br>Q&A<br> <br> <br>

							<div>


								<a href="${contextPath}/page/adminpage"> <img
					src="${contextPath}/resources/images/QandA.png"
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

								<th><input type="checkbox"></th>
								<th>댓글번호</th>
								<th>댓글내용</th>
								<th>게시글 이름</th>
								<th>댓글 게시글 번호</th>
							</tr>


							<c:if test="${empty QList}">
								<tr>
									<td colspan="5">존재하는 게시글이 없습니다.</td>
								</tr>
							</c:if>

							<c:if test="${!empty QList}">
								<c:forEach var="qlist" items="${QList}" varStatus="vs">


									<tr class="cklist">
										<td><input type="checkbox" name="chk"></td>


										<td>${qlist.qaNo}</td>
										<td>${qlist.replyContent}</td>
										<td>${qlist.itemNm}</td>
										<td>${qlist.parentBoardNo}</td>


									</tr>

								</c:forEach>
							</c:if>
						</table>
					</div>

					<hr>


				</div>






				<div class="row">
					<div class="col-md-12 insert-btn">
						<c:if test="${!empty loginMember }">
							<a class="btn ehsheYellow float-right writeBtn" href="#">삭제하기</a>
							<!-- 	<button id="deleteBtn" class="btn ehsheYellow">1삭1제1</button>
 -->
						</c:if>
					</div>
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
		//체크박스 선택시 전체 선택
		$(document).ready(function() {
			//최상단 체크박스 클릭
			$("#checkall").click(function() {
				//클릭되었으면
				if ($("#checkall").prop("checked")) {
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
					$("input[name=chk]").prop("checked", true);
					//클릭이 안되있으면
				} else {
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
					$("input[name=chk]").prop("checked", false);
				}
			})
		})
	</script>




</body>
</html>