<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
<link rel="stylesheet" href="css/default.css">
<style>
.form-control {
	height: 3rem !important;
	border-radius: 1rem !important;
}

 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}

.btn {
	margin-top: 0.5rem;
	font-size: 16px !important;
	font-weight: 500 !important;
	color: #404040 !important;
	background-color: #F5DF4D !important;
	float: left;
	margin: 10px;
}

.first {
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="container mt-5 pt-5" id="content-main">

		<div class="row">
			<div class="col-sm-9">
				<div class="first">

					<h1>내정보 수정</h1>
					<br>
					<br>
					<div>

						<a href="${contextPath}/page/mypagemain"> <img
							src="${contextPath}/resources/images/mypageicon.png"
							style="width: 100px; height: 100px; margin-bottom: 5px">
						</a>
					</div>
					<hr>
				</div>
				<br>
				<br>
				<br>
				<div class="bg-white rounded shadow-sm container p-3">
					<form method="POST" action="updateAction" name="updateForm"
						onsubmit="return updateValidate();" class="form-horizontal"
						role="form">
						<!-- 아이디 -->

						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<h6>아이디</h6>
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control" id="id" name="id">
							</div>
						</div>


						<!-- 비밀번호 -->

						<!-- 새 비밀번호 -->
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<h6>새 비밀번호</h6>
							</div>
							<div class="col-md-6">
								<input type="password" class="form-control" id="newPwd1"
									name="newPwd1" placeholder="새로운 비밀번호를 입력해주세요">
							</div>
						</div>

						<!-- 새 비밀번호 확인-->
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<h6>새 비밀번호 확인</h6>
							</div>
							<div class="col-md-6">
								<input type="password" class="form-control" id="newPwd2"
									name="newPwd2" placeholder="새로운 비밀번호를 입력해주세요">
							</div>
						</div>





						<!-- 이름 -->
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<h6>이름</h6>
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control" id="name" name="name">
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


						<c:set var="phone"
							value="${fn:split(loginMember.memberPhone,'-') }" />
						<c:set var="address"
							value="${fn:split(loginMember.memberAddress,',') }" />

						<!-- 전화번호 -->
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label for="phone1">휴대폰번호</label>
							</div>

							<!-- 전화번호1 -->
							<div class="col-md-3">
								<select class="custom-select" id="phone1" name="phone1">
									<option <c:if test="${phone[0] == '010'}">selectd</c:if>>010</option>
									<option <c:if test="${phone[0] == '011'}">selectd</c:if>>011</option>
									<option <c:if test="${phone[0] == '016'}">selectd</c:if>>016</option>
									<option <c:if test="${phone[0] == '017'}">selectd</c:if>>017</option>
									<option <c:if test="${phone[0] == '019'}">selectd</c:if>>019</option>
								</select>
								<%-- select의 value를 JSTL로 처리하는 방법 --%>
							</div>


							<!-- 전화번호2 -->
							<div class="col-md-3">
								<%-- 위에 배열로 저장되어있는 인덱스를 가져옴--%>
								<input type="number" class="form-control phone" id="phone2"
									name="phone2" maxlength="4" value="${phone[1]}">
							</div>

							<!-- 전화번호3 -->
							<div class="col-md-3">
								<input type="number" class="form-control phone" id="phone3"
									name="phone3" maxlength="4" value="${phone[2]}">
							</div>
						</div>


						<br>

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


						<!-- 관심분야 -->
						<hr class="mb-4">
						<div class="row">
							<div class="col-md-3">
								<label>관심 분야</label>
							</div>

							<div class="col-md-9 custom-control custom-checkbox">
								<div class="form-check form-check-inline">
									<input type="checkbox" name="memberInterest" id="sports"
										value="운동" class="form-check-input custom-control-input">
									<label class="form-check-label custom-control-label"
										for="sports">운동</label>
								</div>
								<div class="form-check form-check-inline">
									<input type="checkbox" name="memberInterest" id="movie"
										value="영화" class="form-check-input custom-control-input">
									<label class="form-check-label custom-control-label"
										for="movie">영화</label>
								</div>
								<div class="form-check form-check-inline">
									<input type="checkbox" name="memberInterest" id="music"
										value="음악" class="form-check-input custom-control-input">
									<label class="form-check-label custom-control-label"
										for="music">음악</label>
								</div>
								<br>
								<div class="form-check form-check-inline">
									<input type="checkbox" name="memberInterest" id="cooking"
										value="요리" class="form-check-input custom-control-input">
									<label class="form-check-label custom-control-label"
										for="cooking">요리</label>
								</div>
								<div class="form-check form-check-inline">
									<input type="checkbox" name="memberInterest" id="game"
										value="게임" class="form-check-input custom-control-input">
									<label class="form-check-label custom-control-label" for="game">게임</label>
								</div>

								<div class="form-check form-check-inline">
									<input type="checkbox" name="memberInterest" id="etc"
										value="기타" class="form-check-input custom-control-input">
									<label class="form-check-label custom-control-label" for="etc">기타</label>
								</div>
							</div>



						</div>
						<div>
							<button class="btn" type="button" onclick="location.href='deletemember' "
								style="WIDTH: 45%; HEIGHT: 40px" >삭제	</button>
							
							

							<button class="btn" type="submit"
								style="WIDTH: 45%; HEIGHT: 40px">수정</button>

						</div>
					</form>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />

	<!-- 도로명 주소 API -->
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
		// 도로명 주소 API
		// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});

		// 전화번호 숫자 4글자 이상 작성 방지
		$(".phone").on("input", function() {
			if ($(this).val().length > $(this).prop("maxLength")) {
				$(this).val($(this).val().slice(0, $(this).prop("maxLength")));
			}
		});

		// 각 유효성 검사 결과를 저장할 객체
		var validateCheck = {
			"phone2" : false,
			"email" : false
		};

		// submit 동작
		function updateValidate() {

			var $phone2 = $("#phone2");
			var $phone3 = $("#phone3");
			var $email = $("#email");

			// 전화번호 유효성 검사
			var regExp1 = /^\d{3,4}$/; // 숫자 3~4 글자
			var regExp2 = /^\d{4,4}$/; // 숫자 4 글자

			if (!regExp1.test($phone2.val()) || !regExp2.test($phone3.val())) {
				validateCheck.phone2 = false;
			} else {
				validateCheck.phone2 = true;
			}

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
				value : $("#phone1").val() + "-" + $("#phone2").val() + "-"
						+ $("#phone3").val()
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

		//******************** 번호 select **************************
		// select의 value는 script로 처리

		/*(function(){
			// #phone1의 자식 중 option 태그들을 반복 접근
			$("#phone1 > option").each(function(index, item){
				// index : 현재 접근 중인 인덱스
				// item : 현재 접근 중인 요소
				
				// 현재 접근한 요소의 내용이 phone[0]과 같을 경우
				if($(item).text() == "${phone[0]}"){
					// 현재 접근한 요소에 selected 속성 추가
					$(item).prop("selected", true);
				}
			});
		})(); */

		//******************** 관심 분야 체크  ***************************
		(function() {

			var interest = "${loginMember.memberInterest}".split(",");

			$("input[name='memberInterest']").each(function(index, item) {

				if (interest.indexOf($(item).val()) != -1) {
					$(item).prop("checked", true);
				}
			});
		})();

		//******************** 관심 분야 체크  ***************************
	</script>

</body>
</html>
