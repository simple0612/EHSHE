<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jquery  -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${contextPath}/resources/css/board/boardList.css">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/5a7a3b1a34.js"
	crossorigin="anonymous"></script>

<title>EHSHE</title>

<style>
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.form-wrapper {
	margin: 50px 0 220px 0;
}

.title {
	font-size: 2rem;
	font-weight: bold;
	text-align: center;
}

.title>a {
	text-decoration: none;
	color: #404040;
}

.hr {
	margin: auto;
	width: 40%;
	min-width: 350px;
	text-align: center;
	border-top: 1px solid #e6e6e6;
}

/* 체크박스 css */
input[id="saveId"] {
	display: none;
}

input[id="saveId"]+label em { /* 인접요소 선택자 */
	display: inline-block;
	width: 16px;
	height: 16px;
	margin: 0 5px 3px 0;
	background: url(${contextPath}/resources/images/checkOut.png) 0 0
		no-repeat;
	vertical-align: middle;
}

input[id="saveId"]:checked+label em {
	background: url(${contextPath}/resources/images/check.png) 0 0 no-repeat;
}

.form-control {
	height: 3rem !important;
	border-radius: 1rem !important;
}

.info-user, .list-user {
	float: none;
	list-style: none;
	text-align: center;
	margin-bottom: 30px;
}

.list-user>li {
	float: none;
	display: inline-block;
}

.list-user a, .list-user>a:link {
	text-decoration: none;
	color: rgba(0, 0, 0, 0.7);
}

.btn {
	border: none;
	width: 100%;
	height: 2rem;
	margin-top: 1.7rem;
	max-width: 150px;
	font-weight: 600;
	font-size: 15px;
	color: #191919;
	background-color: #F5DF4D;
	border-radius: 1rem;
}

.btn:hover {
	
}

.title-sns {
	margin-top: 15px;
	text-align: center;
	font-size: 30px;
	color: #404040;
}

.text-sns, .text-login {
	font-size: 20px;
	font-weight: 600;
	color: #404040;
}

.img-area {
	text-align: center;
}

.link-sns {
	display: inline-block;
}

.link-sns>a {
	text-decoration: none;
	color: rgba(0, 0, 0, 0.7);
}

.link-sns>a:hover {
	color: #007bff;
}

.area {
	display: inline-block;
}

.form-container {
	text-align: center;
}
</style>

</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div class="form-wrapper">
		<br>
		<div class="title">

			<div>

				<a href="${contextPath}/page/mywrite"> <img
					src="${contextPath}/resources/images/review.png"
					style="width: 100px; height: 100px; margin-bottom: 10px">
				</a>
				<h5>date & shop</h5>
			</div>
			<input type="button" value="shop" id="btn1" class="btn"> <input
				type="button" value="date" id="btn2" class="btn">
		</div>

		<br>
		<div class="hr"></div>

		<br>
		<div class="form-container">




			<div class="container pay-list">
				<!-- 게시글  얻어오기 -->

				<div id="bullet">
					<table class="table table-hover table-striped" id="list-table">
						<tr>


							<th></th>
							<th>상품 번호</th>
							<th>상품 제목</th>
							<th>상품 내용</th>
							<th>등록일</th>

						</tr>


						<c:if test="${empty ItemReview}">
							<tr>
								<td colspan="5">존재하는 게시글이 없습니다.</td>
							</tr>
						</c:if>

						<c:if test="${!empty ItemReview}">
							<c:forEach var="ItemReview" items="${ItemReview}" varStatus="vs">


								<tr class="cklist">

									<td>${ItemReview.itemCategory}</td>
									<td>${ItemReview.itemNo}</td>
									<td>${ItemReview.itemNm}</td>
									<td>${ItemReview.itemContent}</td>
									<td>
										<%-- 날짜 출력 모양 지정 --%> <fmt:formatDate var="createDate"
											value="${ItemReview.orderDate }" pattern="yyyy-MM-dd" /> <fmt:formatDate
											var="now" value="<%=new java.util.Date()%>"
											pattern="yyyy-MM-dd" /> <c:choose>
											<c:when test="${createDate != now}">
											${createDate }
										</c:when>
											<c:otherwise>
												<fmt:formatDate value="${ItemReview.orderDate }"
													pattern="HH:mm" />
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>


				<div id="review" style="display: none;">
					<div id="review">
						<table class="table table-hover table-striped" id="list-table">

							<tr class="arealink">


								<th>장소 번호</th>
								<th>장소 내용</th>
								<th>장소 번호</th>
								<th>등록일</th>

							</tr>


							<c:if test="${empty areaReview}">
								<tr>
									<td colspan="3">존재하는 게시글이 없습니다.</td>
								</tr>
							</c:if>

							<c:if test="${!empty areaReview}">
								<c:forEach var="areaReview" items="${areaReview}" varStatus="vs">


									<tr class="arealink">

										<td>${areaReview.reviewNo}</td>
										<td>${areaReview.reviewContent}</td>
										<td>${areaReview.placeNo}</td>

										<td>${areaReview.reviewCreateDate}
											
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-12 insert-btn">
						<c:if test="${!empty loginMember }">


						</c:if>
					</div>
				</div>

			</div>

			<hr>



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

						<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 10 }"
							integerOnly="true" />
						<fmt:parseNumber var="prev" value="${ c1 * 10 }"
							integerOnly="true" />
						<c:set var="prevPage" value="${pageUrl}cp=${prev}" />

						<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 9) / 10 }"
							integerOnly="true" />
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
	</div>
	</div>


	<%-- form-wrapper end --%>

	<%-- footer include --%>
	<jsp:include page="../common/footer.jsp" />



	<script>
		// 게시글 상세보기 기능 (jquery를 통해 작업)
		$(".cklist").on("click", function() {
			var shopNo = $(this).children().eq(0).text();
			var shopNo1 = $(this).children().eq(1).text();

			var shopViewURL = "${contextPath}/shop/" + shopNo + "/" + shopNo1;

			// var boardViewURL = "../" + boardNo;

			location.href = shopViewURL;
		}); 
		
		$(".arealink").on("click", function() {
			var shopNo = $(this).children().eq(2).text();

			var shopViewURL = "${contextPath}/place/" + shopNo;

			// var boardViewURL = "../" + boardNo;

			location.href = shopViewURL;
		}); 
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

		// 게시글 삭제
		$("#deleteBtn").on("click", function() {
			if ($("input[name=chk]").prop("checked", true)) {
				if (confirm("게시글을 삭제하시겠습니까?")) {

					var boardNo = $(this).children().eq(0).text();

					location.href = "deleteAction/" + boardNo;

				}
			}
		});

		document.getElementById("btn1").addEventListener("click", function() {
			var box1 = document.getElementById("bullet");
			var box2 = document.getElementById("review");

			box2.style.display = "none";

			box1.style.display = "block";

		});

		document.getElementById("btn2").addEventListener("click", function() {
			var box1 = document.getElementById("bullet");
			var box2 = document.getElementById("review");
			box1.style.display = "none";
			box2.style.display = "block";

		});
	</script>



</body>


</html>

