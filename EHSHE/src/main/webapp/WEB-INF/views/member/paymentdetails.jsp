<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jquery  -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- bootStrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
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

.form-container {
	margin: auto;
	height: 100%;
	max-width: 350px;
}

form-container-my {
	margin: auto;
	height: 100%;
	max-width: 720px;
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
	margin-top: 0;
	max-width: 250px;
	font-weight: 600;
	font-size: 15px;
	color: #191919;
	background-color: #F5DF4D;
	border-radius: 1rem;
}

.btnCk {
	margin: 20px;
	float: left;
}

.btn:hover {
	background-color: #f0d700 !important;
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
	text-align: center;
	display: inline-block;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
</style>

</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div class="form-wrapper">
		<br> <br> <br> <br> <br> <br> <br>
		<br>
		<div class="title">
			<h1>결제 내역</h1>


			<br>

			<div>

				<a href="${contextPath}/page/mypagemain"> <img
					src="${contextPath}/resources/images/pricelist.png"
					style="width: 100px; height: 100px; margin-bottom: 5px"></a>
			</div>
		</div>

		<br>
		<div class="hr"></div>


		<div class="container board-list">
			<!-- 게시판 명 얻어오기 -->
			<h1>${bList[0].boardName}</h1>
			<c:choose>
				<c:when test="${pInfo.boardType == 1}">결제 리스트</c:when>

			</c:choose>
			<div>
				<table class="table table-hover table-striped" id="list-table">
					<thead>
						<tr>

							<th><input type="checkbox"></th>
							<th>주문번호</th>
							<th>주문일자</th>
							<th>상품정보</th>
							<th>주문금액,수량</th>

						</tr>
					</thead>
					<tbody>
						<c:if test="${empty bList}">
							<tr>
								<td colspan="6">존재하는 게시글이 없습니다.</td>
							</tr>
						</c:if>

						<c:if test="${!empty bList}">
							<c:forEach var="board" items="${bList}" varStatus="vs">

								<tr>
									<td><input type="checkbox"></td>
									<td>#</td>
									<td>#</td>
									<td>#</td>
									<td class="boardTitle">
										<!----------------- 썸네일 부분 -----------------> <c:forEach
											items="${thList}" var="th">
											<c:if test="${th.parentBoardNo == board.boardNo}">
												<img src="${contextPath}${th.filePath}/${th.fileName}">
												<!-- /spring  /resources/uploadImages/ ~~ -->
											</c:if>

										</c:forEach> ${board.boardTitle}
									</td>

									<td>${board.memberId}</td>
									<td>${board.readCount}</td>
									<td>
										<%-- 날짜 출력 모양 지정 --%> <fmt:formatDate var="createDate"
											value="${board.boardCreateDate }" pattern="yyyy-MM-dd" /> <fmt:formatDate
											var="now" value="<%=new java.util.Date()%>"
											pattern="yyyy-MM-dd" /> <c:choose>
											<c:when test="${createDate != now}">
											${createDate }
										</c:when>
											<c:otherwise>
												<fmt:formatDate value="${board.boardCreateDate }"
													pattern="HH:mm" />
											</c:otherwise>
										</c:choose>
									</td>

								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<hr>



			<br>
			<div class="form-container-my">





				<hr>
				<div class="bg-white rounded shadow-sm container p-3"></div>
			</div>
			<%-- form-wrapper end --%>

			<%-- footer include --%>
			<jsp:include page="../common/footer.jsp" />

			<script>
				
			</script>
</body>


</html>

