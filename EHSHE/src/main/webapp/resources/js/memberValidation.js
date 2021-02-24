	// 유효성 검사 결과를 저장할 객체
/*	var signUpCheck = {
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

		if (!regExp.test($memberPhone.val())) {
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
	} */