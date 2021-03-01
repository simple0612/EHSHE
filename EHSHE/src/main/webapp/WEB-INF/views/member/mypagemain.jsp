<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/default.css">


<style>
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box
}

.form-container {
	margin: auto;
	height: 100%;
	max-width: 350px;
}

.col-md-3 {
	font-family: 'Note Sans KR', sans-serif;
	left: 100px;
	top: 100px;
	position: absolute;
	margin: auto;
}

.login-form h1 {
	font-size: 32px;
	color: #999;
	text-align: center;
}

.area {
	text-align: center;
	display: inline-block;
}

h3 {
	text-align: center;
	display: inline-block;
}

.titl {
	text-align: center;
	left: 200px;
}
</style>



</head>
<body>



	<div class="col-md-12 ">

		<jsp:include page="../common/header.jsp" />
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="form-container">
	<div class="titl">
		<h1>마이페이지</h1>


	</div>
	</div>
	<div class="form-container">



	
			<div class="area">
				<a href="${contextPath}/page/checkpassward"> <img
					src="${contextPath}/resources/images/mypageicon.png"
					style="width: 200px; height: 200px; margin-bottom: 5px">
					<h1>내정보</h1>
			</div>

			<div class="area">
				<a href="${contextPath}/page/paymentdetails"><img
					src="${contextPath}/resources/images/pricelist.png"
					style="width: 200px; height: 200px; margin-bottom: 5px">
					<h1>결제내역</h1>
			</div>

		
		<br> <br>
		
			<div class="area">
				<a href="${contextPath}/page/mywrite"><img
					src="${contextPath}/resources/images/mytextlist.png"
					style="width: 200px; height: 200px; margin-bottom: 5px">
					<h1>내글</h1>
			</div>
			<div class="area">
				<a href="${contextPath}/page/bookmark"><img
					src="${contextPath}/resources/images/myfavorite.png"
					style="width: 200px; height: 200px; margin-bottom: 5px">
					<h1>즐겨 찾기</h1>
			</div>
		
		<br> <br> <br> <br> <br> <br> <br>
		<br>
	</div>






	<jsp:include page="../common/footer.jsp" />


</body>
</html>