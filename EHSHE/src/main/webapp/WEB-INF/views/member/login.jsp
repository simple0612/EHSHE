<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style>

*{margin : 0; padding : 0; box-sizing : border-box;}

.form-wrapper{
	margin: 40px 0 100px 0;
}

.form-container {
	margin: auto;
	height: 100%;
  max-width: 350px;
}

.form-header{
    text-align:center; 
}

.form-text-member, .form-text-login {
	font-size: 26px;
	font-weight: 600; 
	color : #404040;
  text-align:center;
}

.form-control{
	height: 3rem !important;
	border-radius: 1rem !important;
}

.info-member .list-member {
	list-style: none;
	float: none;
	text-align: center;
	}

li {
	display: inline-block;
	float: none;
	vertical-align: top;
	}

.btn{
	margin-top: 0.5rem;
	font-size: 16px !important;
	font-weight: 500 !important;
	color: #404040 !important;
  background-color: #F5DF4D !important;
}

.login-sns{
	text-align: center;
}

.link-sns{
	display: inline-block;
}
    
</style>


</head>
<body>
		<div class="row">
			<%-- header include--%>
			<jsp:include page="../common/header.jsp" />
		</div>
		
		<div class="form-wrapper">
			<div class="form-container">
					<div class="form-header">
						<h2 style="font-size: 30px; color: #404040;">EHSHE</h2>
						
						<br>
						
						<div class="form-text">
							<span class="form-text-member">회원</span>
							<span class="form-text-login" style="color : #909090; font-weight: normal;">로그인</span>
						</div>
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
					<label> 
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
							<a href="<%-- ${contextPath}/member/--%>" style="color: #212529;">아이디 찾기</a>									
						</li>
						<li>ㅣ</li>
						<li>
							<a href="<%-- ${contextPath}/member/--%>" style="color: #212529;">비밀번호 찾기</a>
						</li>
						<li>ㅣ</li>
						<li>
							<a href="<%-- ${contextPath}/member/--%>" style="color: #212529;">회원가입</a>
						</li>
					</ul>								
				</div>
					
		</div>
		
		<br>
		
		<div style="margin:auto; width: 50%; min-width:320px; border-top: 1px solid #e6e6e6; text-align:center;"></div>

		<br>

		<%-- SNS 로그인 영역--%>
		<div class="form-container">
			<div class="form-header">
				<div class="form-text">
					<span class="form-text-member">간편</span>
					<span class="form-text-login" style="color : #909090; font-weight: normal;">로그인</span>
				</div>
			</div>
		</div>
		
		<br>
		
		<div class="login-sns">
			<span class="link-sns">
				<a href="<%-- ${contextPath}/member/ --%>">
				<img src ="${contextPath}/resources/images/kakao.png" style="width: 61px; height: 61px; margin-bottom: 5px">
				<br> 카카오 로그인</a>
			</span>

			&nbsp;&nbsp;&nbsp;

			<span class="link-sns">
				<a href="<%-- ${contextPath}/member/ --%>">
				<img src ="${contextPath}/resources/images/naver.png" style="width: 61px; height: 61px; margin-bottom: 5px">
				<br> 네이버 로그인</a>
			</span>
		</div>		
	</div>

	<%-- footer include --%>
	<jsp:include page="../common/footer.jsp" />
		
</body>

</html>

