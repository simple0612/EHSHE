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
<title>나만의 장소 등록</title>
<link rel="stylesheet" href="${contextPath}/resources/css/board/insertBoard.css">
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
            <div class="col-md-8">
                <div class="row">
                    <div class="col-md-12">
                        <h4>장소 등록</h4>
                    </div>
                </div>
                <div class="col-md-9">
                    <table class="table1">
                        <tbody>
                            <tr class="name">
                                <td>장소 이름</td>
                                <td colspan="2"><input class="form-control mr-sm-2" type="text" /></td>
                            </tr>
                            <tr class="addr">
                                <td>주소</td>
                                <td>
                                    <input class="form-control mr-sm-2" type="text"/>
                                </td>
                                <td>
                                    <button class="btn btn-secondary">검색</button>
                                </td>
                            </tr>
                            <tr class="addr1">
                                <td></td>
                                <td colspan="2"><input class="form-control mr-sm-2" type="text" /></td>
                            </tr>
                            <tr class="addr2">
                                <td></td>
                                <td colspan="2"><input class="form-control mr-sm-2" type="text" /></td>
                            </tr>
                            <tr>
                                <td>소개</td>
                                <td>썸머노트 공간</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-3"></div>
                <div class="col-md-12">

                </div>
                <div class="col-md-12 buttonArea">
                    <button class="btn btn-secondary insert-place">취소</button>
                    <button class="btn btn-secondary insert-place">등록</button>
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