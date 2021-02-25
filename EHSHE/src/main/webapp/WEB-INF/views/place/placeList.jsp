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
<title>EHSHE 데이트</title>
<link rel="stylesheet"
	href="${contextPath}/resources/css/place/placeList.css">
<script src="https://kit.fontawesome.com/5a7a3b1a34.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>



<style>
</style>
</head>

<body>
	<jsp:include page="../common/header.jsp" />

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-12">
						<div class="carousel slide" id="carousel-722581">
							<ol class="carousel-indicators">
								<li data-slide-to="0" data-target="#carousel-722581"></li>
								<li data-slide-to="1" data-target="#carousel-722581"></li>
								<li data-slide-to="2" data-target="#carousel-722581"
									class="active"></li>
							</ol>
							<div class="carousel-inner">
								<div class="carousel-item">
									<img class="d-block w-100" alt="Carousel Bootstrap First"
										src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg" />
									<div class="carousel-caption">
										<h4>오늘의 이색 데이트</h4>
										<p>요즘에 여기 안가본 사람이 있어???</p>
									</div>
								</div>
								<div class="carousel-item">
									<img class="d-block w-100" alt="Carousel Bootstrap Second"
										src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg" />
									<div class="carousel-caption">
										<h4>인기 장소 best!</h4>
										<p>1위 여기야! 2위 요기야! 3위 요기요.</p>
									</div>
								</div>
								<div class="carousel-item active">
									<img class="d-block w-100" alt="Carousel Bootstrap Third"
										src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg" />
									<div class="carousel-caption">
										<h4>나만의 장소</h4>
										<p>여기는 나밖에 모르는 나만의 장소~</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<h4>요즘 뜨는 장소</h4>
				<div class="row mb-2">
					<div class="col-md-6">
						<div class="card">
							<img class="card-img-top" alt="Bootstrap Thumbnail"
								src="thumbnailBox.PNG" />
							<div class="card-block">
								<h6 class="card-title">
									<span>이리와라 coffee</span><span>별점 4.2</span>
								</h6>
								<p class="card-text">
									<span>노원구</span> - <span>카페</span> <span>뷰23 댓글 15</span>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card">
							<img class="card-img-top" alt="Bootstrap Thumbnail"
								src="thumbnailBox.PNG" />
							<div class="card-block">
								<h6 class="card-title">
									<span class="" href="#">경복궁 돈까스</span><span class="" href="#">별점
										4.2</span>
								</h6>
								<p class="card-text">
									<span class="" href="#">경복로</span> - <span class="" href="#">음식점</span>
									<span class="" href="#">뷰23 댓글 15</span>
								</p>

							</div>
						</div>
					</div>
				</div>

				<div class="row mb-2">
					<div class="col-md-6">
						<div class="card">
							<img class="card-img-top" alt="Bootstrap Thumbnail"
								src="thumbnailBox.png" />
							<div class="card-block">
								<h6 class="card-title">
									<span class="" href="#">이리와라 coffee</span><span class=""
										href="#">별점 4.2</span>
								</h6>
								<p class="card-text">
									<span class="" href="#">노원구</span> - <span class="" href="#">카페</span>
									<span class="" href="#">뷰23 댓글 15</span>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card">
							<img class="card-img-top" alt="Bootstrap Thumbnail"
								src="thumbnailBox.PNG" />
							<div class="card-block">
								<h6 class="card-title">
									<span class="" href="#">경복궁 돈까스</span><span class="" href="#">별점
										4.2</span>
								</h6>
								<p class="card-text">
									<span class="" href="#">경복로</span> - <span class="" href="#">음식점</span>
									<span class="" href="#">뷰23 댓글 15</span>
								</p>

							</div>
						</div>
					</div>
				</div>

				<div class="row mb-2">
					<div class="col-md-6">
						<div class="card">
							<img class="card-img-top" alt="Bootstrap Thumbnail"
								src="thumbnailBox.PNG" />
							<div class="card-block">
								<h6 class="card-title">
									<span class="" href="#">이리와라 coffee</span><span class=""
										href="#">별점 4.2</span>
								</h6>
								<p class="card-text">
									<span class="" href="#">노원구</span> - <span class="" href="#">카페</span>
									<span class="" href="#">뷰23 댓글 15</span>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card">
							<img class="card-img-top" alt="Bootstrap Thumbnail"
								src="thumbnailBox.PNG" />
							<div class="card-block">
								<h6 class="card-title">
									<span class="" href="#">경복궁 돈까스</span><span class="" href="#">별점
										4.2</span>
								</h6>
								<p class="card-text">
									<span class="" href="#">경복로</span> - <span class="" href="#">음식점</span>
									<span class="" href="#">뷰23 댓글 15</span>
								</p>
							</div>
						</div>
					</div>
				</div>

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
	</div>

	<jsp:include page="../common/footer.jsp" />

	<script>
		
	</script>


</body>
</html>