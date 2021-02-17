<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
	<title>Ehshe Project</title>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
	
		<!-- sweetalert : alert창을 꾸밀 수 있게 해주는 라이브러리 https://sweetalert.js.org/ -->
  	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body id="page-top">
	<c:if test="${!empty swalTitle}">
		<script>
			swal({icon  : "${swalIcon}",
				  title : "${swalTitle}",
				  text  : "${swalText}"});
		</script>
	</c:if>

	<a class="nav-link" href="${contextPath}">데이트</a>
	<a class="nav-link" href="${contextPath}">SHOP</a>
	<a class="nav-link" href="${contextPath}">커뮤니티</a>
	<a class="nav-link" href="${contextPath}/member/loginpage">Login</a>
    
</body>
</html>