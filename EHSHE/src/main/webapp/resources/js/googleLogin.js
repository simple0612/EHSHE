/* 구글 로그인 */
var googleUser = {};

function init() {
	gapi.load('auth2', function() {
		console.log("init");
		auth2 = gapi.auth2.init({
			client_id: '615360582092-qfuk3argrhcsqv59ad6a3g4un91e88s8.apps.googleusercontent.com'
		});
	attachSignin(document.getElementById('googleLogin'));
	});
}


/* 구글 로그인 API2 */
function attachSignin(element) {
    auth2.attachClickHandler(element, {},
        function(googleUser) {
    		var profile = googleUser.getBasicProfile();
    		var id_token = googleUser.getAuthResponse().id_token;
			console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			console.log('ID토큰: ' + id_token);
			console.log('Name: ' + profile.getName());
			console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
			$(function() {
				$.ajax({
				    url: 'googleLogin',
				    type: 'post',
				    data: {
						"memberId" : profile.getId(),
						"memberNm": profile.getName()
					},
				    success: function (data) {
						location.href="../";
					}
				});
			})
        }, function(error) {
          console.log(JSON.stringify(error, undefined, 2));
        });
    console.log("google api end");
  }
  
/* 구글 로그아웃 API2 */
/*
function gLogout() {
	var  auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(function () {
		console.log('User signed out.');
	});
}
*/
  