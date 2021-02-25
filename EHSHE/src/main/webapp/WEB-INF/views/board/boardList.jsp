<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextPath"
	value="${pageContext.servletContext.contextPath}" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>나만의 장소</title>

<link rel="stylesheet"
	href="${contextPath}/resources/css/board/boardList.css">

<style>

</style>
	
	
</head>

<body>
	<jsp:include page="../common/header.jsp"/>
	<br>
	<div class="container-fluid boardMain">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-12 myPlace-header">
						<h3>나만의 장소</h3>
					</div>
				</div>
				<div class="row myPlace">
					<div class="col-md-3">
						<div class="row">
							<div class="card">
								<img class="card-img-top" alt="Bootstrap Thumbnail"
									src="${contextPath}/resources/images/thumbnailBox.png" />
								<div class="card-block">
									<span class="card-title">포로리야</span> <span class="card-like">❤112</span><br>
									<span class="card-text">노원구 - 파라미터</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="row">
							<div class="card">
								<img class="card-img-top" alt="Bootstrap Thumbnail"
									src="${contextPath}/resources/images/thumbnailBox.png" />
								<div class="card-block">
									<span class="card-title">포로리야</span> <span class="card-like">🧡32</span><br>
									<span class="card-text">노원구 - 파라미터</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="row">
							<div class="card">
								<img class="card-img-top" alt="Bootstrap Thumbnail"
									src="${contextPath}/resources/images/thumbnailBox.png" />
								<div class="card-block">
									<span class="card-title">포로리야</span> <span class="card-like">💛21</span><br>
									<span class="card-text">노원구 - 파라미터</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="row">
							<div class="card">
								<img class="card-img-top" alt="Bootstrap Thumbnail"
									src="${contextPath}/resources/images/thumbnailBox.png" />
								<div class="card-block">
									<span class="card-title">포로리야</span> <span class="card-like">❤44</span><br>
									<span class="card-text">노원구 - 파라미터</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<div class="row">
							<div class="card">
								<img class="card-img-top" alt="Bootstrap Thumbnail"
									src="${contextPath}/resources/images/thumbnailBox.png" />
								<div class="card-block">
									<span class="card-title">포로리야</span> <span class="card-like">❤</span><br>
									<span class="card-text">노원구 - 파라미터</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="row">
							<div class="card">
								<img class="card-img-top" alt="Bootstrap Thumbnail"
									src="${contextPath}/resources/images/thumbnailBox.png" />
								<div class="card-block">
									<span class="card-title">포로리야</span> <span class="card-like">❤</span><br>
									<span class="card-text">노원구 - 파라미터</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="row">
							<div class="card">
								<img class="card-img-top" alt="Bootstrap Thumbnail"
									src="${contextPath}/resources/images/thumbnailBox.png" />
								<div class="card-block">
									<span class="card-title">포로리야</span> <span class="card-like">❤</span><br>
									<span class="card-text">노원구 - 파라미터</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="row">
							<div class="card">
								<img class="card-img-top" alt="Bootstrap Thumbnail"
									src="${contextPath}/resources/images/thumbnailBox.png" />
								<div class="card-block">
									<span class="card-title">포로리야</span> <span class="card-like">❤</span><br>
									<span class="card-text">노원구 - 파라미터</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 insert-btn">
						<button type="button" class="btn btn-warning ">글쓰기</button>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<nav>
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#">Previous</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a>
								</li>
							</ul>
						</nav>
					</div>
					<div class="col-md-2"></div>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<form class="form-inline selectBox">
							<select class="form-control mr-sm-2 search-bottom" type="text">
								<option value="all">전체</option>
								<option value="title">제목</option>
								<option value="category">카테고리</option>
							</select> <input id="search-input" class="form-control mr-sm-2"
								type="text" />
							<button class="btn btn-warning my-2 my-sm-0" type="submit">
								검색</button>
						</form>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"/>

	<script>
		
	</script>




</body>
</html>