<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
<
style type ="text /css ">a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: blue;
	text-decoration: underline;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box
}

.col-md-7 {
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
	display: inline-block;
}

h3 {
	text-align: center;
	display: inline-block;
}

.titl {
	
	text-align: center;
}


.tit2 {
	width: 1240px;
	height 200px;
	text-align: center;
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
	<div class="titl">
		<h1>내글</h1>
		<br> <br>
		<div>

			<a href="${contextPath}/page/mypagemain"> <img
				src="${contextPath}/resources/images/mytextlist.png"
				style="width: 100px; height: 100px; margin-bottom: 5px">
			</a>
		</div>

	</div>
	<div class="col-md-7">



		<div class="tit2">
			<div class="area">

				<a href="${contextPath}/page/bulletin"> <img
					src="${contextPath}/resources/images/bulletin.png"
					style="width: 200px; height: 200px; margin-bottom: 5px">
					<h1>게시글</h1>
			</div>

			<div class="area">
				<a href="${contextPath}/page/review"><img
					src="${contextPath}/resources/images/review.png"
					style="width: 200px; height: 200px; margin-bottom: 5px">
					<h1>후기</h1>
			</div>

			<div class="area">
				<a href="${contextPath}/page/myQandA"><img
					src="${contextPath}/resources/images/QandA.png"
					style="width: 200px; height: 200px; margin-bottom: 5px">
					<h1>Q&A</h1>
			</div>
		</div>
		<br> <br> <br> <br> <br> <br> <br>
		<br>
	</div>






	<jsp:include page="../common/footer.jsp" />

</body>
</html>