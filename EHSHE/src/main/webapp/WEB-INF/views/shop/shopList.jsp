<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    
    <!-- 부트스트랩 사용을 위한 라이브러리 추가 -->
    <!-- jquery가 항상 먼저여야된다! -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>
<style>
.a{
    height: 300px;
}
.shopimg{
    height: 100%;
    width: 100%;
}
/*   div{
border: 1px solid black;

}  */
#w{
    margin: 0px auto;
}
.t{
    border-radius: 1rem;
}
#searchBtn{
    border: 0;
    background-color:  #F5dF4D ;
    color: black;
}
 header{
   position:relative !important;
}
 
</style>
<body>
     <jsp:include page="../common/header.jsp"/>
    
    <div class="container" style="margin-top:80px;">
        <div style="text-align: center;">
						<c:choose>
							<c:when test="${pInfo.shopType == 1}"><h1>Clothes</h1></c:when>
						</c:choose> 
        </div>
       
        <div class="row" style="margin-top: 50px;">
            <c:if test="${!empty sList }">
              <c:forEach var="shop" items="${sList}" varStatus="vs">
            <div class="col-md-3" onclick="location.href='../${pInfo.shopType}/${shop.itemNo}'">
                <div class="mb-3 a">
                    <img class="shopimg" src="여행.jpg" class="rounded mx-auto d-block">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>${shop.itemNm}</strong></div>
                            <div>가격: ${shop.itemPrice}</div>
                            <div>배송비: ${shop.transCharge}</div>
                             <img class="shopimg" src="별모양.png" style="width: 20px; height: 20px;">  4.15
                        </div>
                    </div>
                  </div>
                </div>
                </c:forEach>
            </c:if>
             
              <div class="col-md-3">
                <div class="mb-3 a">
                    <img src="여행.jpg" class="rounded mx-auto d-block shopimg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                            <img src="별모양.png" style="width: 20px; height: 20px;">  4.15
                        </div>
                    </div>
                  </div>
              </div>
         
              <div class="col-md-3">
                <div class="mb-3 a">
                    <img src="여행.jpg" class="rounded mx-auto d-block shopimg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                            <img src="별모양.png" style="width: 20px; height: 20px;">  4.15
                        </div>
                    </div>
                  </div>
              </div>
         
              <div class="col-md-3">
                <div class="mb-3 a">
                    <img src="여행.jpg" class="rounded mx-auto d-block shopimg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                            <img src="별모양.png" style="width: 20px; height: 20px;">  4.15
                        </div>
                    </div>
                  </div>
              </div>
        </div>
      
        <div class="row">
            <div class="col-md-3">
                <div class="mb-3 a">
                    <img src="여행.jpg" class="rounded mx-auto d-block shopimg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                            <img src="별모양.png" style="width: 20px; height: 20px;">  4.15
                        </div>
                    </div>
                  </div>
                </div>
             
              <div class="col-md-3">
                <div class="mb-3 a">
                    <img src="여행.jpg" class="rounded mx-auto d-block shopimg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                            <img src="별모양.png" style="width: 20px; height: 20px;" class="shopimg">  4.15
                        </div>
                    </div>
                  </div>
              </div>
         
              <div class="col-md-3">
                <div class="mb-3 a">
                    <img src="여행.jpg" class="rounded mx-auto d-block shopimg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                            <img src="별모양.png" style="width: 20px; height: 20px;" class="shopimg">  4.15
                        </div>
                    </div>
                  </div>
              </div>
         
              <div class="col-md-3">
                <div class="mb-3 a">
                    <img src="여행.jpg" class="rounded mx-auto d-block shopimg">
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>커플옷</strong></div>
                            <div>가격: 30,000원</div>
                            <div>배송비: 무료</div>
                            <img src="별모양.png" style="width: 20px; height: 20px;"class="shopimg">  4.15
                        </div>
                    </div>
                  </div>
              </div>
        </div>
        		<a class="btn btn-info float-right btn-lg" href="${contextPath}/shop/shopInsert">등록</a>
       
        <div aria-label="Page navigation example" style="margin-top:100px;">
            <ul class="pagination justify-content-center">
              <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#">Next</a>
              </li>
            </ul>
        </div>
        
         <div class="form-row text-center" style="margin-top: 50px;">
            <div class="form-group"  style="margin:0px auto;">
                <select name="sk" class="form-control t" style="width: 150px; display: inline-block;">
					<option value="tit">글제목</option>
					<option value="con">내용</option>
					<option value="titcont">제목+내용</option>
				</select> 
				<input type="text" name="sv" class="form-control t" style="width: 300px; display: inline-block;">
				<button class="form-control btn btn-success t" id="searchBtn" type="button" style="width: 100px; display: inline-block; margin-bottom: 5px;">검색</button>
            </div>
        </div>
       </div>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <jsp:include page="../common/footer.jsp" />		
       
    </body>
</html>