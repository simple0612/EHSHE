<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="${contextPath}/resources/css/shop/payment.css">
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
    <title>payment</title>
    <style>
    header{
        position:relative !important;
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
                                    <input type="text" id="name" name="orderRecipient" placeholder="수령인 이름을 적어주세요.">
                                </div>
                            </div>
                            <div class="ship-addr">
                                <label for="postcodify_search_button">수령 주소 <span class="requiredInput">*</span></label>
                                <div class="addr-search">
                                    <div class="addr-search1">
                                        <input type="text" name="post" class="address0 postcodify_postcode5">
                                        <button type="button" class="addr_btn" id="postcodify_search_button">검색</button>
                                    </div>
                                    <div class="addr-search2">
                                        <input type="text" class="postcodify_address address1" name="address1"
                                            id="address1">
                                    </div>
                                    <div class="addr-search3">
                                        <input type="text" class="postcodify_details address2" name="address2"
                                            id="address2">
                                    </div>
                                </div>
                            </div>
                            <div class="ship-tel">
                                <label for="tel">전화번호<span class="requiredInput">*</span></label>
                                <div class="input-tel">
                                    <input type="text" class="form-control phone" id="tel" name="orderTel"
                                        placeholder=" - 없이 입력해주세요." maxlength="11">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="order-info">
                        <h3>주문상품 정보</h3>
                        <div class="item-info">
                            <div class="item-area">
                                <div class="item">
                                    <div class="item-img">
                                        <img src="">
                                    </div>
                                    <div class="item-content">
                                        <div class="item-name">악세사리<span class="item-option">FREE</span></div>
                                        <div class="item-price">
                                            9800원<span class="item-number">1개</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item-area">
                                <div class="item">
                                    <div class="item-img">
                                        <img src="">
                                    </div>
                                    <div class="item-content">
                                        <div class="item-name">악세사리<span class="item-option">FREE</span></div>
                                        <div class="item-price">
                                            9800원<span class="item-number">1개</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item-number">
                                <h5>총 4건</h5>
                            </div>
                        </div>
                    </div>
                    <div class="final-info">
                        <h3>최종 결제 정보</h3>
                        <div class="total-cal">
                            <div class="total-price">
                                <div class="products-price">
                                    <span>상품금액</span>
                                </div>
                                <div class="total-won">
                                    <span>2000원</span>
                                </div>
                            </div>
                            <div class="ship-price">
                                <div class="products-ship">
                                    <span>배송비</span>
                                </div>
                                <div class="ship-won">
                                    <span> 2000원</span>
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
        $(function () {
            $("#postcodify_search_button").postcodifyPopUp();
        });

        /* 아임포트 결제 */
        $("#btn-payment").on("click", function () {
            var IMP = window.IMP;
            IMP.init("imp87438017");
            IMP.request_pay({
                pg: 'inicis', // version 1.1.0부터 지원.
                pay_method: 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: '주문명:결제테스트',
                amount: 100,
                buyer_email: 'iamport@siot.do',
                buyer_name: '구매자이름',
                buyer_tel: '010-1234-5678',
                buyer_addr: '서울특별시 강남구 삼성동',
                buyer_postcode: '123-456',
                m_redirect_url: 'https://www.yourdomain.com/payments/complete'
            }, function (rsp) {
                if (rsp.success) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '고유ID : ' + rsp.imp_uid;
                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                    msg += '결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                }
                alert(msg);
            });
        });

        

    </script>
		
 
	
	
</body>
</html>