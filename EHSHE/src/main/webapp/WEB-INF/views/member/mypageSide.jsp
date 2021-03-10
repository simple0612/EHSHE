<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  


<style>
body {
	font-family: "Lato", sans-serif;
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #F5DF4D;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover {
	color: #f1f1f1;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

#test_btn12 {
	position: fixed;
	top: 100px;
	left: 30px;
	height: 40px;
	width: 40px;
	text-align: center;
	background: #F5dF4D;
	border-radius: 3px;
	cursor: pointer;
	transition: left 0.4s ease;
	z-index: 20;
}

#btn_group12 button {
	border: 1px solid skyblue;
	background-color: #F5DF4D;
	color: #818181;
	padding: 5px;
}

#btn_group12 button:hover {
	color: white;
	background-color: #818181;
}


.popup ul{
    display: none;
}

.popup >ul a{
    font-size:14px;
}

 .popup a i{
    margin-left: 10px;
}
 .popup a:hover i{
    transform: rotate(-180deg);
}
.ul li:hover ul li{
    height:50px;
    padding-left:20px;
}

</style>
</head>
<body>

	<div id="mySidenav" class="sidenav">

		<div>
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		</div>
		<a href="#">마이페이지</a>

		<ul class="sideMenu">

			<li><a href="${contextPath}/member/mapage">내정보</a></li>

			<li class="popup"><a href="${contextPath}/shop/shopMain">결제내역</a>
				<ul>
					<li><a href="${contextPath}/shop/shopList/1">Clothes</a></li>
					<li><a href="${contextPath}/shop/shopList/2">Accessory</a></li>
					<li><a href="${contextPath}/shop/shopList/3">etc</a></li>
				</ul></li>
			<li><a href="${contextPath}/board/boardList">내글</a></li>
			<li><a href="${contextPath}/board/boardList">즐겨찾기</a></li>
		</ul>
	</div>
	<div id="btn_group12">
		<button id="test_btn12" onclick="openNav()">my</button>
	</div>

	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "250px";

			var box1 = document.getElementById("btn_group12");

			box1.style.display = "none";

		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";

			var box1 = document.getElementById("btn_group12");
			box1.style.display = "block";
		}
	</script>

</body>
</html>
