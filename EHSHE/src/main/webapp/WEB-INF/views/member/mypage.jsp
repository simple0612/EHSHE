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
z
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
		<br>
		<div class="title">
			<h1>내정보 수정</h1>


			<br>

			<div>

				<a href="${contextPath}/page/mypagemain"> <img
					src="${contextPath}/resources/images/mypageicon.png"
					style="width: 100px; height: 100px; margin-bottom: 5px">
				</a>
			</div>
		</div>

		<br>
		<div class="hr"></div>
		<div class="form-container-my">

			<div class="bg-white rounded shadow-sm container p-3">
				<form method="POST" action="updateAction" name="updateForm"
					onsubmit="return updateValidate();" class="form-horizontal"
					role="form">
					<br>
					<!-- 아이디 -->

					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<h6>아이디</h6>
						</div>
						<div class="col-md-6">
							<h5 id="id">${loginMember.memberId}</h5>
						</div>
					</div>
					<!-- 이름 -->
					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<h6>이름</h6>
						</div>
						<div class="col-md-6">
							<input type="text" class="form-control" id="name" name="name"
								value="${loginMember.memberNm}">

						</div>
					</div>
					<!-- 이름 -->
					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<h6>전화번호</h6>
						</div>
						<div class="col-md-6">
							<input type="text" class="form-control" id="phone1" name="phone1"
								value="${loginMember.memberPhone}">

						</div>
					</div>




					<!-- 이메일 -->
					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<label for="memberEmail">이메일</label>
						</div>
						<div class="col-md-6">
							<input type="email" class="form-control" id="email"
								name="memberEmail" value="${loginMember.memberEmail}">

						</div>
					</div>




					<br>
					<c:set var="address"
						value="${fn:split(loginMember.memberAddr,',') }" />

					<!-- 주소 -->
					<!-- 오픈소스 도로명 주소 API -->
					<!-- https://www.poesis.org/postcodify/ -->
					<div class="row mb-3 form-row">

						<div class="col-md-3">
							<label for="postcodify_search_button">우편번호</label>
						</div>
						<div class="col-md-3">
							<input type="text" name="post" id="post"
								class="form-control postcodify_postcode5" value="${address[0]}">
						</div>
						<div class="col-md-3">
							<button type="button" class="btn btn-success"
								id="postcodify_search_button">검색</button>
						</div>
					</div>

					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<label for="address1">도로명 주소</label>
						</div>
						<div class="col-md-9">
							<input type="text" class="form-control postcodify_address"
								name="address1" id="address1" value="${address[1]}">
						</div>
					</div>

					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<label for="address2">상세주소</label>
						</div>
						<div class="col-md-9">
							<input type="text" class="form-control postcodify_details"
								name="address2" id="address2" value="${address[2]}">
						</div>
					</div>
					<div>



						<button class="btn btnCk btn-delete" type="submit">수정 하기</button>





					</div>
			</div>

		</div>

		</form>
		</form>


	</div>
	<%-- form-wrapper end --%>

	<%-- footer include --%>
	<jsp:include page="../common/footer.jsp" />

	<!-- 도로명 주소 API -->
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
		// 도로명 주소 API
		// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});

		// 각 유효성 검사 결과를 저장할 객체
		var validateCheck = {

			"email" : false
		};

		// submit 동작
		function updateValidate() {

			var $email = $("#email");

			// 이메일 유효성 검사
			var regExp3 = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;

			if (!regExp3.test($email.val())) {
				validateCheck.email = false;
			} else {
				validateCheck.email = true;
			}

			for ( var key in validateCheck) {
				if (!validateCheck[key]) {
					var str;
					switch (key) {
					case "phone2":
						str = "전화번호";
						break;
					case "email":
						str = "이메일";
						break;
					}

					swal({
						icon : "warning",
						title : str + " 형식이 유효하지 않습니다."
					}).then(function() {
						var id = "#" + key;
						$(id).focus();
					});

					return false;
				}
			}

			$memberPhone = $("<input>", {
				type : "hidden",
				name : "memberPhone",
				value : $("#phone1").val()
			});

			$memberAddress = $("<input>", {
				type : "hidden",
				name : "memberAddress",
				value : $("#post").val() + "," + $("#address1").val() + ","
						+ $("#address2").val()
			});

			$("form[name='updateForm']").append($memberPhone).append(
					$memberAddress);

		}
	</script>

</body>


</html>

