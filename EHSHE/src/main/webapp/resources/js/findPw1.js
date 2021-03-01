// 입력 값들이 유효성 겁사가 진행되어있는지 확인하기 위한 객체 생성
var checkValidation = {
    "memberId": false,
    "memberEmail": false
//	"certify": false
}

// 실시간 유효성 검사 -------------------
// 정규표현식
var $memberId = $("#memberId");
var $memberEmail = $("#memberEmail");

// 아이디 유효성 검사 
$memberId.on("input", function() {
	//영어 대,소문자 + 숫자, 총 5~12글자
	var regExp = /^[a-z][a-zA-z\d]{4,11}$/;
	
	if(!regExp.test($(this).val())) {
		$("#checkId").text("아이디 형식이 유효하지 않습니다.").css("color", "red");
		checkValidation.memberId = false;
	} else {
		$("#checkId").text("").css("color", "green");
		checkValidation.memberId = true;							
	}					
}); // 아이디 유효성 검사

// 이메일 유효성 검사
$memberEmail.on("input",function() {
	// 4글자 아무단어 @ 아무단어 . * 3
	var regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;

	if (!regExp.test($(this).val())) {
		$("#checkEmail").text("이메일 형식이 유효하지 않습니다.").css("color", "red");
		checkValidation.memberEmail = false;
	} else {
		$("#checkEmail").text("").css("color", "green");
		checkValidation.memberEmail = true;
	}
});