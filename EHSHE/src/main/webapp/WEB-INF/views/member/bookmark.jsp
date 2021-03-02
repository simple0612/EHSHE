<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bList[0].boardName}</title>
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<style>
.pagination {
	justify-content: center;
}
 
.card {
	width: 150px;
	height: 150px;
	object-fit: cover;
}

#searchForm {
	position: relative;
}

#searchForm>* {
	top: 0;
}

.boardTitle>img {
	width: 50px;
	height: 50px;
}

.board-list {
	margin: 100px auto;
}

/* 세로 가운데 정렬*/
#list-table td {
	vertical-align: middle;
	/* vertical-align : inline, inline-block 요소에만 적용 가능(td는 inline-block)*/
}

.list-wrapper {
	min-height: 540px;
}

#list-table td:hover {
	cursor: pointer;
}

.area {
	text-align: center;
}

.card {
	text-align: center;
}

.titl {
	left: 500px;
	text-align: center;
}
</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="titl">
		<h1>즐겨찾기</h1>
		<br> <br>
		<div>

			<a href="${contextPath}/page/mypagemain"><img
				src="${contextPath}/resources/images/myfavorite.png"
				style="width: 100px; height: 100px; margin-bottom: 5px"></a>
		</div>

	</div>

	<br>
	<br>
	<br>

	<!-- 게시판 명 얻어오기 -->

	<div>
		<table class="table table-hover table-striped" id="list-table">

			<tbody>
				<c:if test="${empty bList}">
					<tr>
						<td colspan="6">존재하는 게시글이 없습니다.</td>
					</tr>
				</c:if>

				<c:if test="${!empty bList}">
					<c:forEach var="board" items="${bList}" varStatus="vs">



						<section class="ranking">
							<div class="inner">
								<div class="ranking-content">
							
									<div class="citems">
										<div class="citem">
											<div class="citem-image">
												<img src="">
											</div>
											<div class="citem-description">
												<span><b>가격</b></span>
												<h3>
													<b>이름</b>
												</h3>
												<a href="#" class="view-item">View More</a>
											</div>
										</div>

									</div>
								</div>
							</div>
						</section>


					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>

	<hr>
	<%-- 로그인이 되어있는 경우 --%>
	<c:if test="${!empty loginMember }">
		<a class="btn btn-success float-right"
			href="../${pInfo.boardType}/insert">글쓰기</a>
	</c:if>
	<!--------------------------------- pagination  ---------------------------------->

	<div class="my-4">
		<ul class="pagination">

			<%-- 주소 조합 작업 --%>
			<c:url var="pageUrl" value="${pInfo.boardType}?" />

			<!-- 화살표에 들어갈 주소를 변수로 생성 -->
			<c:set var="firstPage" value="${pageUrl}cp=1" />
			<c:set var="lastPage" value="${pageUrl}cp=${pInfo.maxPage}" />

			<%-- EL을 이용한 숫자 연산의 단점 : 연산이 자료형에 영향을 받지 않는다--%>
			<%-- 
					<fmt:parseNumber>   : 숫자 형태를 지정하여 변수 선언 
					integerOnly="true"  : 정수로만 숫자 표현 (소수점 버림)
				--%>

			<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 10 }"
				integerOnly="true" />
			<fmt:parseNumber var="prev" value="${ c1 * 10 }" integerOnly="true" />
			<c:set var="prevPage" value="${pageUrl}cp=${prev}" />


			<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 9) / 10 }"
				integerOnly="true" />
			<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }"
				integerOnly="true" />
			<c:set var="nextPage" value="${pageUrl}cp=${next}" />



			<c:if test="${pInfo.currentPage > pInfo.pageSize}">
				<li>
					<!-- 첫 페이지로 이동(<<) --> <a class="page-link" href="${firstPage}">&lt;&lt;</a>
				</li>

				<li>
					<!-- 이전 페이지로 이동 (<) --> <a class="page-link" href="${prevPage}">&lt;</a>
				</li>
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


			<%-- 다음 페이지가 마지막 페이지 이하인 경우 --%>
			<c:if test="${next <= pInfo.maxPage}">
				<li>
					<!-- 다음 페이지로 이동 (>) --> <a class="page-link" href="${nextPage}">&gt;</a>
				</li>

				<li>
					<!-- 마지막 페이지로 이동(>>) --> <a class="page-link" href="${lastPage}">&gt;&gt;</a>
				</li>
			</c:if>
		</ul>
	</div>

	
	<jsp:include page="../common/footer.jsp" />

	<%-- 목록으로 버튼에 사용할 URL 저장 변수 선언 --%>
	<c:set var="returnListURL"
		value="${contextPath}/board/list/${pageUrl}cp=${pInfo.currentPage}"
		scope="session" />

	<script>
		// 게시글 상세보기 기능 (jquery를 통해 작업)

		$("#list-table td").on("click", function() {
			var boardNo = $(this).parent().children().eq(0).text();
			// td     tr       td			첫번째(게시글 번호)

			// 게시글 상세조회 요청 주소 조합

			// 게시글 목록 : /spring/board/list/1
			// 상세조회 : /spring/board/1/500
			// 절대경로
			//var boardViewURL = "${contextPath}/board/${pInfo.boardType}/" + boardNo;
			// 상대경로
			var boardViewURL = "../${pInfo.boardType}/" + boardNo;

			location.href = boardViewURL;

		});
	</script>
</body>
</html>
