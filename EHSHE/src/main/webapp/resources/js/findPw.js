// 입력 값들이 유효성 겁사가 진행되어있는지 확인하기 위한 객체 생성
/*var validateCheck = {
    "id": false,
    "name": false,
    "email": false,
	"certify": false
}

var validateCheck2 = {
    "pwd1": false,
    "pwd2": false
}*/

// 아이디 유효성 검사
// 첫 글자는 영어 소문자, 나머지 글자는 영어 대, 소문자 + 숫자, 총 6~12글자
/*$("#id").on("input", function(){
    var regExp = /^[a-z][a-zA-z\d]{5,11}$/;

    var value = $("#id").val();
    if(!regExp.test(value)){
        $("#checkId").text("아이디 형식이 유효하지 않습니다.").css("color", "red");
        validateCheck.id = false;
    }else{
        $("#checkId").text("유효한 아이디 형식입니다.").css("color", "green");
        validateCheck.id = true;
    }
});*/

// 이름 유효성 검사
// 한글 두 글자 이상
/*$("#name").on("input", function(){
    var regExp = /^[가-힇]{2,}$/;

    var value = $("#name").val();
    if(!regExp.test(value)){
        $("#checkName").text("이름 형식이 유효하지 않습니다.").css("color", "red");
        validateCheck.name = false;
    }else{
        $("#checkName").text("유효한 이름 형식입니다.").css("color", "green");
        validateCheck.name = true;
    }
});*/


// 이메일 유효성 검사
/*$("#email").on("input", function(){
    var idc = $("#memId").val();
    var nm = $("#memberName").val();


    console.log(idc);
    console.log(nm);
    var value = $("#email").val();
    if(nm){
            $.ajax({
                url:"myPwdFind.do",
                data: {"email" : value,
                       "memberName": nm,
                       "memId": idc},
                type: "post",
                async : false,
                success: function(num){
                    console.log(num);
                    if(num > 0){
                        $("#checkCertify").text("인증 버튼을 눌러주세요.").css("color", "green");
                    validateCheck.id = true;
					validateCheck.email = true;
                    validateCheck.name = true;
                        $("#memNo").val(num);
                    }else{
                        $("#checkCertify").text("이름 혹은 이메일을 잘못입력하셨습니다.").css("color", "red");
                    validateCheck.id = false;
					validateCheck.email = false;
                    validateCheck.name = false;
                    }
                },
                error:function(){
                    console.log("이메일 확인 과정 중, 에러");
                    validateCheck.id = false;
					validateCheck.email = false;
                    validateCheck.name = false;
                }
            });
        }
});

var sendKey;

// 이메일 인증을 위한 검사
$("#certifyBtn").on("click", function(){
	var email = $("#email").val();//사용자 이메일
	console.log(email)
	console.log(getContextPath())
	
	if(email == "" || !validateCheck.email || !validateCheck.name){//이메일이 입력 안 됐거나 유효성 검사에 실패한 경우
		 swal({icon: "warning", title: "이름과 이메일을 다시 입력해주세요."});
	} else {
		 $.ajax({
				type : 'post',
				url : getContextPath() + '/sendEmail.do',
				data : {"email": email},
				async : false,
				success : function(result){
					$("#checkCertify").text("인증번호가 발송되었습니다.").css("color", "green");
					validateCheck.certify = false;
					console.log(result);
					
					sendKey = result;
				},
				error : function(){
					console.log("인증번호 발송 과정에서 오류 발생");
				}
		});//이메일 전송 ajax 끝
	}
});


function getContextPath() {
   var hostIndex = location.href.indexOf( location.host ) + location.host.length;
   return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};


// 인증 키 일치여부 확인
$("#certifyCheck").on("click", function() {
		if ($("#certify").val() == sendKey) {   //인증 키 값을 비교를 위해 텍스트인풋과 벨류를 비교
			swal({icon: "success",
				  title: "인증 성공!"});
			validateCheck.certify = true;  //인증 성공여부 check
		} else {
			swal({icon: "error",
				  title: "인증 불일치"});
			validateCheck.certify = false; //인증 실패
		}
	});



// 비밀번호 유효성 검사
// 영어 대, 소문자 + 숫자, 총 6~12글자
$("#newPwd1, #newPwd2").on("input", function(){
    var regExp = /^[a-zA-z\d]{6,12}$/;

    var v1 = $("#newPwd1").val();
    var v2 = $("#newPwd2").val();

    if(!regExp.test(v1)){
        $("#checkPwd1").text("비밀번호 형식이 유효하지 않습니다.").css("color", "red");
        validateCheck2.pwd1 = false;
    }else{
        $("#checkPwd1").text("유효한 비밀번호 형식입니다.").css("color", "green");
        validateCheck2.pwd1 = true;
    }

    // 비밀번호가 유효하지 않은 상태에서
    // 비밀번호 확인 작성 시
    if(!validateCheck2.pwd1 && v2.length > 0){
        // 유효성 검사를 하지 않은 상태에서 비번 확인의 길이가 0보다 긴 경우
        swal("유효한 비밀번호를 먼저 작성해주세요.");
        $("#mewPwd2").val(""); // 비밀번호 확인에 입력한 값 삭제
        $("#newPwd1").focus();
    }else{
        // 비밀번호, 비밀번호 확인 일치 여부
        if(v1.length == 0 || v2.length == 0){
            $("#checkPwd2").html("&nbsp;");
        }else if(v1 == v2){
            $("#checkPwd2").text("비밀번호 일치").css("color", "green");
            validateCheck2.pwd2 = true;
        }else{
            $("#checkPwd2").text("비밀번호 불일치").css("color", "red");
            validateCheck2.pwd2 = false;
        }
    }
}); */


// 비밀번호 수정
/* function pwdValidate(){
    var regExp = /^[a-zA-z\d]{6,12}$/;

    if(!regExp.test($("#newPwd1").val())){
        swal("비밀번호 형식이 유효하지 않습니다.");
        $("#newPwd1").focus();

        return false;
    }

    // 새로운 비밀번호와 비밀번호 확인이 일치하지 않을 때
    if($("#newPwd1").val() != $("#newPwd2").val()){
        swal("새로운 비밀번호가 일치하지 않습니다.");

        $("#newPwd1").focus();
        $("#newPwd1").val("");
        $("#newPwd2").val("");

        return false;
    }
} */



// 아이디 찾기 유효성검사
/* function IdFindValidate(){
    for(var key in validateCheck){
        if(!validateCheck[key]){
            // 어떤 key값 중 하나라도 false가 나왔을 때

            var msg;
			var msf;
            switch(key){
                case "name": msg="이름이"; break;
                case "email": msg="이메일이"; break;
            }
			if(key == certify){
				swal({icon: "warning",
					  title: "이메일 인증이 완료되지 않았습니다."});
			}else{
	            swal(msg + " 존재하지 않습니다.");
			}
	        $("#" + key).focus();

            return false;
        }
    }
} */

// 비밀번호 찾기 유효성검사
/*function myInfoFindValidate(){
     for(var key in validateCheck){
        if(!validateCheck[key]){
            // 어떤 key값 중 하나라도 false가 나왔을 때

            var msg;
            switch(key){
                case "id": msg="아이디가"; break;
                case "name": msg="이름이"; break;
                case "email": msg="이메일이"; break;
            }
			if(key == certify){
				swal({icon: "warning",
					  title: "이메일 인증이 완료되지 않았습니다."});
			}else{
	            swal(msg + " 존재하지 않습니다.");
			}
	        $("#" + key).focus();

            return false;
        }
    }
}

// 비밀번호 찾기 유효성검사
function PwdfoFindValidate(){
     for(var key in validateCheck2){
        if(!validateCheck2[key]){
            // 어떤 key값 중 하나라도 false가 나왔을 때

            var msg;
            switch(key){
                case "pwd1":
                case "pwd2": msg="이름이"; break;
            }
			}else{
	            swal(msg + " 존재하지 않습니다.");
			}
	        $("#" + key).focus();

            return false;
    }
}*/