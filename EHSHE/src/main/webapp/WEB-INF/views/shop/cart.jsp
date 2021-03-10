<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0">


<link rel="stylesheet" href="${contextPath}/resources/css/shop/cart.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
		<script src="//cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script>
<title>cart</title>
<style>
header {
	position: relative !important;
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

	<jsp:include page="../common/header.jsp" />

	<section class="my-cart">
		<div class="inner">
			<div class="cart-heading">
				<div class="cart-title">
					<span>장바구니/결제</span>
				</div>
			</div>
			<form action="ordersheet" method="POST" onsubmit="return validate();">
				<div class="cart-info">
					<div class="cart-items-info">
						<div class="cart-items">
							<div class="check-items">
								<input type="checkbox" class="checkall" id="checkall" onclick='selectAll(this)'> <label for="checkall"><em></em>전체선택</label>
								<button type="button" class="delete-all">삭제</button>
							</div>
							<c:if test="${empty cList}">
                                       장바구니가 비어있습니다.
              </c:if>

							<c:if test="${!empty cList}">
								<c:forEach var="shopCart" items="${cList}" varStatus="vs">
									<div class="cart-item" id="">
										<div class="check-item">
											<input type="checkbox" name="ck" class="checkone" id="checkone${vs.count}" value="${shopCart.optionSpecifyNo}"> <label for="checkone${vs.count}"><em></em></label>
										</div>
										<div class="cart-img">
											<img src="${contextPath}${shopCart.imgPath}/${shopCart.imgName}">
										</div>
										<div class="cart-item-name">
											<span><a href=#>${shopCart.itemNm}</a></span> <span>${shopCart.optionSpecifyContent}</span>
										</div>
										<div class="cart-price">
										
											<div class="item-price">
												<span class="iprice">${shopCart.itemPrice}</span>원
											</div>
											<div class="item-number">
												<span class="item-num">${shopCart.buyingQuantity}</span>개
											</div>
											<div class="item-delete">
												<span class="delete-btn">삭제</span>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:if>

						</div>
					</div>
					<div class="payment-info">
						<div class="payment-items">
							<div class="item-total-price price">
								<label for="tprice">총가격</label> <input type="number" name="tprice" id="tprice" value="" readonly />
							</div>
							<div class="ship-price price">
								<label for="sprice">배송비</label> <input type="number" name="sprice" id="sprice" value="" readonly />
							</div>
							<div class="total-price price">
								<label for=tsprice>총가격 + 배송비</label> <input type="number" name="tsprice" id="tsprice" value="" readonly />
							</div>
							<div class="pay-area">
								<button type="submit" class="do_payment">주문하기</button>
							</div>
						</div>
					</div>

				</div>
			</form>
		</div>

	</section>

	<script>
				

    /* 전체 체크박스 선택시 모두 선택 */
    function selectAll(selectAll) {
        const selectReply = document.getElementsByName('ck');
        selectReply.forEach((checkbox) => {
            checkbox.checked = selectAll.checked;


            })
        }
				
        
   /*      <input type="checkbox" name="ck" class="checkone" id="checkone${vs.count}" 
        value="${shopCart.optionSpecifyNo}"> <label for="checkone${vs.count}"><em></em></label> */
        
        
         /* 개별 삭제 버튼 */
        $(".checkone").on("click", function () {
	        	
        		var optionSpecifyNo = $(this).val();
	        	console.log(optionSpecifyNo);
	       
        		
	        	$(".delete-btn").on("click", function(){
	        		Swal.fire({
	        			  text: "장바구니에서 삭제하시겠습니까?",
	        			  icon: 'question',
	        			  showCancelButton: true,
	        			  confirmButtonColor: '#F5dF4D',
	        			  cancelButtonColor: '#939597',
	        			  cancelButtonText: '취소',
	        			  confirmButtonText: '카트에서 삭제'
	        			}).then((result) => {
	        			  if (result.isConfirmed) {
			        			$.ajax({
		        					url : "${contextPath}/shop2/cart/deleteCartItem",
			        				data : {
			        							"optionSpecifyNo" : optionSpecifyNo},
			        				type : "POST",
			        				success : function(result){
			        					if(result > 0){
			        						swal({icon : "success", title : "장바구니에서 삭제 완료"}).then(function(){
			        							
			        						location.reload();
			        						});
			        					}
			        				},
			        				error : function(){
			        					console.log("장바구니에서 삭제 실패")
			        				}
			        			});
	        			   
	        			    
	        			  }
	        			})
        	});	
        		
        });
        	
        	
        /* 전체 삭제 버튼 */
        $(".delete-all").on("click", function () {
            var list = [];
            $("input:checkbox[name='ck']:checked").each(function (index) {
                if ($(this).val() != "on") {
                    list.push($(this).val());
                }
            });
            
            
            $.ajax({
            	url : "${contextPath}/shop2/cart/deleteAllCartItem",
            	data : {"optionSpecifyNoList" : list.join()},
            	type : "post",
            	success : function(result){
            		
            		if(result > 0){
            			swal({icon : "success", title : "장바구니에서 삭제 성공"}).then(function(){
            				
            			location.reload();
            				
            			});
            		}
            	},
            	error : function(){
            		console.log("장바구니에서 삭제 실패");
            	}
            })
        })





        // - 체크된 물건의 가격을 얻어오는 방법
        var totalprice = 0;
        var sprice = 0;
        $(".checkone").on("click", function () {

            var iprice = Number($(this).parent().next().next().next().children().children().eq(0).text());
            var inumber = Number($(this).parent().next().next().next().children().children().eq(1).text());
	
            if ($(this).prop("checked")) {
           	
                totalprice += (iprice * inumber);
                $("#tprice").val(totalprice);
            } else {
            		
            	totalprice -= (iprice * inumber)
                $("#tprice").val(totalprice);            		
            }

            if (totalprice < 20000 && totalprice > 0) {
				sprice = 3000
				$("#sprice").val(3000)
            }
            else {
            	sprice = 0
				$("#sprice").val(0)
            }

            	$("#tsprice").val(totalprice + sprice);
        });
 

        
        

        // 전체 체크된 물건의 가격을 얻어오는 방법.
        var alltotalprice = 0;

        $(".checkall").on("click", function () {
            totalprice = 0;

            //    console.log($(".iprice"))
            for (let i = 0; i < $(".iprice").length; i++) {


                var inumber = Number($(".item-num")[i].innerText);

                var itprice = Number($(".iprice")[i].innerText);


                totalprice += (itprice * inumber);

            }

            if ($(this).prop("checked")) {


                $("#tprice").val(totalprice);


                if (totalprice < 20000) {

                    var sprice = 3000;
                    $("#sprice").val(sprice);

                    $("#tsprice").val(totalprice + sprice);
                }else{
                		
                		var sprice = 0;
                		$("#sprice").val(sprice);

                    $("#tsprice").val(totalprice + sprice);
                }
            } else {

                totalprice = 0;

                $("#tprice").val(0);
                $("#tsprice").val(0);
                $("#sprice").val(0);
            }
            //console.log(totalprice);

        });
        
        
        //주문하기 유효성 검사.
        function validate(){
        	if($("#tsprice").val().trim().length == 0 || $("#tsprice").val() == 0 ){
        		Swal.fire({icon:'error', text:'상품을 선택해주세요'})
        	
        		return false;
        	}
					return true;        
        }
        
				
        function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

        

    </script>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>