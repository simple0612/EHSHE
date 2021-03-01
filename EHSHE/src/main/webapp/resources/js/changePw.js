// 입력 값들이 유효성 겁사가 진행되어있는지 확인하기 위한 객체 생성
var checkValidation = {
    "newPw1": false,
    "newPw2": false
}

// 실시간 유효성 검사 -------------------
// 비밀번호 유효성 검사
$("#newPw1, #newPw2").on("input", function(){
		//영어 대,소문자 + 숫자, 총 6~12글자
		var regExp = /^[A-Za-z0-9]{6,12}$/;

    var v1 = $("#newPw1").val();
    var v2 = $("#newPw2").val();

    if(!regExp.test(v1)){
        $("#checkPw1").text("비밀번호 형식이 유효하지 않습니다.").css("color", "red");
        checkValidation.newPw1 = false;
    }else{
        $("#checkPw1").text("").css("color", "green");
        checkValidation.newPw1 = true;
    }

    // 비밀번호가 유효하지 않은 상태에서
    // 비밀번호 확인 작성 시
    if(!checkValidation.newPw1 && v2.length > 0){
        // 유효성 검사를 하지 않은 상태에서 비번 확인의 길이가 0보다 긴 경우
        $("#checkPw1").text("비밀번호를 입력해주세요.").css("color", "red");
        $("#newPw2").val(""); // 비밀번호 확인에 입력한 값 삭제
    }else{
        // 비밀번호, 비밀번호 확인 일치 여부
        if(v1.length == 0 || v2.length == 0){
           // $("#checkPw2").html("&nbsp;");
        }else if(v1 == v2){
            $("#checkPw2").text("비밀번호 일치").css("color", "green");
            checkValidation.newPw2 = true;
        }else{
            $("#checkPw2").text("비밀번호 불일치").css("color", "red");
            checkValidation.newPw2 = false;
        }
    }
});