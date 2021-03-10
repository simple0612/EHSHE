// 유효성 검사 결과를 저장할 객체
var signUpCheck = {
	"memberId" : false,
	"memberPw1" : false,
	"memberPw2" : false,
	"memberNm" : false,
	"memberPhone" : false,
	"memberEmail" : false,
	"certificationCheck" : false
};

// 실시간 유효성 검사 --------------------
// 정규표현식
var $memberId = $("#memberId");
var $memberPw1 = $("#memberPw1");
var $memberPw2 = $("#memberPw2");
var $memberNm = $("#memberNm");
var $memberPhone = $("#memberPhone");
var $memberEmail = $("#memberEmail");
var $certify = $("#certify");
	
	// 아이디 유효성 검사 
	$memberId.on("input", function(){
		//영어 대,소문자 + 숫자, 총 5~12글자
		var regExp = /^[a-z][a-zA-z\d]{4,11}$/;
		
		if(!regExp.test($memberId.val())) {
			$("#checkId").text("아이디 형식이 올바르지 않습니다.").css("color", "red").css("visibility","visible");
			signUpCheck.memberId = false;
		
		} else {	
			// 아이디 중복검사 AJAX --------------------
			$.ajax({
				url : "idDupCheck",
				data : {"memberId" : $memberId.val()}, // key : value 형식으로 넘겨줌
				type : "post",
				success : function(result){
					//console.log(result);
					
					if(result == 0){ // 중복 x == 사용 가능한 아이디
						$("#checkId").css("visibility", "hidden");
						signUpCheck.memberId = true;
					} else {
						$("#checkId").text("이미 사용중인 아이디 입니다.").css("color", "red").css("visibility","visible");
						signUpCheck.memberId = false;							
					}					
				},
				error : function(){
					console.log("ajax 통신 실패");
				}
			}); // 아이디 중복 검사 (AJAX) 
		}
	}); // 아이디 유효성 검사
	
	
	// 비밀번호 유효성 검사
	$("#memberPw1, #memberPw2").on("input",function() {
		//영어 대,소문자 + 숫자, 총 6~12글자
		var regExp = /^[A-Za-z0-9]{6,12}$/;

		// 비밀번호1
		if (!regExp.test($("#memberPw1").val())) {
			$("#checkPw").text("영문 대소문자 + 숫자, 6 ~ 12 자").css("color", "red").css("visibility","visible");
			signUpCheck.memberPw1 = false;
		} else {
			$("#checkPw").css("visibility", "hidden");
			signUpCheck.memberPw1 = true;
		}

		// 비밀번호1이 유효하지 않은 상태로 비밀번호 2를 작성하는 경우
		if (!signUpCheck.memberPw1 && $memberPw2.val().length > 0) {
				$("#checkPw").css("visibility","hidden");
				$memberPw2.val("");
				$memberPw1.focus();

		} else if (signUpCheck.memberPw1 && $memberPw2.val().length > 0) {
			if ($("#memberPw1").val().trim() != $("#memberPw2").val().trim()) {
				$("#checkPw").text("비밀번호가 일치하지 않습니다.").css("color", "red").css("visibility","visible");
				signUpCheck.memberPw2 = false;
			} else {
				$("#checkPw").css("visibility", "hidden");
				signUpCheck.memberPw2 = true;
			}
		}
	}); // 비밀번호 유효성 검사
	
	
	// 이름 유효성 검사
	$memberNm.on("input", function() {
		// 한글 두 글자 이상
		var regExp = /^[가-힣]{2,}$/;

		if (!regExp.test($(this).val())) {
			$("#checkNm").text("한글 두 글자 이상을 입력해주세요.").css("color", "red").css("visibility","visible");
			signUpCheck.memberNm = false;
		} else {
			$("#checkNm").css("visibility", "hidden");
			signUpCheck.memberNm = true;
		}
	}); // 이름 유효성 검사 
	
	// 휴대번호 유효성 검사
	$memberPhone.on("input", function() {

		// 전화번호 input 태그에 11글자 이상 입력하지 못하게 하는 이벤트
		if ($(this).val().length > $(this).prop("maxLength")) {
			$(this).val($(this).val().slice(0, $(this).prop("maxLength")));
		}

		// - 제외, 01 + (0,1,6,7,8,9) 이후 아무숫자 3 ~ 4, 아무숫자 4글자
		var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{5})$/;

		if (!regExp.test($memberPhone.val())) {
			$("#checkPhone").text("전화번호의 형식이 올바르지 않습니다.").css("color", "red").css("visibility","visible");
			signUpCheck.memberPhone = false;
		} else {
			$("#checkPhone").css("visibility", "hidden");
			signUpCheck.memberPhone = true;
		}
	}); // 휴대번호 유효성 검사
	
	
	// 이메일 유효성 검사
	$memberEmail.on("input",function() {
		// 4글자 아무단어 @ 아무단어 . * 3
		var regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;

		if (!regExp.test($(this).val())) {
			$("#checkEmail").text("이메일 형식이 올바르지 않습니다.").css("color", "red").css("visibility","visible");
			signUpCheck.memberEmail = false;
		} else {
			$("#checkEmail").css("visibility", "hidden");
			signUpCheck.memberEmail = true;
		}
	}); 
	
	// 이메일 인증 검사	
	// 이메일 인증 번호 저장을 위한 변수
	var code = "";
	
	// 인증번호 이메일 전송
	$("#certifyBtn").on("click", function(){
	    var email = $("#memberEmail").val(); // 입력한 이메일
	    
	    $.ajax({   
	        url: "mailCheck?email=" + email,
	        type: "GET",
	        success: function(data) {
	        	console.log(data)
	        	$("#checkEmail").text("인증번호가 발송되었습니다.").css("color", "green").css("visibility", "visible");
	        	signUpCheck.certificationCheck = false;
	        	code = data;
	        },
  				error : function(){
						console.log("ajax 통신 실패");
					}
	    });
	}); 
	
	// 인증 번호 비교
	$(function(){
		$("#certify").on("input", function(){
			$("#checkEmail").css("visibility", "hidden");
			if($(this).val() != code || $(this).val() == 0){
			 $("#certificationCheck")	
			 signUpCheck.certificationCheck = false;
			} else {
			 $("#certificationCheck").css("visibility","hidden");
			 signUpCheck.certificationCheck = true;
			 console.log(signUpCheck.certificationCheck)
			}
		});
	});
	
	// 유효성 검사로 가입 버튼 제어
	$(function(){
		$("input").on("input", function(){
			console.log(signUpCheck.certificationCheck)
			
			if( signUpCheck.memberId && signUpCheck.memberPw1 && signUpCheck.memberPw2 &&
			signUpCheck.memberNm && signUpCheck.memberPhone && 
			signUpCheck.memberEmail 
			&& signUpCheck.certificationCheck == true){

				$(".signUpBtn").attr("style", "background-color: #F5DF4D !important;")
				.mouseover(function(){
					$(this).attr("style", "background-color: #f0d700 !important;");	
				})		
				.mouseout(function(){
					$(this).attr("style", "background-color: #F5DF4D !important;");	
				})
			} else {
				$(".signUpBtn").attr("style", "background-color: #f6f6f6 !important;")
				.mouseover(function(){
					$(this).attr("style", "background-color: #dbdbdb !important;");	
				})		
				.mouseout(function(){
					$(this).attr("style", "background-color: #f6f6f6 !important;");	
				}) 
			} 
		});
	});
	
	function validate() {
	
		for ( var key in signUpCheck) {
			if (!signUpCheck[key]) {
				var str;
				switch (key) {
				case "memberId" : str = "아이디"; break;
				case "memberPw1": str = "비밀번호";	break;
				case "memberPw2": str = "비밀번호 확인";break;
				case "memberNm": str = "이름";	break;
				case "memberPhone":str = "휴대번호";break;
				case "memberEmail": str = "이메일"; break;
				case "certificationCheck": str = "이메일 인증"; break;
				}
	
				var member = "#" + key;
				swal({title:"EHSHE", text:str + " 형식이 유효하지 않습니다."})			
					.then(function(){
						$(member).focus();
					});
					if(key == 'certificationCheck') {
						swal({title : "EHSHE", 
						      text  : "인증 번호를 다시 확인해 주세요."});
						$("#certify").focus();
					}
				return false;								
			}	
		}
	}