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
.btnColor{
  background-color: #F5dF4D;
  color:white;
}
.listPointer{
cursor:pointer;
}
.pagination li a{
   color:black;
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
<body>
     <jsp:include page="../common/header.jsp"/>
    
    <div class="container" style="margin-top:80px; padding-bottom:200px;">
        <div style="text-align: center;">
						<c:choose>
							<c:when test="${pInfo.shopType == 1}"><h1>Clothes</h1></c:when>
							<c:when test="${pInfo.shopType == 2}"><h1>Accessory</h1></c:when>
							<c:when test="${pInfo.shopType == 3}"><h1>Etc</h1></c:when>
						</c:choose> 
          </div>
        <div class="row" style="margin-top: 50px;">
            <c:if test="${!empty sList}">
              <c:forEach var="shop" items="${sList}" varStatus="vs">
            <div class="col-md-3 listPointer" onclick="location.href='../${pInfo.shopType}/${shop.itemNo}'">
                <div class="mb-3 a">
                
                <c:forEach items="${thList}" var="th">
                   <c:if test="${th.parentShopNo == shop.itemNo}">
                    <img class="shopimg" src="${contextPath}${th.filePath}/${th.fileName}" class="rounded mx-auto d-block">
                	</c:if>
                </c:forEach>
                
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <div><strong>${shop.itemNm}</strong></div>
                            <div>가격: <fmt:formatNumber value="${shop.itemPrice}" pattern="#,###"/>원</div>
                            <div>배송비: <fmt:formatNumber value="${shop.transCharge}" pattern="#,###"/>원</div>
          							 <c:forEach items="${starRating}" var="sr">
 														<c:choose>
 															 <c:when test="${sr.itemNo == shop.itemNo}">
                            			<div><img class="shopimg" src="${contextPath}/resources/shopCommonImg/별모양.png" class="score"style="width: 20px; height: 20px;"> ${sr.score}</div>
 															</c:when>
 										<%-- 					<c:when test="${sr.itemNo ne  shop.itemNo}">
 															    <div><img class="shopimg" src="${contextPath}/resources/shopCommonImg/별모양.png" class="score"style="width: 20px; height: 20px;"> 0</div>
 															</c:when> --%>
                        	 </c:choose>
                        </c:forEach>
                        </div>
                    </div>
                  </div>
                </div>
                </c:forEach>
            </c:if>
             <c:if test="${empty sList}">
            	<div style="margin:0px auto;"><Strong>검색된 결과가 없습니다.</Strong></div>
            </c:if> 
          </div>
       <c:if test="${loginMember.memberGrade == 'A' }">
        	<a class="btn btnColor float-right" href="../${pInfo.shopType}/shopInsert">등록</a>
       </c:if>
        <div aria-label="Page navigation example" style="margin-top:100px;">
        
							
							<c:choose>
								<%-- 검색이 된 경우 --%>
								<c:when test="${!empty search}">
									<%-- 선택된 카테고리를 하나의 쿼리스트링으로 조합 --%>
									
									<%--검색된 내용이 있다면 --%>
									<c:if test="${!empty search.sv}">
										<c:set var="searchStr" value="&sk=${search.sk}&sv=${search.sv}"/>
									</c:if>
									  
									  <c:url var="pageUrl" value="../search/${pInfo.shopType}?${searchStr}&"/>
													<%--목록으로 버튼에 사용할 URL 저장 변수 선언 --%>	
									  <c:set var="returnListURL" value="${contextPath}/shop/search/${pageUrl}cp=${pInfo.currentPage}"
										scope="session"/>
							
								</c:when>
								
							 <c:otherwise>
      						<c:url var="pageUrl" value="${pInfo.shopType}?"/>
      							<%--목록으로 버튼에 사용할 URL 저장 변수 선언 --%>	
									<c:set var="returnListURL" value="${contextPath}/shop/search/${pageUrl}cp=${pInfo.currentPage}"
										scope="session"/>
							 </c:otherwise>
							</c:choose>

							
							<!-- 화살표에 들어갈 주소를 변수로 생성 -->
							<c:set var="firstPage" value="${pageUrl}cp=1"/>
							<c:set var="lastPage" value="${pageUrl}cp=${pInfo.maxPage}"/>
				        
				        
			 				<fmt:parseNumber var="c1" value="${(pInfo.currentPage - 1) / 10 }"  integerOnly="true" />
							<fmt:parseNumber var="prev" value="${ c1 * 10 }"  integerOnly="true" />
							<c:set var="prevPage" value="${pageUrl}cp=${prev}" />
							
							
							<fmt:parseNumber var="c2" value="${(pInfo.currentPage + 9) / 10 }" integerOnly="true" />
							<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }" integerOnly="true" />
							<c:set var="nextPage" value="${pageUrl}cp=${next}" />
							        
        
            <ul class="pagination justify-content-center">
              
             <c:if test="${pInfo.currentPage > pInfo.pageSize}">
              <li>
                <a class="page-link" href="${firstPage}">&lt;&lt;</a>
              </li>
              <li>
             		<a class="page-link" href="${prevPage}">&lt;</a>
              </li>
            </c:if>
            
            <c:forEach var="page" begin="${pInfo.startPage}" end="${pInfo.endPage}" >
            	<c:choose>
            		<c:when test="${pInfo.currentPage == page}">
            				<li>
											<a class="page-link btnColor">${page}</a>
										</li>
            		</c:when>
            <c:otherwise>
							<li>	
								<a class="page-link" href="${pageUrl}cp=${page}">${page}</a>
							</li>
						</c:otherwise>
            	</c:choose>
            </c:forEach>
              
         <c:if test="${next <= pInfo.maxPage}">
							<li> <!-- 다음 페이지로 이동 (>) -->
								<a class="page-link" href="${nextPage}">&gt;</a>
							</li>
								<li> <!-- 마지막 페이지로 이동(>>) -->
									<a class="page-link" href="${lastPage}">&gt;&gt;</a>
								</li>
							</c:if>
            </ul>
        </div>
        
          <form action="../search/${pInfo.shopType}">
         <div class="form-row text-center" style="margin-top: 50px;">
     <div class="form-group"  style="margin:0px auto;">
       <select name="sk" class="form-control t" style="width: 150px; display: inline-block;">
					<option value="tit">상품명</option>
					<option value="con">내용</option>
					<option value="titcont">상품명+내용</option>
			</select> 
				<input type="text" name="sv" class="form-control t" style="width: 300px; display: inline-block;">
				<button class="form-control btn btn-success t" type="submit" id="searchBtn" type="button" style="width: 100px; display: inline-block; margin-bottom: 5px;">검색</button>
     </div>
        </div>
        </form>
       </div>

       <jsp:include page="../common/footer.jsp" />		
       
    </body>
    	<script>
    $(function () {
			// 검색 조건(sk)
			$("select[name=sk] > option").each(function(index,item){
				if($(item).val() == "${search.sk}"){
					$(item).prop("selected",true);
					
				}
    	
				
				
		 });
    	
		// 검색 값(sv)
		$("input[name=sv]").val("${search.sv}");
    
	 });
    
   	 </script>
</html>