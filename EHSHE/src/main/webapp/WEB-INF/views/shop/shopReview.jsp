<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style>
/*댓글*/

.replyWrite>table {
width: 90%;
margin-top : 10px;
} 

#replyContentArea {
	width: 90%;
}

#replyContentArea>textarea {
	resize: none;
	width: 100%;
}

#sreplyBtnArea {
	width: 100px;
	text-align: center;
}

.srWriter {
	display : inline-block;
	margin-right: 30px;
	vertical-align: top;
	font-weight: bold;
	font-size: 1.2em;
	color:#939597;
}

.srDate {
	display : inline-block;
	font-size: 0.5em;
	color: gray;
}

#shopReplyListArea {
	list-style-type: none;
}

.srContent, .btnArea{
	display: inline-block;
	box-sizing: border-box;
}

.srContent {
	height: 100%;
	width : 100%;
	word-break:normal;
}

.sreplyBtnArea {
	text-align: right;
}

.shopReplyUpdateContent {
resize: none;
width: 100%;
}

.shopReply-row{
border-top : 1px solid #ccc;
padding : 15px 0;
}

/* 
/* 답글(대댓글) */
/* 
.childReply-li{
padding-left: 50px;  
}

.childReplyArea{
padding-top : 30px;
width : 100%;
text-align: right;
}

.childReplyContent{
resize: none;  
width : 100%; 
}  */
.star-rating{
     width: 280px;
     text-align: center;
     border-radius: 5px;
     padding: 5px;
     height :35px;
}
.star-rating div{
    float:left;
    width: 50%;
}
.stars{
   color: rgb(190, 190, 190);
}

.stars2{
   color: rgb(190, 190, 190);
}

.stars2 img{
   margin-left: 10px;
}
 
.stars .fa{
    font-size: 20px;
    cursor: pointer;
}

.fas{
   color: yellow;
}

.starReview{
  text-shadow: orange 0 0 5px;
  font-size: 20px;
}

.star{
   font-size: 20px;
}
.stars .fa.active{
    color: yellow;
    text-shadow: black 0 0 5px;
}

.print{
}

.print img{
    vertical-align: middle;
    margin-right: 5px;
    width:23px;
    height:23px;
 }

</style>
    
<div id="reply-area">
	 
	<!-- 댓글 작성 부분 -->
<!--  	   <div class="star-rating">
        <div class="stars">
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
        </div>
        <div class="print">
		   		   별점주기
        </div>
    </div> -->
 
	<div class="replyWrite">
		<table>
			<tr>
				<td id="replyContentArea">
				<div class="star-rating">
        <div class="stars">
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
        </div>
        <div class="print">별점주기</div>
    </div> 
				<textArea rows="3" id="replyShopContent"></textArea>
				</td>
				<td id="sreplyBtnArea">
					<button type="button" class="btn btnColor" id="addShopReply" style="margin-top:22px;">후기<br>등록</button>
				</td>
			</tr>
		</table>
	</div>


	<!-- 댓글 출력 부분 -->
	<div class="replyList mt-5 pt-2">
		<ul id="shopReplyListArea">
			
		
		</ul>
	</div>

	
</div>

<script>

var loginMemberId = "${loginMember.memberId}"; // 로그인한 회원 아이디 (있으면 아이디 없으면 빈문자열)
var replyWriter = "${loginMember.memberNo}";   // 로그인한 회원 번호  -- > 자바스크립트에서는 "1" ==  1  == true
var itemNo = ${shop.itemNo};            // 게시글 번호  -- > 자바스크립트에서는 "1" ==  1  == true


				var num;
			  var starRate = 0;
			  var arr = [];   
			  arr.push('<div class="stars2"><i class="fas fa-star"></i><img src="${contextPath}/resources/shopCommonImg/star-lv1.png"></div>');
			  arr.push('<div class="stars2"><i class="fas fa-star"></i><i class="fas fa-star"></i><img src="${contextPath}/resources/shopCommonImg/star-lv2.png"></div>');
			  arr.push('<div class="stars2"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><img src="${contextPath}/resources/shopCommonImg/star-lv3.png"></div>');
			  arr.push('<div class="stars2"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><img src="${contextPath}/resources/shopCommonImg/star-lv4.png"></div>');
			  arr.push('<div class="stars2"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><img src="${contextPath}/resources/shopCommonImg/star-lv5.png"></div>');


	  $(".stars .fa").on("click", function(){
		    $(this).addClass('active')
		    $(this).prevAll().addClass('active')
		    $(this).nextAll().removeClass('active')

		    var num = $(this).index();
		    starRate = num + 1;
		 
		    if(starRate == 1){$('.print').html('<img src="${contextPath}/resources/shopCommonImg/star-lv1.png">' + '별로예요')}
		    else if(starRate == 2){$('.print').html('<img src="${contextPath}/resources/shopCommonImg/star-lv2.png">' + '보통이예요')}
		    else if(starRate == 3){$('.print').html('<img src="${contextPath}/resources/shopCommonImg/star-lv3.png">' + '그냥 그래요')}
		    else if(starRate == 4){$('.print').html('<img src="${contextPath}/resources/shopCommonImg/star-lv4.png">' + '맘에 들어요')}
		    else{$('.print').html('<img src="${contextPath}/resources/shopCommonImg/star-lv5.png">' + '아주 좋아요')} 
			
	  });
	

// 댓글
// 페이지 로딩 완료 시 댓글 목록 호출
$(function(){
	selectShopViewReplyList();
});
 
// 댓글 목록 불러오기(AJAX)
 function selectShopViewReplyList(){
	
	$.ajax({
		url : "${contextPath}/ShopReviewReply/selectReplyList/" + itemNo,
		type: "post",
		dataType : "json",
		success : function(rList){
			 console.log(rList);
		
			 // 조회된 댓글을 화면에 추가 (새로운 요소(태그)생성)
			// rList에는 현재 게시글의 댓글 List가 담겨 있음.
	         
	         var shopReplyListArea = $("#shopReplyListArea");
	         
	         shopReplyListArea.html(""); // 기존 정보 초기화
	         
	         
	         // 댓글 List 반복 접근
	         $.each(rList, function(index, item){   
	            
	            // 댓글을 출력할 li 요소를 생성
	            var li = $("<li>").addClass("shopReply-row");
	            
	            // 작성자, 작성일, 수정일 영역 
	            var div = $("<div>");
							var starRating =$("<div>").addClass("starReview").html(arr[Number(item.itemRating)-1]);	            
	            var srWriter = $("<a>").addClass("srWriter").html(item.memberId);
	            var srDate = $("<p>").addClass("srDate").html("작성일 : " + item.replyCreateDate + "<br>마지막 수정 날짜 : " + item.replyModifyDate);
	            
	            div.append(starRating).append(srWriter).append(srDate);
	            
	            
	            // 댓글 내용
	            var srContent = $("<p>").addClass("srContent").html(item.replyContent);
	            
	            // 대댓글, 수정, 삭제 버튼 영역
	            var sreplyBtnArea = $("<div>").addClass("sreplyBtnArea");
	            
	         /*     // 로그인 되어 있고, 대댓글이 아닐 경우 경우에 답글 버튼 추가
	            if(loginMemberId != "" && item.replyDepth != 1){
	               var childReply = $("<button type='button'>").addClass("btn btn-sm btn-success ml-1 childReply").text("답글").attr("onclick", "addChildReplyArea(this, "+ item.parentReplyNo + ")");
	            		sreplyBtnArea.append(childReply);
	            }  */
	        
	            // 현재 댓글의 작성자와 로그인한 멤버의 아이디가 같을 때 버튼 추가
	            if(item.memberId == loginMemberId){
	               // ** 추가되는 댓글에 onclick 이벤트를 부여하여 버튼 클릭 시 수정, 삭제를 수행할 수 있는 함수를 이벤트 핸들러로 추가함. 
	               var reShowUpdate = $("<button type='button'>").addClass("btn btnColor btn-sm ml-1").text("수정").attr("onclick", "reShowUpdate(" + item.replyNo + ", this)");
	               var reDeleteReply = $("<button type='button'>").addClass("btn btnColor2 btn-sm ml-1").text("삭제").attr("onclick", "reDeleteReply(" + item.replyNo + ")");
	               
	               sreplyBtnArea.append(reShowUpdate, reDeleteReply);
	            }
	            
	            
	            // 댓글 하나로 합치기
	            li.append(div).append(srContent).append(sreplyBtnArea);
	            
	            // 댓글 영역을 화면에 배치
	            shopReplyListArea.append(li);
	         });
	         
			
		}, error : function(){
			console.log("댓글 목록 조회 실패");
		}
		
		
		
	});
	
} 

//-----------------------------------------------------------------------------------------
 
// 댓글 등록
$("#addShopReply").on("click", function(){
	
	// 로그인 되어있는지 확인
	if(loginMemberId == ""){
		swal({icon : "info", title:"로그인 이후 이용해주세요."})
	
	}else if(starRate == 0){  // 별점을 했는지 확인
		swal({icon : "info", title:"별점을 평가해주시고 등록해주세요.!"})

	}else{ // 로그인이 되어 있는 경우
	
		
		var replyShopContent =$("#replyShopContent").val(); // 작성된 댓글 내용을 얻어와 저장
		
		if(replyShopContent.trim().length == 0){ // 댓글이 작성되지 않은 경우
			
			swal({icon:"info",title: "댓글 작성 후 클릭해주세요."});			
			
		}else{ // 로그인 o , 댓글 작성 o 인 경우

			$.ajax({
				url : "${contextPath}/ShopReviewReply/insertReply/" + itemNo,
				type : "post",
				data :{"replyWriter" : replyWriter , "replyShopContent" : replyShopContent ,"starRate" : starRate},
				
				success: function(result){
					
					if(result>0){ // 댓글 삽입 성공
					  $("#replyShopContent").val(""); // 작성한 댓글 내용을 삭제
					  swal({icon:"success", title : "댓글 삽입 성공"});
					  selectShopViewReplyList();
					}
				  if(result == 0){
					  $("#replyShopContent").val(""); // 작성한 댓글 내용을 삭제
					 
					  swal({icon:"info", title : "상품을 구매하신 후 후기를 작성해주세요!"});
					  selectReplyList(); // 다시 목록 조회
				  }
					
				}, error : function(){
					console.log("댓글 삽입 실패");
				}
				
				
			});
		}
		
	}
	
});


//-----------------------------------------------------------------------------------------

//댓글 수정 폼

 var reBeforeReplyRow;
function reShowUpdate(replyNo, el){
	// replyNo : 수정하려는 댓글 번호
	// el  : 클릭된 수정 버튼 요소 자체
	   
	// 이미 열려있는 댓글 수정 창이 있을 경우 닫아주기
	   if($(".shopReplyUpdateContent").length > 0){
	      $(".shopReplyUpdateContent").eq(0).parent().html(reBeforeReplyRow);
	   }
	   
	   // 댓글 수정화면 출력 전 요소를 저장해둠.
	   reBeforeReplyRow = $(el).parent().parent().html();
	   
	   // 작성되어있던 내용(수정 전 댓글 내용) 
	   var reBeforeContent = $(el).parent().prev().html();
	   
	   
	   // 이전 댓글 내용의 크로스사이트 스크립트 처리 해제, 개행문자 변경
	   // -> 자바스크립트에는 replaceAll() 메소드가 없으므로 정규 표현식을 이용하여 변경
	   reBeforeContent = reBeforeContent.replace(/&amp;/g, "&");   
	   reBeforeContent = reBeforeContent.replace(/&lt;/g, "<");   
	   reBeforeContent = reBeforeContent.replace(/&gt;/g, ">");   
	   reBeforeContent = reBeforeContent.replace(/&quot;/g, "\"");   
	   
	   reBeforeContent = reBeforeContent.replace(/<br>/g, "\n");   
	   
	   
	   // 기존 댓글 영역을 삭제하고 textarea를 추가 
	   $(el).parent().prev().remove();
	   var textarea = $("<textarea>").addClass("shopReplyUpdateContent").attr("rows", "3").val(reBeforeContent);
	   $(el).parent().before(textarea);
	   
	   
	   // 수정 버튼
	   var reUpdateReply = $("<button type='button'>").addClass("btn btnColor btn-sm ml-1 mb-4").text("댓글 수정").attr("onclick", "reUpdateReply(" + replyNo + ", this)");
	   
	   // 취소 버튼
	   var reCancelBtn = $("<button type='button'>").addClass("btn btnColor2 btn-sm ml-1 mb-4").text("취소").attr("onclick", "reUpdateCancel(this)");
	   
	   var sreplyBtnArea = $(el).parent();
	   
	   $(sreplyBtnArea).empty(); 
	   $(sreplyBtnArea).append(reUpdateReply); 
	   $(sreplyBtnArea).append(reCancelBtn); 	
	
}

//-----------------------------------------------------------------------------------------


//댓글 수정
 function reUpdateReply(replyNo, el){
	 // replyNo : 수정하려는 댓글 번호
	 // el : "댓글 수정" 버튼
	
	 // 수정된 댓글 내용 저장
	 var replyShopContent = $(el).parent().prev().val();
	 
	 if(replyShopContent.trim().length == 0){ // 댓글이 작성되지 않은 경우
		 swal({icon: "info" , title:"댓글을 작성해주세요."});
	 }else{
		 
		 // queryString : 주소에 파라미터를 담아서 전달
		 // -> /reply/updateReply?replyNo=100&replyContent=abcs
				 
		 // PathVariable : 주소 경로 중 특정 부분을 값(변수)로 사용
		 // -> /reply/updateReply/500
		 
		 // 언제 PathVariable? 언제 queryString?
		 // PathVariable : 식별
		 // queryString : 필터, 검색조건을 만들 때
		 
		 
	 $.ajax({
				url : "${contextPath}/ShopReviewReply/updateReply/"+ replyNo,
				type: "post",
				data: {"replyShopContent" : replyShopContent},
				success : function(result){
					
					if(result > 0){
						swal({icon : "success" , title : "댓글 수정 성공"});
						selectShopViewReplyList();
					}else{
						swal({icon : "error" , title : "댓글 수정 실패"});
					}
					
				}, error : function(){
					console.log("댓글 수정 실패");
				}
			 
		 });
		 
	 }
	
} 
//-----------------------------------------------------------------------------------------

//댓글 수정 취소 시 원래대로 돌아가기
function reUpdateCancel(el){
	// el : 취소 버튼 자체
	// beforeReplyRow : 수정 전 댓글 내용이 있던 요소 
	$(el).parent().parent().html(reBeforeReplyRow);
	
} 
//-----------------------------------------------------------------------------------------

//댓글 삭제
 function reDeleteReply(replyNo){
	// replyNo : 삭제할 댓글의 번호
	if(confirm("정말로 삭제하시겠습니까?")){
		
		$.ajax({
			url : "${contextPath}/ShopReviewReply/deleteReply/" + replyNo,
			success: function(result) {
				
				// result : 댓글 삭제 결과, 성공 : 1, 실패 : 0
				
				if(result>0){
					
					swal({icon :"success",title:"댓글 삭제 성공"});
					selectShopViewReplyList();
					
				}
				
			}, error:function(){
				
				console.log("댓글 삭제실패")
			}
			
		});
		
	}
	
} 


</script>