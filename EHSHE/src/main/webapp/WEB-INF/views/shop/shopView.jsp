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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
    <!-- 부트스트랩 사용을 위한 라이브러리 추가 -->
    <!-- jquery가 항상 먼저여야된다! -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <style>
   div{
            border: 1px solid black;
        }   
img{
  width:100%;
  height:100%;
}
.a{
  height: 400px;
}
.b{
  height: 100%;
  width: 100%;
  margin: 0px auto;
}
.c{
  margin: 5px;

}
.j{
  width: 25px;
  height: 25px;
}
  header{
position:relative !important;
}
.main{
margin-top:50px;
}
.btnColor{
background-color: #F5dF4D;
color:black;
}
.btnColor2{
  background-color: #939597;
  color: white;
 }
.productClass{
display:inline-block;
}
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>	
    <div class="container main">
        <div class="row">
            <div class="col-md-6">
                <div class="mb-4 a">
           					<c:if test="${!empty ShopAttachmentList}"> 
                   	 <img src="${contextPath}${ShopAttachmentList.filePath}/${ShopAttachmentList.fileName}" class="rounded mx-auto d-block">
          				 	</c:if>
                </div>
                  <div class="float-right" style="margin-top:10px;">
                  	<c:url var="updateUrl" value="${shop.itemNo}/update"/>
	      				<button type="button" class="btn btnColor2" onclick="location.href='${updateUrl}'">상품수정</button>
	      				<button type="button" class="btn btnColor2">상품삭제</button>
	      				<button type="button" class="btn btnColor">후기등록</button>
			        </div>
                 </div>
           
           		 <div class="col-md-6">
                    <div class="col-md-12">
                     
                     <div>
                       <div class="productClass">상품명</div>
                       <div class="productClass">${shop.itemNm}</div>
                     </div>
                       
                      <div>
                       <div class="productClass">가격</div>
                       <div class="productClass">${shop.itemPrice}원</div>
                      </div>
                      
                      <div>
                       <div class="productClass">배송비</div>
                       <div class="productClass">${shop.transCharge}</div>
                      </div>
                       
                       <div>
                           <div class="productClass">옵션선택</div>
                              <select name="select" class="form-control productClass" style="width: 255px;"> 
                              <option selected>옵션을 선택하세요.</option>
								<c:if test="${!empty ShopOptionList}">
				                 <c:forEach var="shopOption" items="${ShopOptionList}">
			                       <option>${shopOption.optionSpecifyContent}</option>
				               	 </c:forEach>
                               </c:if>
                             </select>
                    	</div>
                            
                           <div>
                            <div class="productClass">개수</div>
                            <input type="number" min="0" max="100"  value="1" />
                          </div>
                          
                          <div>
                            <div class="productClass">Total</div>
                            <div class="productClass">${shop.itemPrice}원</div>
                    	 </div>
                    	 
                    	 <div class="productClass">
                              <div class="j productClass">
                                <img src="${contextPath}/resources/shopCommonImg/별모양.png">
                              </div>
                            <div class="productClass">4.15</div>
                        </div>
                     
                      <div class="float-left col-10">
                         <button class="btn btn-warning btn-lg btn-block">결제하기</button>
                         <button class="btn btn-secondary btn-lg btn-block">장바구니</button>
                      </div>
                      
                      </div>
               </div>
                   
      
      
      
        <hr>
        <div class="row" style="margin-top: 30px;">
          <div class="col-md-12">
            <div class="mb-4 b">
           	<% pageContext.setAttribute("newLine","\n"); %>
						${fn:replace(shop.itemContent,newLine,"<br>")}
             </div>
          </div>
          <div class="col-md-12">
         <ul class="nav nav-tabs">
           <li class="nav-item">
             <a class="nav-link active"data-toggle="tab" href="#review">상품후기</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" data-toggle="tab" href="#qna">Q&A</a>
           </li>
         </ul>
         <div class="tab-content">
           <div class="tab-pane fade show active" id="review">
							<button type="button" class="btn btnColor float-right" data-toggle="modal" data-target="#myModal">
						 	     쇼핑후기등록
						 	</button>
           <p style="word-break:break-all; margin-top: 20px;">
            asdasdsadasdasdasdasdasdasdasdasdsadasdasdasdasdasdasdasdasdsadasdasdasdasdasdasdasdasdsadasdasdasdasdasdasdasdasdsadasdasdasdasdasdasdasdasdsadasdasdasdasdasdasdasdasdsadasdasdasdasdasdasdasdasdsadasdasdasdasdasdasdasdasdsadasdasdasdasdasdasdasdasdsadasdasdasdasdasdasdasdasdsadasdasdasdasdasdasdasdasdsadasdasdasdasdasdasdasdasdsadasdasdasdasdasdasdasdasdsadasdasdasdasdasdasdasdasdsadasdasdasdasdasdasdasdasdsadasdasdasdasdasdasdasdasdsadasdasdasdasdasdasdasdasdsadasdasdasdasdasdasd
           </p>

    <div class="modal" id="myModal" tabindex="-1">
      <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">쇼핑후기</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <p style="word-break:break-all;">Modal body text goes here.
              Modal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes here
              Modal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes here
              Modal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes here
              Modal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes here
              Modal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes here
              Modal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes here
              Modal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes here
              Modal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes here
              Modal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes hereModal body text goes here
            </p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-warning">등록하기</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>
 </div>
           <div class="tab-pane fade" id="qna">
             <p>       dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
               dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
               ddddddddddddddddddddddddddddddddddd
               dddddddddddddddddddddddddddddd
               ddddddddddddddddddddddddd dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
               dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
               ddddddddddddddddddddddddddddddddddd
               dddddddddddddddddddddddddddddd
               ddddddddddddddddddddddddd
               dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
               dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
               ddddddddddddddddddddddddddddddddddd
               dddddddddddddddddddddddddddddd
               ddddddddddddddddddddddddd dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
               dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
               ddddddddddddddddddddddddddddddddddd
               dddddddddddddddddddddddddddddd
               ddddddddddddddddddddddddd</p>
           </div>
         </div>
     </div>
        </div>
        <br>
        <br>
     </div>
   <jsp:include page="../common/footer.jsp" />		
     
</body>
<script>
  $(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});
</script>
</html>