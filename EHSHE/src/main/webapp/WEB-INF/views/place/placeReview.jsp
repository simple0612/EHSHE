<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>EHSHE 데이트</title>
<link rel="stylesheet" href="${contextPath}/resources/css/place/placeReview.css">
<script src="https://kit.fontawesome.com/5a7a3b1a34.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
    integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
    crossorigin="anonymous"></script>


	<style>
		
	</style>
</head>

<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-8 reviewArea">
                <div class="row reviewHeader">
                    <div class="col-md-2">
                        <h4>리뷰</h4>
                    </div>
                    <div class="col-md-10">
                        <h6>전체(232) | 최고(120) | 보통(20) | 별로(12)</h6>
                    </div>
                </div>
                <div class="row review">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-10">
                        <p>2021-02-18</p>
                        <p>
                            Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. Aliquam eget sapien sapien. Curabitur in metus urna. In hac habitasse platea dictumst. Phasellus eu sem sapien, sed vestibulum velit. Nam purus nibh, lacinia non faucibus et, pharetra in dolor. Sed iaculis posuere diam ut cursus. <em>Morbi commodo sodales nisi id sodales. Proin consectetur, nisi id commodo imperdiet, metus nunc consequat lectus, id bibendum diam velit et dui.</em> Proin massa magna, vulputate nec bibendum nec, posuere nec lacus. <small>Aliquam mi erat, aliquam vel luctus eu, pharetra quis elit. Nulla euismod ultrices massa, et feugiat ipsum consequat eu.</small>
                        </p>
                        <img src="썸네일.png" alt="">
                        <img src="썸네일.png" alt="">
                        <img src="썸네일.png" alt="">
                        <img src="썸네일.png" alt="">
                    </div>
                </div>
                <div class="row review">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-10">
                        <p>2021-02-18</p>
                        <p>
                            Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. Aliquam eget sapien sapien. Curabitur in metus urna. In hac habitasse platea dictumst. Phasellus eu sem sapien, sed vestibulum velit. Nam purus nibh, lacinia non faucibus et, pharetra in dolor. Sed iaculis posuere diam ut cursus. <em>Morbi commodo sodales nisi id sodales. Proin consectetur, nisi id commodo imperdiet, metus nunc consequat lectus, id bibendum diam velit et dui.</em> Proin massa magna, vulputate nec bibendum nec, posuere nec lacus. <small>Aliquam mi erat, aliquam vel luctus eu, pharetra quis elit. Nulla euismod ultrices massa, et feugiat ipsum consequat eu.</small>
                        </p>
                        <img src="썸네일.png" alt="">
                        <img src="썸네일.png" alt="">
                        <img src="썸네일.png" alt="">
                        <img src="썸네일.png" alt="">
                    </div>
                </div>
                <div class="row review">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-10">
                        <p>2021-02-18</p>
                        <p>
                            Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. Aliquam eget sapien sapien. Curabitur in metus urna. In hac habitasse platea dictumst. Phasellus eu sem sapien, sed vestibulum velit. Nam purus nibh, lacinia non faucibus et, pharetra in dolor. Sed iaculis posuere diam ut cursus. <em>Morbi commodo sodales nisi id sodales. Proin consectetur, nisi id commodo imperdiet, metus nunc consequat lectus, id bibendum diam velit et dui.</em> Proin massa magna, vulputate nec bibendum nec, posuere nec lacus. <small>Aliquam mi erat, aliquam vel luctus eu, pharetra quis elit. Nulla euismod ultrices massa, et feugiat ipsum consequat eu.</small>
                        </p>
                        <img src="썸네일.png" alt="">
                        <img src="썸네일.png" alt="">
                        <img src="썸네일.png" alt="">
                        <img src="썸네일.png" alt="">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
            </div>
        </div>
    </div>
	
	<jsp:include page="../common/footer.jsp" />
	
	<script>
	
	</script>
	
	
</body>
</html>