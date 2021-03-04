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
    		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous">
</script>

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
	font-weight:bold;
  text-align:center;
}

.title > a, .title > a:link{
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

.welcome-area {
	font-size: 20px;
	text-align: center;
	color: #252525;
}

.img-area {
	width: 350px;
	height: 200px;
	background: url(${contextPath}/resources/images/heart.png) 0 0 no-repeat;	
}

.text-guide {
	font-size: 14px;
	font-weight: 600;
	color: #959595;
	text-align: center;
	
}

.toLoginBtn-area {
	text-align: center;
}

.btn-login {
	border: none;
	width: 100%;
	height: 2.8rem;
	max-width: 350px;
	font-weight: 600;
	font-size: 16px;
	color: #191919;
	background-color: #F5DF4D;
	border-radius: 1rem;
}

.btn:hover{
	background-color: #f0d700;
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

		<div class="form-container">		
			
			<br>
			<div class="welcome-area">
				<span class="member-name"> ${loginMember.memberId} 님, </span>
				<span class="welcome-text"> 환영합니다! </span>
			</div>

			<br>						
			<div class=img-area></div>

			<br>
			<div class="text-guide"> EHSHE 가입이 완료되었습니다. <br>
					  로그인하시면 다양한 서비스를 이용하실 수 있습니다.		
		  </div>
		</div> <%-- form-wrapper --%>		

		<br>
    <div class="hr"></div>

		<br>
		<div class="toLoginBtn-area">
			<button class="btn btn-lg btn-login" onclick="location.href='${contextPath}/member/loginView'">로그인</button>
		</div>
	</div> <%-- form-wrapper --%>

	<%-- footer include --%>
	<jsp:include page="../common/footer.jsp" />		
	
</body>
</html>

