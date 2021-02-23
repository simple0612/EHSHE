<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인하기</title>
<link rel="stylesheet" href="css/default.css">


<style>

 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}


* {
	margin: 0;
	padding: 0;
	box-sizing: border-box
}

.col-md-3 {
	font-family: 'Note Sans KR', sans-serif;
	top: 100px;
	position: absolute;
	margin: 0 auto;
}

.login-form h1 {
	font-size: 30px;
	color: #999;
	text-align: center;
}

.box {
	margin: 100px auto;
	width: 300px;
	height: 50px;
}

.container-4 input#search {
	width: 300px;
	height: 100px;
	background: #white;
	font-size: 8pt;
	float: left;
	color: #fff;
	padding-left: 100px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

.container-4 button.icon {
	height: 50px;
	width: 50px;
	opacity: 0;
	font-size: 10pt;
	-webkit-transition: all .55s ease;
	-moz-transition: all .55s ease;
	-ms-transition: all .55s ease;
	-o-transition: all .55s ease;
	transition: all .55s ease;
}

.container-4:hover button.icon, .container-4:active button.icon,
	.container-4:focus button.icon {
	outline: none;
	opacity: 1;
	margin-left: 250px;
}

.form-control {
	height: 3rem !important;
	border-radius: 1rem !important;
}

div div {
	text-align: center;
}
</style>

</head>
<body>




	<div class="col-md-12">

		<jsp:include page="../common/header.jsp" />
	</div>
	<div class="col-md-3">




		<div class="area">
			<div>

				<a href="${contextPath}/page/mypagemain"> <img
					src="${contextPath}/resources/images/mypageicon.png"
					style="width: 100px; height: 100px; margin-bottom: 5px"></a>
					
			</div>
			<br> <br>
			<h3>
				maril06님 정말로 회원탈퇴 하시겠습니까? 회원탈퇴 하시려면 비밀번호를 입력해주세요.
			</h3>


			<div class="box">
				<div class="container-4">
					<input type="password" id="memberPwd" name="memberPwd"
						class="form-control" placeholder="비밀번호를 입력해주세요" />
					<button class="icon" >
						<a href="${contextPath}/page/deletememberfinal"> <img
							src="${contextPath}/resources/images/mypageicon.png"
							style="width: 40px; height: 40px; margin-bottom: 5px">
					</button>

				</div>
			</div>
			<br> <br> 	<br> <br> 

		</div>
	</div>
</body>


</body>

<footer>
	<div class="col-md-12">


		<jsp:include page="../common/footer.jsp" />
	</div>

</footer>

</html>
