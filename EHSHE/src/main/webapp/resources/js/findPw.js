// 입력 값들이 유효성 검사가 진행되어있는지 확인하기 위한 객체 생성
var findPwCheck = {
    "memberId": false,
    "memberEmail": false,
		"certificationCheck" : false
}

// 실시간 유효성 검사 --------------------
// 정규표현식
var $memberId = $("#memberId");
var $memberEmail = $("#memberEmail");


// 이메일 유효성 검사
$memberEmail.on("input",function() {
	// 4글자 아무단어 @ 아무단어 . * 3
	var regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;

	if (!regExp.test($(this).val())) {
		$("#checkEmail").text("이메일 형식이 올바르지 않습니다.").css("color", "red").css("visibility","visible");
		findPwCheck.memberEmail = false;
	} else {
		$("#checkEmail").css("visibility", "hidden");
		findPwCheck.memberEmail = true;
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
	        	$("#certificationCheck").text("인증번호가 발송되었습니다.").css("color", "green");
	        	findPwCheck.certificationCheck = false;
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
			if($(this).val() != code || $(this).val() == 0){
			 $("#certificationCheck").text("인증번호가 불일치합니다.").css("color", "red");				
			 findPwCheck.certificationCheck = false;
			} else {
			 $("#certificationCheck").text("인증번호가 일치합니다.").css("color", "green");
			 findPwCheck.certificationCheck = true;
			}
		});
	});


	// 유효성 검사
	function validate() {
	
		for ( var key in findPwCheck) {
			if (!findPwCheck[key]) {
				var str;
				switch (key) {
				case "memberId" : str = "아이디"; break;
				case "memberEmail": str = "이메일"; break;
				case "certificationCheck": str = "이메일 인증"; break;
				}
	
				var member = "#" + key;
				swal({icon:"warning", title:str + " 형식이 유효하지 않습니다."})			
					.then(function(){
						$(member).focus();
					});
					if(key == 'certificationCheck') {
						swal({icon:"warning", title: "인증 번호를 확인해 주세요."});
						$(certify).focus();
					}
					return false;								
				}
			}
		}