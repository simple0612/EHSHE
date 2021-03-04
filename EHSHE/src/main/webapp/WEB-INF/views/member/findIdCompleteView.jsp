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

.form-header {
	margin: auto;
	width: 100%;
	max-width: 350px;
  font-size: 30px; 
  color: #404040;
}

.textInfo {
	font-size: 20px;
	font-weight: 600; 
	color : #404040;
} 

.info-user {
	font-size: 16px;
 	font-weight: 600;
	color: #7c7c7c;
}
	
.form-body {
	margin: auto;
	height: 100%;
  max-width: 350px;
}

.findIdViewBtn-area {
	text-align: center;
}

.findIdViewBtn {
	border: none;
	width: 100%;
	height: 2.8rem;
	max-width: 350px;
	font-weight: 600;
	font-size: 15px;
	color: #191919;
	background-color: #F5DF4D;
	border-radius: 1rem;
}

.findIdViewBtn:hover {
	background-color: #f0d700 !important;
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
		<div class="form-header">
			<div class="textInfo">입력한 정보와 일치하는 <br> EHSHE 계정을 확인해주세요. </div>
		</div>
		
		<br>
		<div class="hr" style="margin-bottom: 11.5px;"></div>
		
		<br>
		<div class="form-body">
			<div class="info-user" style="color: #404040"> 아이디 : ${memberInfo.memberId} </div>
			<br>
			<div class="info-user"> 이름    &nbsp;&nbsp;&nbsp;: ${memberInfo.memberNm} </div>
			<div class="info-user"> 이메일 : ${memberInfo.memberEmail} </div>
		</div>

		<br>
		<div class="hr" style="margin-top: 11.5px;"></div>		
			
		<br>
		<div class="findIdViewBtn-area">
			<button class="btn btn-lg findIdViewBtn" type="button" onclick="location.href='${contextPath}/member/loginView'">로그인</button>			
		</div>
			
		<br>		
	</div> <%-- form-wrapper --%>
	
	<%-- footer include --%>
	<jsp:include page="../common/footer.jsp" />		
</body>
</html>

