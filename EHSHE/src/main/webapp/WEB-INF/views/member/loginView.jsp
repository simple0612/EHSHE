<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jquery  -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- bootStrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
    		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/5a7a3b1a34.js" crossorigin="anonymous"></script>

<title>EHSHE</title>

<style>

*{margin : 0; padding : 0; box-sizing : border-box;}

.form-wrapper {
	margin: 50px 0 120px 0;
} 

.form-container {
	margin: auto;
	height: 100%;
  max-width: 350px;
}

.title {
  font-size: 2rem; 
	font-weight: bold;
  text-align: center;
}

.title > a {
 	text-decoration: none;
	color: #404040;
}

.hr {
	margin: auto; 
	width: 40%; 
	min-width: 350px; 
	text-align: center;
	border-top: 1px solid #e6e6e6; 
}

/* 체크박스 css */
input[id="saveId"] {
	display: none;
}

input[id="saveId"] + label em { /* 인접요소 선택자 */
    display : inline-block;
    width: 16px;
    height: 16px;
    margin: 0 5px 3px 0;
    background: url(${contextPath}/resources/images/checkOut.png) 0 0 no-repeat;
    vertical-align: middle;
}

input[id="saveId"]:checked + label em {
    background: url(${contextPath}/resources/images/check.png) 0 0 no-repeat;
}

.form-control {
	height: 3rem !important;
	border-radius: 1rem !important;
}

.info-user, .list-user {
	float: none;
	list-style: none;
	text-align: center;
	margin-bottom: 30px;
	}

.list-user > li {
	float: none;
	display: inline-block;
	}
	
.list-user a, .list-user > a:link {
	text-decoration: none;
	color: rgba(0,0,0,0.7);
}

.btn {
	border: none;
	width: 100%;
	height: 2.8rem;
	margin-top: 0.7rem;
	max-width: 350px;
	font-weight: 600;
	font-size: 15px;
	color: #191919;
	background-color: #F5DF4D;
	border-radius: 1rem;
}

.btn:hover{
	background-color: #f0d700 !important;
}

.title-sns {
	margin-top: 15px;	
  text-align:center;
  font-size: 30px; 
  color: #404040;
}

.text-sns, .text-login {
	font-size: 20px;
	font-weight: 600; 
	color : #404040;
} 

.img-area{
	text-align: center;
}

.link-sns{
	display: inline-block;
}

.link-sns > a {
	text-decoration: none;
	color: rgba(0,0,0,0.7);
}

.link-sns > a:hover {
	color: #007bff;
}
    
</style>

</head>
<body>	
	<div class="form-wrapper">
		<div class="title">
			<a href="${contextPath}">EHSHE</a>
		</div>	
		
		<br>
		<div class="hr"></div>
	
		<br>
		<div class="form-container">
		<%-- 로그인 form --%>
			<form action="login" method="post">
				<div class="form-group">
					<input type="text" id="memberId" name="memberId" placeholder="아이디를 입력해주세요." class="form-control" 
								 value="${cookie.saveId.value}" required autofocus> 
				</div>	
				<div class="form-group">
					<input type="password" id="memberPw" name="memberPw" placeholder="비밀번호를 입력해주세요." class="form-control" required> 
				</div>
	
				<br>			
				<div class="checkbox">
					<input type="checkbox" id="saveId" name="saveId"
	
					<c:if test="${!empty cookie.saveId.value}"> checked </c:if>
	
					>
	   		 	<label for="saveId"><em></em>&nbsp; 아이디 저장</label>	
				</div>
				<button class="btn btn-lg btn-block" type="submit">로그인</button>			
			</form>
			
			<br>		
			<div class="info-user">
				<ul class="list-user">
					<li>
						<a href="findIdView">아이디 찾기</a>									
					</li>
					<li>ㅣ</li>
					<li>
						<a href="findPwView">비밀번호 찾기</a>
					</li>
					<li>ㅣ</li>
					<li>
						<a href="tosView">회원가입</a>
					</li>
				</ul>								
			</div>			
		</div> <%-- form-container end --%>
		
		<div class="hr"></div>
	
		<%-- SNS 로그인 --%>
		<div class="title-sns">
			<span class="text-sns">간편</span>
			<span class="text-login" style="color : #909090; font-weight: normal;">로그인</span>
		</div>

		<br>
		<div class="img-area">
			<span class="link-sns">
				<a href="javascript:klogin();">
				<img src ="${contextPath}/resources/images/kakao.png" style="width: 51px; height: 51px; margin-bottom: 5px">
				<br> 카카오 로그인</a>
			</span>
	
			&nbsp;&nbsp;&nbsp;	
			<span class="link-sns">
				<a href="<%-- ${contextPath}/member/ --%>">
				<img src ="${contextPath}/resources/images/naver.png" style="width: 51px; height: 51px; margin-bottom: 5px">
				<br> 네이버 로그인</a>
			</span>
		</div>		
	</div> <%-- form-wrapper end --%>

	<%-- footer include --%>
	<jsp:include page="../common/footer.jsp" />			
	
	<%-- kakao login --%>
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

	<script>
	/* 카카오 로그인 */
    window.Kakao.init('d3198cad73fdf76ad8b09239d1011d94');
    function klogin() {
        window.Kakao.Auth.login({
            scope:'profile, account_email',
            success: function(authObj) {
                console.log(authObj);
                window.Kakao.API.request({
                    url: '/v2/user/me',
                        success: res => {
                        const kakao_account = res.kakao_account
                        console.log(kakao_account);
                        console.log(kakao_account.profile.nickname);
                        console.log(kakao_account.email);
                          
                        $.ajax({
                           url: "${contextPath}/login/kakaoLogin",
                           data: ({
                              memberEmail: kakao_account.email,
                              memberNick: kakao_account.profile.nickname,
                              /* memberPwd: Kakao.Auth.getAccessToken() */
                           }),
                           type: "post",
                           success: function(result){
                              if(result == 'already'){ // 이미 아이디가 있을 때
                                 window.location.href = "${contextPath}/";
                              }else{
                                 window.location.href = "${contextPath}/login/addModeInfoView";
                              }
                              console.log("성공")
                              console.log(Kakao.Auth.getAccessToken());
                           },
                           error: function(){
                              console.log("tgt")
                           }
                        });
                        
                    }
                });
            },
            fail: function() {
                alert('11');
            }
        });   
    }
	</script>

</body>


</html>

