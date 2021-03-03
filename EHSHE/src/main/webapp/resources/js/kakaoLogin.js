	/* 카카오 로그인 */
    window.Kakao.init('d3198cad73fdf76ad8b09239d1011d94');
    function klogin() {
        window.Kakao.Auth.login({
            scope:'profile, account_email',
            success: function(authObj) {
                //console.log(authObj);
                window.Kakao.API.request({
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
                              swal({icon:"success", title:"로그인 성공!"}).then(function(){
	                             	window.location.href = "../";                            	  
                              });	                    
                              //console.log(Kakao.Auth.getAccessToken());
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