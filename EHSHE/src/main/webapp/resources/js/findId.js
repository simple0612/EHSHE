// 유효성 검사 결과를 저장할 객체

var findIdCheck = {
	"memberEmail" : false,
	"certificationCheck" : false
};

// 실시간 유효성 검사 --------------------
// 정규표현식
var $memberEmail = $("#memberEmail");
var $certify = $("#certify");
	
	
	// 이메일 유효성 검사
	$memberEmail.on("input",function() {
		// 4글자 아무단어 @ 아무단어 . * 3
		var regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;

		if (!regExp.test($(this).val())) {
			$("#checkEmail").text("이메일 형식이 올바르지 않습니다.").css("color", "red").css("visibility","visible");
			findIdCheck.memberEmail = false;
		} else {
			$("#checkEmail").css("visibility", "hidden");
			findIdCheck.memberEmail = true;
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
	        	findIdCheck.certificationCheck = false;
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
			 findIdCheck.certificationCheck = false;
			} else {
			 $("#certificationCheck").css("visibility","hidden");
			 findIdCheck.certificationCheck = true;
			 console.log(findIdCheck.certificationCheck)
			}
		});
	});
	
	// 유효성 검사로 가입 버튼 제어
	$(function(){
		$("input").on("input", function(){

			if(
				findIdCheck.memberEmail 
			&& findIdCheck.certificationCheck == true){

				$(".findIdBtn").attr("style", "background-color: #F5DF4D !important;")
				.mouseover(function(){
					$(this).attr("style", "background-color: #f0d700 !important;");	
				})		
				.mouseout(function(){
					$(this).attr("style", "background-color: #F5DF4D !important;");	
				})
			} else {
				$(".findIdBtn").attr("style", "background-color: #f6f6f6 !important;")
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
	
		for ( var key in findIdCheck) {
			if (!findIdCheck[key]) {
				var str;
				switch (key) {	
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