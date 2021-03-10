<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Ehshe Project</title>
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<script src="https://kit.fontawesome.com/5a7a3b1a34.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
<style>
.intro{
    height:100vh;
    background: url(resources/images/mainbackground3.jpg) no-repeat center center;
    background-size: cover;
}
nav{
    opacity: 0.7;
}
 @media(max-width:768px){
    .intro{
           height: 35vh;
    }
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
                        <h4>따뜻한 공간</h4>
                        <h4>우리만의 데이트</h4>
                        <h4>우리만의 아이템</h4>
                        <p>
                            Spending more time together<br> — a common result of lockdowns, furloughs and layoffs — <br>
                            has been
                            a blessing for some couples <br>
                            who gain greater appreciation of one another.
                        </p>
                    </div>
                    <div class="photo_area">
                        <img src="${contextPath}/resources/images/mainPhotoSection1.jpg">
                    </div>
                </div>
            </div>
        </section>
        <section class="date-introduce">
            <div class="date-heading">
                <h2>Looking for <b>unique,</b> <br>
                    <b>romantic</b> date ideas
                </h2>
                <a href="${contextPath}/place/placeList">Search for a place</a>
            </div>
        </section>
        <section class="ranking">
            <div class="inner">
                <div class="ranking-content">
                    <h2>THE BEST PLACE</h2>
                    <div class="places">
                    
                  <%--   <c:if test="${empty pList }">
                  <h5>존재하는 게시글이 없습니다.</h5>
            </c:if> --%>
                    
                  	<c:if test="${!empty tpList && !empty piList}">
                  		<c:forEach var="rankingPlace" items="${piList}" varStatus="avg">
	                        <div class="place">
	                            <div class="place-image">
	                                <img src="${contextPath}${rankingPlace.placeAtPath}/${rankingPlace.placeAtName}">
	                            </div>
	                            <div class="place-description">
	                                <span><i class="fas fa-star"></i> ${tpList[avg.index].score}</span>
	                                <h3><b>${rankingPlace.placeTitle} </b></h3>
	                                <a href="${contextPath}/place/${rankingPlace.placeNo}" class="view-place">View More</a>
	                            </div>
	                        </div>
                        </c:forEach>
                      </c:if>
                    </div>
                </div>
            </div>
        </section>
        <section class="item-introduce">
            <div class="item-heading">
                <h2>Check out our <b>couple items</b><br>
                for the very best in <b>unique</b> or custom,<br>
                <b>handmade pieces</b> from our shops.</h2>
                <a href="${contextPath}/shop/shopMain">Search for an item</a>
            </div>
        </section>
        <section class="ranking">
            <div class="inner">
                <div class="ranking-content">
                    <h2>THE BEST ITEM</h2>
                    <div class="citems">
                        
                        
                      <c:if test="${!empty iList && !empty tList}">
                      	<c:forEach var="rankingItem" items="${iList}" varStatus="avg">
			                        <div class="citem">
			                            <div class="citem-image">
			                                <img src="${contextPath}${rankingItem.imgPath}/${rankingItem.imgName}">
			                            </div>
			                            <div class="citem-description">
		                            		<span class="socre-area"> <i class="fas fa-star"></i> ${tList[avg.index].score}</span>
		                                <span><b><fmt:formatNumber value="${rankingItem.itemPrice}" type="currency"/> </b></span>
		                                <h4><b>${rankingItem.itemNm} </b></h4>
		                                <a href="${contextPath}/shop/${rankingItem.itemCategory}/${rankingItem.itemNo}" class="view-item">View More</a>
			                            </div>
                        			</div>
                           
                        	</c:forEach>
                       </c:if> 
                    </div>
                </div>
            </div>
        </section>
        
    </div>
	
	
	
	<jsp:include page="footer.jsp" />
</body>
</html>