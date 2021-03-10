/* 카카오 로그인 */
Kakao.init('d3198cad73fdf76ad8b09239d1011d94');
function klogin() {
    Kakao.Auth.login({
        scope:'profile, account_email',
        success: function(authObj) {
            //console.log(authObj);
            Kakao.API.request({
                url: '/v2/user/me',
                    success: res => {
                    const kakao_account = res.kakao_account
                    //console.log(kakao_account);
                    //console.log(kakao_account.profile.nickname);
                    //console.log(kakao_account.email);
                      
                    $.ajax({
                       url: "kakaoLogin",
                       data: {
                          "memberId": kakao_account.email,
                          "memberNm": kakao_account.profile.nickname,
                          "memberPw": Kakao.Auth.getAccessToken()
                       },
                       type: "post",
                       success: function(loginMember){
                         	location.href = "../";                            	  	                    
                         	                                                     	  	                    
                          console.log(Kakao.Auth.getAccessToken());
                          //console.log(loginMember);
                       },
                       error: function(){
                          console.log("ajax 통신 실패");
                       }
                    });  
                }
            });
        },
        fail: function() {
            alert('err');
        }
    });   
}

    
// 카카오톡 로그아웃
function klogout(){
 	if(!Kako.Auth.getAccessToken()){
	//console.log('Not logged in');
	return;
	} 

 	Kakao.Auth.logout(function(){
 	console.log(Kakao.Auth.getAccessToken());
 	});
}

Kakao.API.request({
	  url: '/v1/user/unlink',
	  success: function(response) {
	    console.log(response);
	  },
	  fail: function(error) {
	    console.log(error);
	  },
	});
   	