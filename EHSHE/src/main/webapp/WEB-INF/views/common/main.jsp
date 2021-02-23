<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Ehshe Project</title>
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<script src="https://kit.fontawesome.com/5a7a3b1a34.js" crossorigin="anonymous"></script>
<style>
body{
    height:100vh;
    background: url(resources/images/mainbackground3.jpg) no-repeat center center;
    background-size: cover;
}
nav{
    opacity: 0.7;
}


</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	
	<div class="main-section">
        <main class="intro">
        </main>

        <section class="about">
            <div class="inner">
                <div class="about-content">
                    <div class="description">
                        <h4>따듯한 공간</h4>
                        <h4>우리만의 데이트</h4>
                        <h4>우리만의 아이템</h4>
                        <p>
                            Spending more time together<br> — a common result of lockdowns, furloughs and layoffs — <br>
                            has been
                            a blessing for some couples who gain greater appreciation of one another.
                        </p>
                    </div>
                    <div class="photo_area">
                        <img src="${contextPath}/resources/images/mainPhotoSection1.jpg">
                    </div>
                </div>
            </div>
        </section>
    </div>
	
	
	
	<jsp:include page="footer.jsp" />
</body>
</html>