<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jquery  -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- bootStrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
    		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous">
</script>

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/5a7a3b1a34.js" crossorigin="anonymous"></script>

<!-- Postcodify 오픈 소스 -->
<!-- https://www.poesis.org/postcodify/-->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<title>EHSHE</title>

<style>
	/* number 태그 화살표 제거 */
	input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
		{
		-webkit-appearance: none;
		margin: 0;
	}
	
.form-wrapper {
	margin: 50px 0px 120px 0px;
}	

.form-container {
	margin: auto;
	height: 100%;
	max-width: 400px;
}
	
.ehshe-text {
  font-size: 2rem; 
	font-weight:bold;
  text-align:center;
}

.ehshe-text > a, .ehshe-text > a:link{
 	text-decoration: none;
	color: #404040;
}

.form-control {
	height: 2.8rem !important;
	border-radius: 1rem !important;
}

#certifyBtn:hover, #postcodify_search_button:hover {
	background-color: #dbdbdb !important;
}

label {
	font-size: 0.9rem !important;
	margin-top: 10px !important;
}

label > span {
	color:red;
}

.btn {
   height: 2.8rem !important;
   border: 1px solid #dbdbdb;
   border-radius: 1rem !important;
   box-sizing: border-box;
}

.gender-radio {
	margin-top: 15px;
}

.signUpBtn {
	font-size: 16px !important;
	font-weight: 900 !important;
	color: #191919 !important;
	background-color: #F5DF4D;
	border: none;
}

.signUpBtn:hover{
	background-color : #f0d700;
}

</style>
</head>
<body>
	<div class="form-wrapper">		
			<div class="ehshe-text">
				<a href="${contextPath}">EHSHE</a>
			</div>

		<br>
			
		   <div style="margin:auto; width: 48%; min-width:320px; border-top: 1px solid #e6e6e6; text-align:center;"></div>
			
		<br>
		<h5 style="text-align:center;">회원 정보 입력</h5>

		<br>
		
		<div class="form-container">
	
			<form action="signUp" method="POST" class="needs-validation" name="signUpForm" onsubmit="return validate();">

				<%-- 아이디 --%>
				<div class="mb-2 form-row">
					<div class="col-md-3">
						<label for="memberId">아이디 <span>*</span></label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" name="memberId" id="memberId" placeholder="아이디를 입력해주세요." autocomplete="off" required>
					</div>

					<div class="col-md-6 offset-md-3">
						<span id="checkId">&nbsp;</span>
					</div> 
				</div>

				<%-- 비밀번호 --%>
				<div class="row mb-2 form-row">
					<div class="col-md-3">
						<label for="memberPw1">비밀번호  <span>*</span></label>
					</div>
					<div class="col-md-9">
						<input type="password" class="form-control" id="memberPw1" name="memberPw1" placeholder="비밀번호를 입력해주세요." required>
					</div>

					<div class="col-md-6 offset-md-3">
						<span id="checkPw1">&nbsp;</span>
					</div>
				</div>

				<%-- 비밀번호 확인 --%>
				<div class="row mb-2 form-row">
					<div class="col-md-3">
						<label for="memberPw2"></label>
					</div>
					<div class="col-md-9">
						<input type="password" class="form-control" id="memberPw2" placeholder="비밀번호 재입력" required>
					</div>

					<div class="col-md-6 offset-md-3">
						<span id="checkPw2">&nbsp;</span>
					</div>
				</div>

				<%-- 이름 --%>
				<div class="row mb-2 form-row">
					<div class="col-md-3">
						<label for="memberName">이름 <span>*</span></label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" id="memberName" name="memberName" placeholder="이름을 입력해주세요." required>
					</div>

					<div class="col-md-6 offset-md-3">
						<span id="checkName">&nbsp;</span>
					</div>
				</div>

				<%-- 닉네임 --%>
				<div class="row mb-2 form-row">
					<div class="col-md-3">
						<label for="memberNickName">닉네임 <span>*</span></label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" id="memberNickName" name="memberNickName" placeholder="닉네임을 입력해주세요." required>
					</div>

					<div class="col-md-6 offset-md-3">
						<span id="checkNickName">&nbsp;</span>
					</div>
				</div>

				<%-- 전화번호 --%>
				<div class="row mb-2 form-row">
					<div class="col-md-3">
						<label for="memberPhone">휴대번호 <span>*</span></label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control phone" id="memberPhone" name="memberPhone" placeholder=" - 없이 입력해주세요." maxlength="11" required>
					</div>
					<div class="col-md-6 offset-md-3">
						<span id="checkPhone">&nbsp;</span>
					</div>
				</div>

				<%-- 이메일 --%>
				<div class="row mb-2 form-row">
					<div class="col-md-3">
						<label for="memberEmail">이메일 <span>*</span></label>
					</div>
					<div class="col-md-7">
						<input type="email" class="form-control" id="memberEmail" name="memberEmail" placeholder="이메일 주소 입력" autocomplete="off" required>
					</div>
				<%-- 인증 버튼 --%>
				<button class="btn" type="button" id="certifyBtn">&nbsp;인증&nbsp;</button>			
				</div>
					
				<div class="col-md-6 offset-md-3">
					<span id="checkEmail">&nbsp;</span>
				</div>


				
				
				<%-- 이메일 인증 --%>
				<div class="row mb-2 form-row">
					<div class="col-md-3">
						<label for="certify">이메일 인증 <span>*</span></label>
					</div>
					<div class="col-md-7">
						<input type="text" class="form-control" id="certify" name="certify" placeholder="인증번호를 입력해주세요." autocomplete="off" required>
					</div>
				</div>	
				
				<%-- 성별 --%>
				<div class="row">
					<div class="col-md-3">
						<label>성별 <span>*</span></label>
					</div>
					
					<br>
					
					<div class="form-check"> 
						<input class="gender-radio" type="radio" name="gender" id="male" value ='M'>
						<label for="male">
							남성 &nbsp;&nbsp;&nbsp;&nbsp;
						</label>
					</div>
					<div class="form-check">
						<input class="gender-radio" type="radio" name="gender" id="female"  value='Y'>
						<label for="female">
							여성
						</label>
					</div>
				</div>

				<br>
				
				<%-- 주소 --%>
				<div class="row mb-2 form-row">
					<div class="col-md-3">
						<label for="postcodify_search_button">주소</label>
					</div>
					<div class="col-md-4">
						<input type="text" name="post" class="form-control postcodify_postcode5">
					</div>
					<div class="col-md-3">
						<button type="button" class="btn" id="postcodify_search_button">검색</button>
					</div>
				</div>

				<div class="row mb-2 form-row">
					<div class="col-md-3">
						<label for="address1"></label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control postcodify_address" name="address1" id="address1">
					</div>
				</div>

				<div class="row mb-2 form-row">
					<div class="col-md-3">
						<label for="address2"></label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control postcodify_details" name="address2" id="address2">
					</div>
				</div>

				<hr class="mb-8">

				<button class="btn btn-lg btn-block signUpBtn" type="submit">가입하기</button>
			</form>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script>
	// postcodify popup
	$(function() {
		$("#postcodify_search_button").postcodifyPopUp();
	});
	</script>

	<script>

		// 유효성 검사 결과를 저장할 객체
		var signUpCheck = {
			"id" : false,
			"pwd1" : false,
			"pwd2" : false,
			"name" : false,
			"phone2" : false,
			"email" : false
		};
	
		// 실시간 유효성 검사 --------------------
		// 정규표현식
		var $memberId("#memberId");
		var $memberPw1("#memberPw1");
		var $memberPw2("#memberPw2");
		var $memberName("#memberName");
		var $memberNickName("#memberNickName");
		var $memberPhone("#memberPhone");
		var $memberEmail("#memberEmail");
		
		// 아이디 유효성 검사 
		$memberId.on("input", function(){
			//영어 대,소문자 + 숫자, 총 6~12글자
			var regExp = /^[a-z][a-zA-z\d]{5,11}$/;
			
			if (!regExp.test($memberId.val())) {
				$("#checkId").text("아이디 형식이 유효하지 않습니다.").css("color", "red");
				signUpCheck.id = false;
			} else {
				
				// 아이디 중복검사 AJAX --------------------
				$.ajax({
					url : "idDupCheck",
					data : {"memberId" : $memberId.val()}, // key : value 형식으로 넘겨줌
					type : "post",
					success : function(result){
						//console.log(result);
						
						if(result == 0){ // 중복 x == 사용 가능한 아이디
							$("#checkId").text("사용 가능한 아이디 입니다.").css("color", "green");
							signUpCheck.id = true;
						} else {
							$("#checkId").text("이미 사용중인 아이디 입니다.").css("color", "red");
							signUpCheck.id = false;							
						}					
					},
					error : function(){
						console.log("ajax 통신 실패");
					}
				}); // AJAX 
			}
		}); // 아이디 유효성 검사
		
		
		// 비밀번호 유효성 검사
		$("#memberPw1, #memberPw2").on("input",function() {
			//영어 대,소문자 + 숫자, 총 6~12글자
			var regExp = /^[A-Za-z0-9]{6,12}$/;
	
			// 비밀번호1
			if (!regExp.test($("#memberPw1").val())) {
				$("#checkPw1").text("비밀번호 형식이 유효하지 않습니다.").css("color", "red");
				signUpCheck.memberPw1 = false;
			} else {
				$("#checkPw2").text("유효한 비밀번호 형식입니다.").css("color", "green");
				signUpCheck.memberPw1 = true;
			}
	
			// 비밀번호1이 유효하지 않은 상태로 비밀번호 2를 작성하는 경우
			if (!signUpCheck.memberPw1 && $memberPw2.val().length > 0) {
				swal("유효한 비밀번호를 작성해 주세요.");
				$memberPw2.val("");
				$memberPw1.focus();
			} else if (signUpCheck.memberPw1 && $memberPw2.val().length > 0) {
				if ($("#memberPw1").val().trim() != $("#memberPw2").val().trim()) {
					$("#checkPw2").text("비밀번호 불일치").css("color", "red");
					signUpCheck.memberPw2 = false;
				} else {
					$("#checkPw2").text("비밀번호 일치").css("color", "green");
					signUpCheck.memberPw2 = true;
				}
			}
		}); // 비밀번호 유효성 검사
		
		
		// 이름 유효성 검사
		$memberName.on("input", function() {
			// 한글 두 글자 이상
			var regExp = /^[가-힣]{2,}$/;
	
			if (!regExp.test($(this).val())) {
				$("#checkName").text("한글 두 글자 이상을 입력하세요.").css("color", "red");
				signUpCheck.memberName = false;
			} else {
				$("#checkName").text("정상입력").css("color", "green");
				signUpCheck.memberName = true;
			}
		}); // 이름 유효성 검사 
		
		
		// 닉네임 유효성 검사
		$memberNickName.on("input", function() {
			// 한글 + 영어 대,소문자 + 아무숫자, 총 2~10글자
			var regExp = /^[가-힣a-zA-Z\d]{2,10}$/;
	
			if (!regExp.test($(this).val())) {
				$("#checkNickName").text("적절하지 않은 닉네임 입니다.").css("color", "red");
				signUpCheck.memberNickName = false;
			} else {
				$("#checkNickName").text("정상입력").css("color", "green");
				signUpCheck.memberNickName = true;
			}
		}); // 닉네임 유효성 검사 
		
		
		// 휴대번호 유효성 검사
		$memberPhone.on("input", function() {
	
			// 전화번호 input 태그에 11글자 이상 입력하지 못하게 하는 이벤트
			if ($(this).val().length > $(this).prop("maxLength")) {
				$(this).val($(this).val().slice(0, $(this).prop("maxLength")));
			}
	
			// 숫자 11 글자
			var regExp = /^\d{1,11}$/;
	
			if (!regExp.test($memberPhone.val()) {
				$("#checkPhone").text("전화번호가 유효하지 않습니다.").css("color", "red");
				signUpCheck.memberPhone = false;
			} else {
				$("#checkPhone").text("유효한 전화번호입니다.").css("color", "green");
				signUpCheck.memberPhone = true;
			}
		}); // 휴대번호 유효성 검사
		
		
		// 이메일 유효성 검사
		$memberEmail.on("input",function() {
			// 4글자 아무단어 @ 아무단어 . * 3
			var regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;
	
			if (!regExp.test($(this).val())) { // 이메일이 정규식을 만족하지 않을경우
				$("#checkEmail").text("이메일 형식이 유효하지 않습니다.").css("color", "red");
				signUpCheck.memberEmail = false;
			} else {
				$("#checkEmail").text("유효한 이메일 형식입니다.").css("color", "green");
				signUpCheck.memberEmail = true;
			}
		});
		
		
		// 유효성 검사
		function validate() {
		
			for ( var key in signUpCheck) {
				if (!signUpCheck[key]) {
					var str;
					switch (key) {
					case "memberId" : str = "아이디"; break;
					case "memberPw1": str = "비밀번호";	break;
					case "memberPw2": str = "비밀번호 확인";break;
					case "memberName": str = "이름";	break;
					case "memberNickName": str = "닉네임";	break;
					case "memberPhone":str = "휴대번호";break;
					case "memberEmail": str = "이메일"; break;
					}
		
					swal({icon:"warning", title:str + " 형식이 유효하지 않습니다."})
					.then(function(){
						var memberId = "#" + key;
						$(memberId).focus();
					});
					
					return false;
				}
			}
		}
	</script>
</body>
</html>
