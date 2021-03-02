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

.form-container {
	margin: auto;
	height: 100%;
  max-width: 350px;
}

.form-header {
	margin-top: 15px;	
  text-align:center;
  font-size: 30px; 
  color: #404040;
}

.text-pw, .text-find {
	font-size: 20px;
	font-weight: 600; 
	color : #404040;
} 

.text-guide {
	font-size: 16px;
 	font-weight: 600;
	color: #7c7c7c;
	text-align: center;
}

.form-control {
	height: 3rem !important;
	border-radius: 1rem !important;
}

.form-group {
	margin-bottom: 0 !important;
}

.findPwBtn-area {
	text-align: center;
}

.findPwBtn {
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

.findPwBtn:hover{
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
		
		<div class="form-header">
			<span class="text-pw">비밀번호</span>
			<span class="text-find" style="color : #909090; font-weight: normal;">찾기</span>
		</div>
		
		<br>
		<div class="text-guide"> 아이디, 이메일로 <br>
	  	비밀번호를 찾습니다.		
	  </div>
		
		<br>
		<%-- 비밀번호 찾기 form --%>
		<form action="findPw" method="post">
			<div class="form-container">
				<div class="form-group">
					<input type="text" id="memberId" name="memberId" placeholder="아이디를 입력해주세요." class="form-control" required autofocus> 
				</div>
				
				<div class="col-md-12 offset-md mb-2">
					<span id="checkId">&nbsp;</span>
				</div>
	
				<div class="form-group">
					<input type="email" id="memberEmail" name="memberEmail" placeholder="이메일을 입력해주세요." class="form-control" required> 
				</div>
			
				<div class="col-md-12 offset-md mb-2">
					<span id="checkEmail">&nbsp;</span>
				</div>
				
				<div class="form-group">
					<input type="email" id="certify" name="certify" placeholder="인증번호를 입력해주세요." class="form-control"> 
				</div>
				
				<br>
			</div> <%-- form-container --%>
			<div class="hr"></div>
			
			<br>					
			<div class="findPwBtn-area">
				<button class="btn btn-lg findPwBtn certifyCheck" type="submit">조회하기</button>			
			</div>
		</form>
				
		<br>	
	</div> <%-- form-wrapper %-->

	<%-- 유효성 검사 및 이메일 인증 js --%>
	<script src="${contextPath}/resources/js/findPw1.js"></script>	

	<%-- footer include --%>
	<jsp:include page="../common/footer.jsp" />		
</body>
</html>

