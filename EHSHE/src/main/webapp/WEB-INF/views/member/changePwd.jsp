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
	margin:0 auto;
	text-align: center;
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
	
		<br>
		<div class="title">
			<h5>비밀번호 수정</h5>


			<br> 

			<div>

				<a href="${contextPath}/page/mypagemain"> <img
					src="${contextPath}/resources/images/mypageicon.png"
					style="width: 100px; height: 100px; margin-bottom: 10px">
				</a>
			</div>
		</div>

		<br>
		<div class="hr"></div>




		<br>
		<div class="form-container-my">

			<div class="bg-white rounded shadow-sm container p-3">
				<form method="POST" action="checkPwd" onsubmit="return validate();"
					class="form-horizontal" role="form">

					<!-- 현재 비밀번호 -->
					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<h6>현재 비밀번호</h6>
						</div>
						<div class="col-md-6">
							<input type="password" class="form-control" id="memberPwd"
								name="memberPwd">
						</div>
					</div>

					<!-- 새 비밀번호 -->
					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<h6>새 비밀번호</h6>
						</div>
						<div class="col-md-6">
							<input type="password" class="form-control" id="newPwd1"
								name="newPwd1">
						</div>
					</div>

					<!-- 새 비밀번호 확인-->
					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<h6>새 비밀번호 확인</h6>
						</div>
						<div class="col-md-6">
							<input type="password" class="form-control" id="newPwd2"
								name="newPwd2">
						</div>
					</div>

					<hr class="mb-4">
					<button class="btn btn-success btn-lg btn-block" type="submit">변경하기</button>
				</form>
			</div>
		</div>
		<%-- form-wrapper end --%>

		<%-- footer include --%>
		<jsp:include page="../common/footer.jsp" />

		<script>
			// submit 동작
			function validate() {
				// 비밀번호  유효성 검사
				//영어 대,소문자 + 숫자, 총 6~12글자
				var regExp = /^[A-Za-z0-9]{6,12}$/;
				if (!regExp.test($("#newPwd1").val())) {
					alert("유효하지 않은 비밀번호 입니다.");
					$("#newPwd1").focus();

					return false;
				}

				if ($("#newPwd1").val() != $("#newPwd2").val()) {
					alert("새 비밀번호가 일치하지 않습니다.");
					$("#newPwd2").focus();

					return false;
				}

			}
		</script>
</body>


</html>

