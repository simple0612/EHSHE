<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	margin: 0 auto;
	text-align: center;
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
</style>

</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div class="form-wrapper">
		<br> <br> <br> <br> <br> <br> <br>
		<br>
		<div class="title">
			<div>

				<a href="${contextPath}/page/mypagemain"> <img
					src="${contextPath}/resources/images/mypageicon.png"
					style="width: 100px; height: 100px; margin-bottom: 5px"></a> <br>
				<br>

				<h3>${loginMember.memberId}님의회원탈퇴를확인 위해 다시 한번 비밀번호를 입력해주세요.</h3>

			</div>
			<br> <br>
		</div>

		<br>
		<div class="hr"></div>

		<div class="bg-white rounded shadow-sm container p-3">
			<form method="POST" action="deleteMember"
				onsubmit="return validate();" class="form-horizontal" role="form">


				<!-- 비밀번호 -->
				<div class="row mb-3 form-row">
					<div class="col-md-3">
						<h6>비밀번호</h6>
					</div>
					<div class="col-md-6">
						<input type="password" class="form-control" id="currentPwd"
							name="memberPwd">
					</div>
				</div>

				<hr>


				<hr class="mb-4">
				<button class="btn btn-success btn-lg btn-block" id="btn"
					type="submit">탈퇴</button>
			</form>
		</div>


	</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	</form>


	</div>
	</div>
	<%-- form-wrapper end --%>

	<%-- footer include --%>
	<jsp:include page="../common/footer.jsp" />

	<script>
		function validate() {

			if ($("currentPwd").val().trim().length == 0) {
				alert("비밀번호를 입력해 주세요");
				$("#currentPwd").focus();

				return false;
			}
		}
	</script>
</body>


</html>

