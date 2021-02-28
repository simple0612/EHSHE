<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0">

    <link rel="stylesheet" href="${contextPath}/resources/css/shop/cart.css">
    
    <title>cart</title>
    <style>
    header{
        position:relative !important;
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
            <div class="cart-info">
                <div class="cart-items-info">
                    <div class="cart-items">
                        <div class="check-items">
                            <input type="checkbox" class="checkall" id="checkall" onclick='selectAll(this)'>
                            <label for="checkall"><em></em>전체선택</label>
                            <button type="button" class="delete-all">삭제</button>
                        </div>
                        <div class="cart-item">
                            <div class="check-item">
                                <input type="checkbox" name="ck" class="checkone" id="checkone1">
                                <label for="checkone1"><em></em></label>
                            </div>
                            <div class="cart-img">
                                <img src="" alt="">
                            </div>
                            <div class="cart-item-name">
                                <span><a href=#>커플 팔찌</a></span>
                                <span> FREE </span>
                            </div>
                            <div class="cart-price">
                                <div class="item-price">
                                    <span class="iprice">21000</span>
                                </div>
                                <div class="item-number">
                                    <span class="item-num">3</span>
                                </div>
                                <div class="item-delete">
                                    <span class="delete-btn">삭제</span>
                                </div>
                            </div>
                        </div>
                        <div class="cart-item">
                            <div class="check-item">
                                <input type="checkbox" name="ck" class="checkone" id="checkone2">
                                <label for="checkone2"><em></em></label>
                            </div>
                            <div class="cart-img">
                                <img src="" alt="">
                            </div>
                            <div class="cart-item-name">
                                <span><a href=#>커플 팔찌</a></span>
                                <span> FREE </span>
                            </div>
                            <div class="cart-price">
                                <div class="item-price">
                                    <span class="iprice">10000</span>
                                </div>
                                <div class="item-number">
                                    <span class="item-num">2</span>
                                </div>
                                <div class="item-delete">
                                    <span>삭제</span>
                                </div>
                            </div>
                        </div>
                        <div class="cart-item">
                            <div class="check-item">
                                <input type="checkbox" name="ck" class="checkone" id="checkone3">
                                <label for="checkone3"><em></em></label>
                            </div>
                            <div class="cart-img">
                                <img src="" alt="">
                            </div>
                            <div class="cart-item-name">
                                <span><a href=#>커플 팔찌</a></span>
                                <span> FREE </span>
                            </div>
                            <div class="cart-price">
                                <div class="item-price">
                                    <span class="iprice">15000</span>
                                </div>
                                <div class="item-number">
                                    <span class="item-num">1</span>
                                </div>
                                <div class="item-delete">
                                    <span>삭제</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="payment-info">
                    <div class="payment-items">
                        <form action="#" method="POST">
                            <div class="item-total-price price">
                                <label for="tprice">총가격</label>
                                <input type="number" id="tprice" value="" readonly/>
                            </div>
                            <div class="ship-price price">
                                <label for="sprice">배송비</label>
                                <input type="number" id="sprice" value="" readonly/>
                            </div>
                            <div class="total-price price">
                                <label for=tsprice>총가격 + 배송비</label>
                                <input type="number" id="tsprice" value=""  readonly/>
                            </div>
                            <div class="pay-area">
                                <button type="submit" class="do_payment">
                                    결제하기
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>

        /* 전체 체크박스 선택시 모두 선택 */
       function selectAll(selectAll){
				const selectReply = document.getElementsByName('ck');
				selectReply.forEach((checkbox)=>{
					checkbox.checked = selectAll.checked;
                    
                   
				})
			}
         /* 개별 삭제 버튼 */   
        $(".delete-btn").on("click", function(){
            $.ajax
        }); 


    
        
        /* 전체 삭제 버튼 */
        $(".delete-all").on("click", function(){
            var list = [];
            $("input:checkbox[name='ck']:checked").each(function(index){
                if($(this).val() != "on"){
                    list.push()
                }
            });
        })
        
      
      
      
      
        // - 체크된 물건의 가격을 얻어오는 방법
        var totalprice = 0;
        $(".checkone").on("click", function(){
            
            var iprice = Number($(this).parent().next().next().next().children().children().eq(0).text());
            var inumber = Number($(this).parent().next().next().next().children().children().eq(1).text());

            if($(this).prop("checked")){
                totalprice += (iprice * inumber); 
                $("#tprice").val(totalprice);
            }else{
                totalprice -= (iprice * inumber);
                $("#tprice").val(totalprice);
                $(".checkall").prop("checked",false);
            }


            if(totalprice > 20000){
                var sprice = 2000;
                $("#sprice").val(sprice);
            }else{
                var sprice = 0;
                $("#sprice").val(sprice);
            }
            $("#tsprice").val(totalprice + sprice);
        });

        
        // 전체 체크된 물건의 가격을 얻어오는 방법.
        var alltotalprice = 0;
        
        $(".checkall").on("click",function(){
            totalprice = 0;
        
        //    console.log($(".iprice"))
        for(let i=0; i<$(".iprice").length; i++){


            var inumber = Number($(".item-num")[i].innerText);
            
            var itprice = Number($(".iprice")[i].innerText);
            
            
            totalprice += (itprice * inumber);
            
         }

         if($(this).prop("checked")){


             $("#tprice").val(totalprice);


             if(totalprice > 20000){

                var sprice = 2000; 
                $("#sprice").val(sprice);
             
                $("#tsprice").val(totalprice + sprice);
             }
         } else{

            totalprice = 0;

            $("#tprice").val(0);
            $("#sprice").val(0);
            $("#tsprice").val(0);
         }
        //console.log(totalprice);

        });



        
        
        // - 얻어온 가격 총합을 화면에 출력하는 방법 
        


        // - 삭제버튼 누르면 없애는 방법 등등





    </script>
	
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>