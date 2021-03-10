<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id" content="615360582092-qfuk3argrhcsqv59ad6a3g4un91e88s8.apps.googleusercontent.com">

<!-- jquery  -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- bootStrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
    		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/5a7a3b1a34.js" crossorigin="anonymous"></script>

<!-- sweetalert : alert창을 꾸밀 수 있게 해주는 라이브러리 https://sweetalert.js.org/ -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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

.loginTitle {
  font-size: 2rem; 
	font-weight: bold;
  text-align: center;
}

.loginTitle > a {
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
	height: 3rem ;
	border-radius: 1rem;
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
	
.list-user a {
	text-decoration: none;
	color: rgba(0,0,0,0.7);
}

.list-user a:hover {
	color: #007bff;
}

.loginBtn {
	height: 2.8rem;
	margin-top: 0.7rem;
	font-weight: 600;
	font-size: 15px;
	color: #191919;
	background-color: #f6f6f6;
	border-radius: 1rem;
}

.loginBtn:hover {
	background-color: #dbdbdb;
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
	margin: 0 30px 0 30px;
}

.link-sns > a {
	text-decoration: none;
	color: rgba(0,0,0,0.7);
}

.link-sns > a:hover {
	color: #007bff;
}

.snsIcon {
	width: 51px; 
	height: 51px; 
	margin-bottom: 5px;
}

.swal-button {
	background-color: #F5DF4D;
}

.swal-button:not([disabled]):hover {
	background-color: #f0d700;
}

.swal-button:focus {
	box-shadow: 0 0 0 3px #fff;
}
</style>

</head>
<body>	
	<c:if test="${!empty swalTitle}">
		<script>
			swal({title : "${swalTitle}",
				    text  : "${swalText}"});
		</script>
	</c:if>
	
	<div class="form-wrapper">
		<div class="loginTitle">
			<a href="${contextPath}">EHSHE</a>
		</div>	
		
		<br>
		<div class="hr"></div>
	
		<br>
		<div class="form-container">
		<%-- 로그인 form --%>
			<form action="login" method="post">
				<div class="form-group">
					<input type="text" id="memberId" name="memberId"  class="form-control" placeholder="아이디를 입력해주세요."
								 value="${cookie.saveId.value}" required autofocus> 
				</div>	
				<div class="form-group">
					<input type="password" id="memberPw" name="memberPw" class="form-control" placeholder="비밀번호를 입력해주세요." required> 
				</div>
	
				<br>			
				<div class="checkbox">
					<input type="checkbox" id="saveId" name="saveId"
	
					<c:if test="${!empty cookie.saveId.value}"> checked </c:if>
	
					>
	   		 	<label for="saveId"><em></em>&nbsp; 아이디 저장</label>	
				</div>
				<button class="btn btn-block loginBtn" type="submit">로그인</button>			
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
				<img src ="${contextPath}/resources/images/kakao.png" class="snsIcon">
				<br> 카카오 </a>
			</span>
	
			<span class="link-sns">
 				<a href="javascript:init();" id="googleLogin">
				<img src ="${contextPath}/resources/images/google.png" class="snsIcon">
				<br> 구글 </a>
			</span>
		</div>		
	</div> <%-- form-wrapper end --%>
	
	<%-- kakao JDK --%>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
		
	<%-- google API --%>
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>

	<%-- kakao Login JS --%>
	<script src="${contextPath}/resources/js/kakaoLogin.js"></script>
	
	<%-- google Login JS --%>
	<script src="${contextPath}/resources/js/googleLogin.js"></script>

	<%-- footer include --%>
	<jsp:include page="../common/footer.jsp" />			

	<script>
	// 로그인 버튼 색 변경
	// 부트스트랩 사용 시, 속성 변경할 경우 !important가 필요
	// -> .css() 메서드는 !important 안되므로  .atrr() 사용		
	$("#memberId").on("input", function(){
		$("#memberPw").on("input", function(){			
			if($("#memberId").val().trim().length != 0 && 
					$("#memberPw").val().trim().length != 0){
				$(".loginBtn").attr("style", "background-color: #F5DF4D")
				.mouseover(function(){
					$(this).attr("style", "background-color: #f0d700 !important;");	
				})		
				.mouseout(function(){
					$(this).attr("style", "background-color: #F5DF4D");	
				});
				
			}else{
				$(".loginBtn").attr("style", "background-color: #f6f6f6")
				.mouseover(function(){
					$(this).attr("style", "background-color: #f0d700 !important;");	
				})		
				.mouseout(function(){
					$(this).attr("style", "background-color: #F5DF4D");	
				});	 
			}
		});	
	});

	$("#memberPw").on("input", function(){
		$("#memberId").on("input", function(){
			if($("#memberId").val().trim().length != 0 && 
					$("#memberPw").val().trim().length != 0){
				$(".loginBtn").attr("style", "background-color: #F5DF4D")
				.mouseover(function(){
					$(this).attr("style", "background-color: #f0d700 !important;");	
				})		
				.mouseout(function(){
					$(this).attr("style", "background-color: #F5DF4D");	
				}) ;
				
			}else{
				$(".loginBtn").attr("style", "background-color: #f6f6f6")
				.mouseover(function(){
					$(this).attr("style", "background-color: #f0d700 !important;");	
				})		
				.mouseout(function(){
					$(this).attr("style", "background-color: #F5DF4D");	
				});	 
			}
		});
	});	
</script>
  
</body>
</html>

