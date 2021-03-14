<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<link rel="stylesheet" href="${contextPath}/resources/css/shop/payment.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
		<script src="//cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script>
<title>payment</title>
<style>
header {
	position: relative !important;
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
	<section class="my-payment">
		<div class="inner">
			<div class="payment-heading">
				<div class="cart-title">
					<span>주문결제</span>
				</div>
			</div>
			<form action="#" method="POST" onsubmit="return validate();">
				<div class="inner2">
					<div class="ship-place">
						<h3>배송지 선택</h3>
						<div class="ship-info">
							<div class="ship-name">
								<label for="name">수령인 <span class="requiredInput">*</span></label>
								<div class="input-name">
									<input type="text" id="name" name="orderRecipient" placeholder="수령인 이름을 적어주세요." value="">
								</div>
							</div>

							<c:set var="address" value="${fn:split(loginMember.memberAddr,',') }" />

							<div class="ship-addr">
								<label for="postcodify_search_button">수령 주소 <span class="requiredInput">*</span></label>
								<div class="addr-search">
									<div class="addr-search1">
										<input type="text" name="post" class="address0 postcodify_postcode5" id="address0" value="">
										<button type="button" class="addr_btn" id="postcodify_search_button">검색</button>
									</div>
									<div class="addr-search2">
										<input type="text" class="postcodify_address address1" name="address1" id="address1" value="">
									</div>
									<div class="addr-search3">
										<input type="text" class="postcodify_details address2" name="address2" id="address2" value="">
									</div>
								</div>
							</div>
							<div class="ship-tel">
								<label for="tel">전화번호<span class="requiredInput">*</span></label>
								<div class="input-tel">
									<input type="text" class="form-control phone" id="tel" name="orderTel" placeholder=" - 없이 입력해주세요." maxlength="11" value="">
								</div>
							</div>
						</div>
					</div>
					<div class="order-info">
						<h3>주문상품 정보</h3>
						<div class="item-info">

							<c:choose>
								<c:when test="${!empty bList}">
									<c:forEach var="shopCart" items="${bList}">
										<div class="item-area">
											<div class="item">
												<div class="item-img">
													<img src="${contextPath}${shopCart.imgPath}/${shopCart.imgName}">
												</div>
												<div class="item-content">
													<div class="item-name">
														${shopCart.itemNm} <span class="item-option">${shopCart.optionSpecifyContent}</span><span class="specify-number">${shopCart.optionSpecifyNo}</span>
													</div>
													<div class="item-price">
														${shopCart.itemPrice} 원 <span class="item-number">${shopCart.buyingQuantity}</span> 개
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:when>

								<c:when test="${!empty bbList}">
									<c:forEach var="shopCart" items="${bbList}">
										<div class="item-area">
											<div class="item">
												<div class="item-img">
													<img src="${contextPath}${shopCart.imgPath}/${shopCart.imgName}">
												</div>
												<div class="item-content">
													<div class="item-name">
														${shopCart.itemNm} <span class="item-option">${shopCart.optionSpecifyContent}</span><span class="specify-number">${OptionSpecifyNo}</span>
													</div>
													<div class="item-price">
														${shopCart.itemPrice} 원 <span class="item-number">${buyingQuantity}</span><b>개</b>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:when>
							</c:choose>


							<div class="item-number">
								<h5 class="total-quantity">
									총 <span id="totalBuyingNumber"> </span> 개
								</h5>
							</div>
						</div>
					</div>



					<div class="final-info">
						<h3>최종 결제 정보</h3>
						<div class="total-cal">
							<div class="total-price">
								<div class="products-price">
									<span>상품금액 / 배송비</span>
								</div>
								<div class="total-won">
									<span>${tprice}원 / ${sprice}원</span>
								</div>
							</div>
							<div class="ship-price">
								<div class="products-ship">
									<span>총 결제금액</span>
								</div>
								<div class="ship-won">
									<span>${tsprice}원</span>
								</div>
							</div>
							<div class="pay-button">
								<button type="submit" id="btn-payment">결제하기</button>
							</div>
						</div>
					</div>
				</div>


			</form>
		</div>
	</section>


	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

	<script>
		/* 주소검색창 호출 */
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});

		
		
		
		
		
		/*var itemList =[];
		console.log($(".item-name").text());
		
		$(".item-name").each(function(index, item){
			itemList.push(item);
		});
		 */
		//console.log($(".item-name").length)
		//console.log($(".item-name").eq(0).text().trim())
		var orderItemName = $(".item-name").eq(0).text().trim();
		if ($(".item-name").length > 1) {
			orderItemName += ' 외 ' + ($(".item-name").length - 1) + "개"
		}
		//console.log(orderItemName);

		var list = [];
		for (var i = 0; i < $(".specify-number").length; i++) {

			list.push($(".specify-number")[i].innerText);
		}
		//console.log(list)

		var OptionSpecifyNo = list.join();

		//console.log(OptionSpecifyNo)

		// 	

		var orderRecipient; //전역

		$("#name").blur(function() {
			orderRecipient = $(this).val();
			console.log(orderRecipient); // undefined.
		})

		/* $("#name").on("input",function(){
			orderRecipient = $("#name").val();
		}); */

		var address;
		$("#adress0, #address1, #address2").blur(function() {
			var address0 = $(".address0").val()
			//console.log(address0);
			var address1 = $(".address1").val()
			//console.log(address1);
			var address2 = $(".address2").val()
			//console.log(address2);

			address = address0 + address1 + address2
			console.log(address)
		});

		var phone;
		$("#tel").blur(function() {
			phone = $("#tel").val()
			console.log(phone);
		});
		
		
		
		// 결제 유효성 검사
		function validate(){
			
				return false;
		}
		
		
		
		/* 아임포트 결제 */
		$("#btn-payment").on("click", function() {
			if($("#name").val().trim().length == 0 || 
					$("#adress0, #address1").val().trim().length == 0 ||
						$("#tel").val().trim().length == 0){
					Swal.fire({icon:'error', text:'배송지 정보를 입력해주세요.'})
				}else{
			
			
							var IMP = window.IMP;
							IMP.init("imp87438017");
							IMP.request_pay(
											{
												pg : 'inicis', // version 1.1.0부터 지원.
												pay_method : 'card',
												merchant_uid : 'merchant_'
														+ new Date().getTime(),
												name : orderItemName, //결제창에 나오는 이름.
												amount : '${tsprice}',  // 결제 가격.
												buyer_email : '${loginMember.memberEmail}', //결제완료후 나오는 이메일 번호
												buyer_name : orderRecipient, // 결제완료후 나오는 구매자 이름.
												buyer_tel : phone,
												buyer_addr : address,
												custom_data : OptionSpecifyNo,
												m_redirect_url : 'https://www.yourdomain.com/payments/complete'
											},
											function(rsp) {
												if (rsp.success) { //결제 완료시 나오는 메세지창.
													var msg = '결제가 완료되었습니다.';
													msg += '수취인 : '
															+ rsp.buyer_name;
													msg += '상품 : ' + rsp.name;
													msg += '결제금액 : '
															+ rsp.paid_amount;
													msg += '결제 승인 시각 : '
															+ rsp.paid_at;
													msg += '카드 승인번호 : '
															+ rsp.apply_num;

													console.log(rsp);

													$.ajax({
																url : "${contextPath}/shop2/ordersheet/insertPayment",
																method : "POST",
																data : {
																	imp_uid : rsp.imp_uid,
																	merchant_uid : rsp.merchant_uid,
																	"orderItemName" : rsp.name,
																	"orderPrice" : rsp.paid_amount, //결제금액
																	"orderRecipient" : rsp.buyer_name, // 수령자 이름
																	"orderTel" : rsp.buyer_tel, // 수취인 전화번호
																	"orderAddr" : rsp.buyer_addr, // 수취인 주소
																	"OptionSpecifyNo" : rsp.custom_data //옵션 상세번호
																},//결제성공 +삽입성공+장바구니에서 삭제 성공 시 .
																success : function(result) {
																		
																	if (result > 0) {
																		swal(
																				{
																					icon : "success",
																					title : "결제성공",
																					text : "결재내역으로 이동합니다."
																				})
																				.then(
																						function() {
																							location.href = "${contextPath}/page/paymentdetails";

																						});
																	}

																},
																error : function() {
																	alert("error");
																}

															});

												} else {
													var msg = '결제에 실패하였습니다.';
													msg += '에러내용 : '
															+ rsp.error_msg;
												}
												alert(msg);
											});
				}
						});

		// 수량 합계 구하기.
		var total = 0;
		for (var i = 0; i < $(".item-number").length - 1; i++) {

			$(".item-number").text()
			//console.log($("span.item-number").text().length)

			//total += i;
			total += Number($("span.item-number")[i].innerText);

			//console.log($("span.item-number")[i].innerText)
		}
		//console.log(total)

		$("#totalBuyingNumber").text(total)
		
		
		
		
		
		
		
		
		
		
		
	</script>




</body>
</html>