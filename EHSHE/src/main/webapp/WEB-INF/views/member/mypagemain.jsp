<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jquery  -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

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

<link rel="stylesheet"
	href="${contextPath}/resources/css/board/boardList.css">
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
	height: 2.8rem;
	margin-top: 0.7rem;
	max-width: 350px;
	font-weight: 600;
	font-size: 15px;
	color: #191919;
	background-color: #F5DF4D;
	border-radius: 1rem;
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
	display: inline-block;
}

.form-container {
	text-align: center;
}
</style>

</head>
<body>

	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../member/mypageSide.jsp" />
	<div class="form-wrapper">
		<br>
		<div class="title">
			<h3>마이페이지</h3>
		</div>
		<br>
		<div class="hr"></div>

		<br>
		<div class="form-container">
			<div class="area">
				<a href="${contextPath}/page/checkpassward"> <img
					src="${contextPath}/resources/images/mypageicon.png"
					style="width: 100px; height: 100px; margin-bottom: 10px">
					<h5>내정보</h5>
			</div>
	&nbsp;&nbsp;
			<div class="area">
				<a href="${contextPath}/page/paymentdetails"><img
					src="${contextPath}/resources/images/pricelist.png"
				style="width: 100px; height: 100px; margin-bottom: 10px">
					<h5>결제내역</h5>
			</div>


			<br> <br>

			<div class="area">
				<a href="${contextPath}/page/mywrite"><img
					src="${contextPath}/resources/images/mytextlist.png"
					style="width: 100px; height: 100px; margin-bottom: 10px">
					<h5>내글</h5>
			</div>
				&nbsp;&nbsp;
			<div class="area">
				<a href="${contextPath}/page/bookmark"><img
					src="${contextPath}/resources/images/myfavorite.png"
					style="width: 100px; height: 100px; margin-bottom: 10px">
					<h5>데이트</h5>
			</div>

		</div>
		<%-- form-wrapper end --%>

		<%-- footer include --%>
		<jsp:include page="../common/footer.jsp" />
</body>


</html>

