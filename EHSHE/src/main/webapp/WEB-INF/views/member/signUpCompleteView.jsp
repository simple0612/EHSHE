<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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

.ehshe-text {
  font-size: 2rem; 
	font-weight:bold;
  text-align:center;
}

.form-control {
	height: 3rem !important;
	border-radius: 1rem !important;
}

.btn {
	margin-top: 0.5rem;
	font-size: 14px !important;
	font-weight: 500 !important;
	color: #404040 !important;
  background-color: #F5DF4D !important;
}

.btn:hover{
	background-color: #f0d700 !important;
}
    
</style>


</head>
<body>	
	<div class="form-wrapper">
		<div class="form-container">
			<div class="ehshe-text">
				<a href="${contextPath}">EHSHE</a>
			</div>
				
			<br>

			<%-- 가입 환영 --%>
				<div class="form-group">
					<input type="text" id="memberId" name="memberId" placeholder="아이디를 입력해주세요" class="form-control" 
								 value="<%-- ${cookie.saveId.value} --%>" required autofocus> 
				</div>
	
				<div class="form-label-group">
					<input type="password" id="memberPwd" name="memberPwd" placeholder="비밀번호를 입력해주세요" class="form-control" required> 
				</div>
	
		</div>		
	</div> <%-- form-wrapper %-->

	<%-- footer include --%>
	<jsp:include page="../common/footer.jsp" />		
	
</body>

</html>

