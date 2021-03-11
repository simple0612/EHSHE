<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>html문서 제목</title>
    <!-- 부트스트랩을 사용을 위한 css 추가 -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
   
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script> 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <style>
/*div{
border: 1px solid black;
}*/
/*
#wrapper{
width: 1280px;
height: 3000px;
margin: 0px auto;
} */
 /*       
#promotion{
width : 700px;
height:  200px;
margin: 0px auto;
} */
.a{
height: 300px;
}
.b{
height: 150px;
}
#center{
margin:0px auto;
}
.shopmainImg{
width:100%;
height:100%;
} 
.c{
margin-top:200px;
}
.shopmain{
margin-top:50px;
}  
header{
position:relative !important;
}
.mainImg{
height:100%;
width:100%;
}
.mainPointer{
cursor:pointer;
}
.swal-button {
   background-color: #F5DF4D;
}

.swal-button:not([disabled]):hover {
   background-color: #f0d700;
}

.swal-button:focus {
   box-shadow: 0 0 0 3px #fff;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
   <div class="shopmain" style="padding-bottom:100px; margin-top:100px;">
   <div class="container">
    <div class="container">
        <div class="row">
             <div class="col-md-12">
                <div class="carousel slide" id="carousel-138686">
                    <ol class="carousel-indicators">
                         <li data-slide-to="0" data-target="#carousel-138686" class="active">
                        </li>
                        <li data-slide-to="1" data-target="#carousel-138686">
                        </li>
                        <li data-slide-to="2" data-target="#carousel-138686">
                        </li> 
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100 rounded mx-auto d-block" alt="Carousel Bootstrap First" src="${contextPath}/resources/shopCommonImg/애쉬배너1.png" />
                            <div class="carousel-caption">
                                <h4>
                                </h4>
                                <p>
                                </p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100 rounded mx-auto d-block" alt="Carousel Bootstrap Second" src="${contextPath}/resources/shopCommonImg/고객리뷰2.png" />
                            <div class="carousel-caption">
                                <h4>
                                </h4>
                                <p>
                                </p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100 rounded mx-auto d-block" alt="Carousel Bootstrap Third" src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg" />
                            <div class="carousel-caption">
                                <h4>
                                    Third Thumbnail label
                                </h4>
                                <p>
                                    Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                </p>
                            </div>
                        </div>
                    </div> <a class="carousel-control-prev" href="#carousel-138686" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-138686" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
                </div>
            </div>
        </div>
    </div>
    <div class="container" style="margin-top: 50px;">
            
        <p><strong>최근 올라온 상품</strong></p>
        <div class="row">
          <c:forEach var="shop" items="${sList}" varStatus="vs">
            <div class="col-md-4 mainPointer" onclick="location.href='../shop/${shop.itemCategory}/${shop.itemNo}'">
                <div class="mb-4 a">
                  <c:forEach items="${thMList}" var="th">
                   	<c:if test="${th.parentShopNo == shop.itemNo}">
                   		 <img src="${contextPath}${th.filePath}/${th.fileName}" class="rounded mx-auto d-block shopmainImg">                
                		</c:if>
                 </c:forEach>
                 </div>
                <div class="card mb-4">
                    <div class="card-body">
                        <div>
                            <div><strong>${shop.itemNm}</strong></div>
                            <div>가격: <fmt:formatNumber value="${shop.itemPrice}" pattern="#,###"/>원</div>
                            <div>배송비: <fmt:formatNumber value="${shop.transCharge}" pattern="#,###"/>원</div>
                             
                           <c:choose>
                             <c:when test="${!empty starRating}">
                            <c:forEach items="${starRating}" var="sr">
							  							 <c:if test="${sr.itemNo == shop.itemNo}">
		                            <div><img src="${contextPath}/resources/shopCommonImg/별모양.png" class="mainImg" style="width: 20px; height: 20px;"> ${sr.score}</div>
	 														 </c:if>
    												</c:forEach> 
    												</c:when>  
	 													<c:otherwise>	
	 														<div><img src="${contextPath}/resources/shopCommonImg/별모양.png" class="mainImg" style="width: 20px; height: 20px;"> 0</div>
    												</c:otherwise>
    												</c:choose>                 
                        </div>
                    </div>
                  </div>
              </div>
           </c:forEach>
             
          </div>

        <p><strong>인기상품(Hot!!)</strong></p>
        <div class="row">
         <c:forEach var="shop" items="${shList}" varStatus="vs">
            <div class="col-md-4 mainPointer" onclick="location.href='../shop/${shop.itemCategory}/${shop.itemNo}'">
                <div class="mb-4 a">
                    <img src="${contextPath}${shop.filePath}/${shop.fileName}"  class="rounded mx-auto d-block shopmainImg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>${shop.itemNm}</strong></div>
                            <div>가격: <fmt:formatNumber value="${shop.itemPrice}" pattern="#,###"/>원</div>
                            <div>배송비: <fmt:formatNumber value="${shop.transCharge}" pattern="#,###"/>원</div>
                            <div><img src="${contextPath}/resources/shopCommonImg/별모양.png" class="mainImg" style="width: 20px; height: 20px;"> ${shop.score}</div>
                        </div>
                    </div>
                  </div>
              </div>
        </c:forEach>
			</div>         
<!--               <div class="col-md-4">
                <div class="mb-4 a">
                    <img src="여행.jpg" class="rounded mx-auto d-block shopmainImg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                        </div>
                    </div>
                  </div>
              </div>
         
              <div class="col-md-4">
                <div class="mb-4 a">
                    <img src="여행.jpg" class="rounded mx-auto d-block shopmainImg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                        </div>
                    </div>
                  </div>
              </div>
        </div>
    </div> -->

<!--     <div class="container" style="margin-top: 50px;">
        <p><strong>shop 제품</strong></p>
        <div class="row">
            <div class="col-md-3">
                <div class="mb-3 a">
                    <img src="여행.jpg" class="rounded mx-auto d-block shopmainImg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                        </div>
                    </div>
                  </div>
                </div>
             
              <div class="col-md-3">
                <div class="mb-3 a">
                    <img src="여행.jpg" class="rounded mx-auto d-block shopmainImg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                        </div>
                    </div>
                  </div>
              </div>
         
              <div class="col-md-3">
                <div class="mb-3 a">
                    <img src="여행.jpg" class="rounded mx-auto d-block shopmainImg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                        </div>
                    </div>
                  </div>
              </div>
         
              <div class="col-md-3">
                <div class="mb-3 a">
                    <img src="여행.jpg" class="rounded mx-auto d-block shopmainImg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                        </div>
                    </div>
                  </div>
              </div>
        </div>
   
         <div class="row">
            <div class="col-md-3">
                <div class="mb-3 a">
                    <img src="여행.jpg" class="rounded mx-auto d-block shopmainImg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                        </div>
                    </div>
                  </div>
              </div>
         
              <div class="col-md-3">
                <div class="mb-3 a">
                    <img src="여행.jpg" class="rounded mx-auto d-block shopmainImg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                        </div>
                    </div>
                  </div>
              </div>
         
              <div class="col-md-3">
                <div class="mb-3 a">
                    <img src="여행.jpg"class="rounded mx-auto d-block shopmainImg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                        </div>
                    </div>
                  </div>
              </div>

              <div class="col-md-3">
                <div class="mb-3 a">
                    <img src="여행.jpg" class="rounded mx-auto d-block shopmainImg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                        </div>
                    </div>
                  </div>
              </div>
              
              
              
              
             <div class="col-md-3">
                <div class="mb-3 a">
                    <img src="여행.jpg" class="rounded mx-auto d-block shopmainImg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                        </div>
                    </div>
                  </div>
              </div>
           <div class="col-md-3">
                <div class="mb-3 a">
                    <img src="여행.jpg" class="rounded mx-auto d-block shopmainImg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                        </div>
                    </div>
                  </div>
              </div>
               <div class="col-md-3">
                <div class="mb-3 a">
                    <img src="여행.jpg" class="rounded mx-auto d-block shopmainImg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                        </div>
                    </div>
                  </div>
              </div>
            <div class="col-md-3">
                <div class="mb-3 a">
                    <img src="여행.jpg" class="rounded mx-auto d-block shopmainImg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                        </div>
                    </div>
                  </div>
              </div>
      
        </div> 
    </div> -->
    </div>
    </div>
    </div>
 <br>
 <br>
<jsp:include page="../common/footer.jsp" />		
<script>

</script>
</body>
</html>