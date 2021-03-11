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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
		<script src="//cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 --> 
    <style>
/*  div{
border: 1px solid black;
}    */  
.star{
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
margin-top:100px;
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
.line{
line-height:55px; 
	/* margin-top:20px; */
}
.swal2-styled.swal2-confirm{
	background-color : #F5dF4D;
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
   <form action="${contextPath}/shop/ordersheet/itemPayment" method="POST" onsubmit="return validate();">
    <div class="container main" style="padding-bottom:150px;">
        <div class="row">
            <div class="col-md-6">
                <div class="mb-4 a">
           					<c:if test="${!empty ShopAttachmentList}"> 
                   	 <img src="${contextPath}${ShopAttachmentList.filePath}/${ShopAttachmentList.fileName}" class="rounded mx-auto d-block star">
          				 	</c:if>
                </div>
                  <div class="text-center" style="margin-top:10px;">
                  	<c:if test="${loginMember.memberGrade =='A'}">
	                  	<c:url var="updateUrl" value="${shop.itemNo}/update"/>
	                  	<c:url var="deleteUrl" value="${shop.itemNo}/deleteProduct"/>
					      				<button type="button" class="btn btnColor2" onclick="location.href='${updateUrl}'">상품수정</button>
					      				<button type="button" class="btn btnColor2" onclick="location.href='${deleteUrl}'">상품삭제</button>
			 				    	</c:if>
			 				   <c:if test="${empty sessionScope.returnListURL}">
										<c:set var="returnListURL" value="../shopList/${shop.shopType}" scope="session"/>
								</c:if>
	 							<a class="btn btnColor2"  href="${sessionScope.returnListURL}">목록으로</a>
<!-- 				      			<button type="button" class="btn btnColor" data-toggle="modal" data-target="#myModal">
				 	   					  쇼핑후기등록
				 						</button> -->
			        </div>
	 						
			        
                 </div>
           		 <div class="col-md-6">
                    <div class="col-md-12">
                    <table class="line">
                    	<tr>
                    		<td class="" style="width:100px;"><strong>상품명</strong>: </td>
                    		<td class="itemNm">${shop.itemNm}</td>
                    	</tr>
                    	<tr>
		                   	<td><strong>가격</strong> :</td>
		                   	<td id="iprice"><fmt:formatNumber value="${shop.itemPrice}" pattern="#,###"/> 원</td>
                    	</tr>
                			<tr>
                				<td><strong>배송비</strong> : </td>
                				<td id="sprice"><fmt:formatNumber value="${shop.transCharge}" pattern="#,###"/> 원</td>
                			</tr>
                			
                			<tr>
                				<td><strong>옵션선택</strong> : </td>
                				<td> 
                		      <select id="optionSelect" name="select" class="form-control form-control-sm" style="width: 100%;" onchange="SetSelectBox();"> 
													<c:if test="${!empty ShopOptionList}">
                           <option>옵션을 선택하세요.</option>
					                 		<c:forEach var="shopOption" items="${ShopOptionList}">
					                 			<c:if test="${shopOption.optionSpecifyContent ne '품절'}">
					                      	<option value="${shopOption.optionSpecify_NO}">${shopOption.optionSpecifyContent}</option>
					               				</c:if>
					               			</c:forEach>
					               	 </c:if>
                          </select>
                        </td>
                			</tr>
                			<tr>
                				<td><strong>개수</strong> : </td>
              					<td><input type="number" id="Quantity" name="Quantity" class="form-control form-control-sm" min="1" max="1000" value="1" style="width: 100%;"/>
											  </td>
                			</tr>
                			<tr>
                				<td><strong>Total</strong> : </td>
                				<td id="isprice"><%-- <fmt:formatNumber value="${shop.itemPrice}" pattern="#,###"/> 원 --%></td>
                			</tr>
                			<tr>
               					<td>
                           <img src="${contextPath}/resources/shopCommonImg/별모양.png" class="star" style="width:25px; height:25px;">
                       </td>
                      <c:choose>
                        <c:when test="${!empty starRating}">
                				 <td>${starRating.score}</td>
                				</c:when>
                				<c:otherwise>
                				  <td>0.0</td>
                				</c:otherwise>
                			</c:choose>
                			
                			</tr>
          <!--       			<tr>
                			<td></td>
                			</tr> -->
                    </table>
                    </div>
                      
                      <div class="float-left col-10"style="margin-top:20px;" >
                         <button type="submit" id="paybtn" class="btn btn-warning btn-lg btn-block" >결제하기</button>
                         <button type="button" id="cartbtn" class="btn btn-secondary btn-lg btn-block">장바구니</button>
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
             <a class="nav-link active" data-toggle="tab" href="#review">상품후기</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" data-toggle="tab" href="#qna">Q&A</a>
           </li>
         </ul>
         <div class="tab-content">
          <div class="tab-pane fade" id="qna">
          	<p><jsp:include page="shopReply.jsp"/></p>
         </div>
           <div class="tab-pane fade show active" id="review">
             <p><jsp:include page="shopReview.jsp"/></p>
 					</div>
         </div>
       </div>
        </div>
     </div>
   </form> 
   <jsp:include page="../common/footer.jsp" />		
     
</body>


<script>
//로그인한 회원번호
	  var sprice =${shop.transCharge};
	  var iprice =${shop.itemPrice}; 
	  var total = iprice+sprice;
	 
/* 	  if(total > 20000){
		  
	  $("#sprice").html("무료배송");
	  
	  var commaIPrice = numberWithCommas(iprice);
	  $("#isprice").html(commaIPrice +' 원 ');
	  
	  }else{
	 
		  var commaIPrice = numberWithCommas(total);
	  $("#isprice").html(commaIPrice +' 원');
	 
	  } 
	   */

	  $(document).ready(function() {
		  var sprice =${shop.transCharge};
		  var iprice =${shop.itemPrice}; 
		  var total = iprice+sprice;
		 
		  if(total > 20000){
			  
		  $("#sprice").html("무료배송");
		  
		  var commaIPrice = numberWithCommas(iprice);
		  $("#isprice").html(commaIPrice +' 원 ');
		  
		  }else{
		 
			  var commaIPrice = numberWithCommas(total);
		  $("#isprice").html(commaIPrice +' 원');
		 
		  } 
		  
	  
			var sprice =${shop.transCharge};
			var iprice =${shop.itemPrice};
			var inumber = 1;
			
			$("#Quantity").on("change", function(){
				
				inumber = Number($(this).val());
				
				var total = iprice * inumber
				
				if(total < 20000){
			   var commaSprice = numberWithCommas(sprice);
			   	$("#sprice").html(commaSprice +' 원');
			   	
			   	total = total + sprice;
			    var totalComma  =numberWithCommas(total); 
					console.log(total)
					
					$("#isprice").text(totalComma +' 원');

				}else{
		   		 $("#sprice").html("무료배송");
					  totalComma =numberWithCommas(total); 
					$("#isprice").text(totalComma +' 원');
				}
				
				console.log(inumber);
			
			});
	  	

	
	 }); 
	  

  
  //로그인한 회원번호
   //var memberNo = ${loginMember.memberNo};
  	//console.log(memberNo)
  
  // 선택한 상세옵션번호
  var optionSpecifyNo
  function SetSelectBox(){
  	optionSpecifyNo = $("#optionSelect option:selected").val();
  	//console.log(optionSpecifyNo);
  }
  
  // 현재 아이템 번호
	var itemNo = ${shop.itemNo};	
		//console.log(itemNo);
  
	// 구매할 수량.
	var buyingQuantity = 1;
	$("#Quantity").on("input", function(){
		
		buyingQuantity = $("#Quantity").val()
			
		console.log(buyingQuantity);
	
				
		
	});

	// 장바구니에 아이템 담기.
	$("#cartbtn").on("click", function(){
			
		Swal.fire({
			  title: '장바구니에 담으시겠습니까?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#F5dF4D',
			  cancelButtonColor: '#939597',
			  confirmButtonText: '카트에 담기',
			  cancelButtonText: '취소' 

			}).then((result) => {
			  if (result.isConfirmed) {
			      $.ajax({
							url : "${contextPath}/shop2/cart/insertCart",
							method : "POST",
							data : {/*"memberNo" : memberNo,*/
											"optionSpecifyNo" : optionSpecifyNo,
											"itemNo" : itemNo,
											"buyingQuantity" : buyingQuantity},
							success : function(result){
								if(result > 0){
									Swal.fire(
					      		'장바구니에 담겼습니다!'
							    )
								}
							},
							error : function(data){

								Swal.fire({
									  title: '장바구니 담기 실패!',
									  text: '옵션을 선택해주세요.같은 옵션은 중복해  담을 수 없습니다.',
									  icon: 'error'
									});
							}
						});
			  }
			});
	});
  
	
	
	 // 콤마 함수
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	// 옵션 유효성 검사.
	function validate(){
		
		if($("#optionSelect option:selected").text() == '옵션을 선택하세요.'){
			Swal.fire({icon:'error', text:'옵션을 선택해주세요'})
			return false
		}
		
		return true;
	}
	

  
  
</script>
</html>