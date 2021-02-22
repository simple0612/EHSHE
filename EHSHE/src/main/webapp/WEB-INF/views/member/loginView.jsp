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

.ehshe-text > a, .ehshe-text > a:link{
 	text-decoration: none;
	color: #404040;
}

.form-control {
	height: 3rem !important;
	border-radius: 1rem !important;
}

.info-member .list-member {
	list-style: none;
	float: none;
	text-align: center;
	margin-bottom: 30px
	}

li {
	display: inline-block;
	float: none;
	vertical-align: top;
	}
	
li > a, li > a:link {
	text-decoration: none;
	color: rgba(0,0,0,0.7);
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

.header-sns {
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

.login-sns{
	text-align: center;
}

.link-sns{
	display: inline-block;
}

.link-sns > a, .link-sns > a:link {
	text-decoration: none;
	color: rgba(0,0,0,0.7);
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

			<%-- 로그인 form --%>
			<form action="<%-- login --%>" method="post" class="form-signin">
				<div class="form-group">
					<input type="text" id="memberId" name="memberId" placeholder="아이디를 입력해주세요" class="form-control" 
								 value="<%-- ${cookie.saveId.value} --%>" required autofocus> 
				</div>
	
				<div class="form-label-group">
					<input type="password" id="memberPwd" name="memberPwd" placeholder="비밀번호를 입력해주세요" class="form-control" required> 
				</div>
	
				<br>
				
				<div class="checkbox">
					<label style="color : rgba(0,0,0,0.7);"> 
						<input type="checkbox" name="save" id="save"
							<c:if test="<%-- ${!empty cookie.saveId.value} --%>">
								checked
							</c:if>
						> 아이디 저장
					</label>
				</div>
				<button class="btn btn-lg btn-block" type="submit">로그인</button>			
			</form>
			
			<br>
		
			<div class="info-member">
				<ul class="list-member">
					<li>
						<a href="<%-- ${contextPath}/member/--%>">아이디 찾기</a>									
					</li>
					<li>ㅣ</li>
					<li>
						<a href="<%-- ${contextPath}/member/--%>">비밀번호 찾기</a>
					</li>
					<li>ㅣ</li>
					<li>
						<a href="${contextPath}/member/tosView">회원가입</a>
					</li>
				</ul>								
			</div>			
		</div> <%-- form-container %-->
		
		<%-- line --%>
		<div style="margin:auto; width: 50%; min-width:320px; border-top: 1px solid #e6e6e6; text-align:center;"></div>

		<%-- SNS 로그인 영역--%>
		<div class="form-container">
			<div class="header-sns">
				<span class="text-sns">간편</span>
				<span class="text-login" style="color : #909090; font-weight: normal;">로그인</span>
			</div>
		</div>
	
		<br>
	
		<div class="login-sns">
			<span class="link-sns">
				<a href="<%-- ${contextPath}/member/ --%>">
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
	</div> <%-- form-wrapper %-->

	<%-- footer include --%>
	<jsp:include page="../common/footer.jsp" />		
	
</body>

</html>

