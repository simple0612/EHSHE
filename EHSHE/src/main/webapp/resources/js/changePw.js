// 입력 값들이 유효성 겁사가 진행되어있는지 확인하기 위한 객체 생성
var checkValidation = {
    "newPw1": false,
    "newPw2": false
}

var $newPw1 = $("#newPw1");
var $newPw2 = $("#newPw2");
// 실시간 유효성 검사 -------------------

	// 비밀번호 유효성 검사
	$("#newPw1, #newPw2").on("input",function() {
		//영어 대,소문자 + 숫자, 총 6~12글자
		var regExp = /^[A-Za-z0-9]{6,12}$/;

		// 비밀번호1
		if (!regExp.test($("#newPw1").val())) {
			$("#checkPw1").text("비밀번호 형식이 올바르지 않습니다.").css("color", "red").css("visibility","visible");
			checkValidation.newPw1 = false;
		} else {
			$("#checkPw1").css("visibility", "hidden");
			checkValidation.newPw1 = true;
		}

		// 비밀번호1이 유효하지 않은 상태로 비밀번호 2를 작성하는 경우
		if (!checkValidation.newPw1 && $newPw2.val().length > 0) {
				$("#checkPw1").css("visibility","hidden");
				$newPw2.val("");
				$newPw1.focus();

		} else if (checkValidation.newPw1 && $newPw2.val().length > 0) {
			if ($("#newPw1").val().trim() != $("#newPw2").val().trim()) {
				$("#checkPw2").text("비밀번호가 일치하지 않습니다.").css("color", "red").css("visibility","visible");
				checkValidation.newPw2 = false;
			} else {
				$("#checkPw2").css("visibility", "hidden");
				checkValidation.newPw2 = true;
			}
		}
	}); // 비밀번호 유효성 검사

    // 유효성 검사로 가입 버튼 제어
	$(function(){
		$("input").on("input", function(){
			
			if(
				checkValidation.newPw1 && 
				checkValidation.newPw2){

				$(".changePwBtn").attr("style", "background-color: #F5DF4D !important;")
				.mouseover(function(){
					$(this).attr("style", "background-color: #f0d700 !important;");	
				})		
				.mouseout(function(){
					$(this).attr("style", "background-color: #F5DF4D !important;");	
				})
			} else {
				$(".changePwBtn").attr("style", "background-color: #f6f6f6 !important;")
				.mouseover(function(){
					$(this).attr("style", "background-color: #dbdbdb !important;");	
				})		
				.mouseout(function(){
					$(this).attr("style", "background-color: #f6f6f6 !important;");	
				}) 
			} 
		});
	});
