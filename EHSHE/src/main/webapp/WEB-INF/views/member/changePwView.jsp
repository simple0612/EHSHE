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

		<!-- sweetalert : alert창을 꾸밀 수 있게 해주는 라이브러리 https://sweetalert.js.org/ -->
  	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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

.text-newPw {
	font-size: 20px;
	font-weight: 600; 
	color : #404040;
} 

#input-margin {
	margin-bottom: 20px;
}

.form-body {
	margin: auto;
	height: 100%;
  max-width: 350px;
}

.pw-info {
	font-size: 12px;
 	font-weight: 600;
	color: #7c7c7c;
}

.form-control {
	height: 3rem !important;
	border-radius: 1rem !important;
}

.form-group {
	margin-bottom: 0 !important;
}

.changePwBtn-area {
	text-align: center;
}

.changePwBtn {
	border: none;
	width: 100%;
	height: 2.8rem;
	max-width: 350px;
	font-weight: 600;
	font-size: 15px;
	color: #191919;
	background-color: #f6f6f6;
	border-radius: 1rem;
}

.changePwBtn:hover{
	background-color: #dbdbdb !important;
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
	<div class="form-wrapper">
		<div class="title">
			<a href="${contextPath}">EHSHE</a>
		</div>
	
		<br>
		<div class="hr"></div>
		
		<div class="form-header">
			<span class="text-newPw">새로운 비밀번호를 입력해 주세요.</span>
		</div>
			
		<br>
		<%-- 비밀번호 찾기 form --%>
		<form action="updatePw" method="post" onsubmit="return validate();">
			<div class="form-container">
				<div class="form-group">
					<input type="password" id="newPw1" name="newPw1" placeholder="비밀번호를 입력해주세요." class="form-control" required autofocus> 
				</div>
				
				<div class="col-md-12 offset-md mb-2">
					<span id="checkPw1">&nbsp;</span>
				</div>
	
				<div class="form-group" id="input-margin">
					<input type="password" id="newPw2" name="newPw2" placeholder="비밀번호를 재입력해주세요." class="form-control" required> 
				</div>
				
				<div class="col-md-12 offset-md mb-2">
					<span id="checkPw2">&nbsp;</span>
				</div>
				
				<div class="form-body">
					<div class="pw-info"> * 비밀번호는 6~12자의 영문 대소문자 조합하여 설정해 주세요.</div>
					<div class="pw-info"> * 안전한 계정 사용을 위해 비밀번호는 주기적으로 변경해 주세요.</div>
				</div>
			</div> <%-- form-container --%>
			
			<br>
			<div class="hr"></div>
			
			<br>					
			<div class="changePwBtn-area">
				<button class="btn btn-lg changePwBtn" type="submit">완료</button>			
			</div>
		</form>
				
		<br>	
	</div> <%-- form-wrapper --%>
	
	<%-- 유효성 검사 및 이메일 인증 js --%>
	<script src="${contextPath}/resources/js/changePw.js"></script>
	
	<%-- footer include --%>
	<jsp:include page="../common/footer.jsp" />		
</body>
</html>