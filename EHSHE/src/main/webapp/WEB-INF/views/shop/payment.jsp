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

<title>payment</title>
<style>
header {
	position: relative !important;
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
			<form action="#" method="POST">
				<div class="inner2">
					<div class="ship-place">
						<h3>배송지 선택</h3>
						<div class="ship-info">
							<div class="ship-name">
								<label for="name">수령인 <span class="requiredInput">*</span></label>
								<div class="input-name">
									<input type="text" id="name" name="orderRecipient" placeholder="수령인 이름을 적어주세요." value="${loginMember.memberNm}">
								</div>
							</div>

							<c:set var="address" value="${fn:split(loginMember.memberAddr,',') }" />

							<div class="ship-addr">
								<label for="postcodify_search_button">수령 주소 <span class="requiredInput">*</span></label>
								<div class="addr-search">
									<div class="addr-search1">
										<input type="text" name="post" class="address0 postcodify_postcode5" value="${address[0]}">
										<button type="button" class="addr_btn" id="postcodify_search_button">검색</button>
									</div>
									<div class="addr-search2">
										<input type="text" class="postcodify_address address1" name="address1" id="address1" value="${address[1]}">
									</div>
									<div class="addr-search3">
										<input type="text" class="postcodify_details address2" name="address2" id="address2" value="${address[2]}">
									</div>
								</div>
							</div>
							<div class="ship-tel">
								<label for="tel">전화번호<span class="requiredInput">*</span></label>
								<div class="input-tel">
									<input type="text" class="form-control phone" id="tel" name="orderTel" placeholder=" - 없이 입력해주세요." maxlength="11" value="${loginMember.memberPhone}">
								</div>
							</div>
						</div>
					</div>
					<div class="order-info">
						<h3>주문상품 정보</h3>
						<div class="item-info">

							<c:if test="${!empty bList}">
								<c:forEach var="shopCart" items="${bList}">
									<div class="item-area">
										<div class="item">
											<div class="item-img">
												<img src="${contextPath}${shopCart.imgPath}/${shopCart.imgName}">
											</div>
											<div class="item-content">
												<div class="item-name">
													${shopCart.itemNm} <span class="item-option">${shopCart.optionSpecifyContent}</span>
												</div>
												<div class="item-price">
													${shopCart.itemPrice} <span class="item-number">${shopCart.buyingQuantity}</span>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:if>

							<div class="item-number">
									<h5 class="total-quantity">총 <span id="thisisyoungjoo"> </span> 건</h5>
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
									<span>${tprice} / ${sprice}</span>
								</div>
							</div>
							<div class="ship-price">
								<div class="products-ship">
									<span>총 결제금액</span>
								</div>
								<div class="ship-won">
									<span>${tsprice}</span>
								</div>
							</div>
							<div class="pay-button">
								<button type="button" id="btn-payment">결제하기</button>
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
		
		var str = $(".item-name").text(); 
		console.log(str);
		
		/* 아임포트 결제 */
		$("#btn-payment").on("click", function() {
			var IMP = window.IMP;
			IMP.init("imp87438017");
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : 'str', //결제창에 나오는 이름.
				amount : '${tsprice}',    // 결제 가격.
				buyer_email : '${loginMember.memberEmail}', //결제완료후 나오는 이메일 번호
				buyer_name : '${loginMember.memberNm}',   // 결제완료후 나오는 구매자 이름.
				buyer_tel : '${loginMember.memberPhone}',
				buyer_addr : '${loginMember.memberAddr}',
				buyer_postcode : '123-456',
				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
				if (rsp.success) { //결제 완료시 나오는 메세지창.
					var msg = '결제가 완료되었습니다.';
					msg += '구매자 : ' + rsp.buyer_name;
					msg += '상품 : ' + rsp.name;
					msg += '결제금액 : ' + rsp.amount;
					msg += '결제 승인 시각 : ' + rsp.paid_at;
					msg += '카드 승인번호 : ' + rsp.apply_num;

					$.ajax({})
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
		});
		
		
		
		// 수량 합계 구하기.
		var total = 0;
		for(var i=0; i<$(".item-number").length-1; i++){
				
			$(".item-number").text()
			//console.log($("span.item-number").text().length)
			
			//total += i;
			total += Number($("span.item-number")[i].innerText);
			
			//console.log($("span.item-number")[i].innerText)
		}
		//console.log(total)
		
		$("#thisisyoungjoo").text(total)
		
		
		
		
		
	</script>




</body>
</html>