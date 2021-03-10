<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

<style>
.container-fluid {
	margin-top: 15px;
}

.rWriter {
	display : inline-block;
	margin-right: 30px;
	vertical-align: top;
	font-weight: bold;
	font-size: 1.2em;
}

.rDate {
	display : inline-block;
	font-size: 0.5em;
	color: gray;
}

#reviewContent{
	width:100%;
}

.review-row{
	height:80%;
}

#reviewListArea {
	list-style-type: none;
}

.placeReview {
	/* border-bottom: 2px solid rgb(230, 230, 230); */
	margin-bottom: 10px;
	margin-top: 10px;
}

.placeReview {
	width:100%;
}


.placeReview img {
	width: 95px;
	height: 95px;
	margin-bottom: 10px;
}

.reviewBtnArea{
	display: flex;
	justify-content: flex-end;
	align-items: flex-end;
}

.reviewHeader>div>h6 {
	text-align: right;
}

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
  text-shadow: black 0 0 5px;
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

.star-rating{margin-bottom : 5px;}

.reviewUpdateContent{
	width:100%;
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
	
	<div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="row reviewHeader">
                    <div class="col-md-2">
                    
                    
                        <h4>리뷰</h4>
                    </div>
                    <div class="col-md-10">
                        <h6>전체( ${place.reviewCount} )</h6>
                    </div>
                </div>
                
                
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-10">
                    
                       <div class="placeReview">
													<div id="reviewContentArea">
													
														 <div class="star-rating">
												        <div class="stars">
												            <i class="fa fa-star" id="start1"></i>
												            <i class="fa fa-star" id="start2"></i>
												            <i class="fa fa-star" id="start3"></i>
												            <i class="fa fa-star" id="start4"></i>
												            <i class="fa fa-star" id="start5"></i>
												        </div>
												        <div class="print"> 별점 주기</div>
												   	 </div>
														
														<textArea rows="3" id="reviewContent"></textArea>
													</div>
														
													<div class="reviewBtnArea">
														<button class="btn ehsheYellow" id="addReview">댓글</button>
													</div>
											</div>
                        
                      <div class="reviewList mt-5 pt-2">
												<ul id="reviewListArea">
													
												</ul>
											</div>
                        
                    </div>
                </div>
                
            </div>
        </div>
    </div>

<script>
var loginMemberId = "${loginMember.memberId}";
var reviewWriter = "${loginMember.memberNo}";
var parentPlaceNo = ${place.placeNo};
//var ratingPoint = $(".print").child().eq(1).text();

// 별점주기 
var num;
var starRate = 0;
	
var arr = [];	
arr.push('<div class="stars2"><i class="fas fa-star"></i><img src="${contextPath}/resources/images/star-lv1.png"></div>');
arr.push('<div class="stars2"><i class="fas fa-star"></i><i class="fas fa-star"></i><img src="${contextPath}/resources/images/star-lv2.png"></div>');
arr.push('<div class="stars2"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><img src="${contextPath}/resources/images/star-lv3.png"></div>');
arr.push('<div class="stars2"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><img src="${contextPath}/resources/images/star-lv4.png"></div>');
arr.push('<div class="stars2"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><img src="${contextPath}/resources/images/star-lv5.png"></div>');

$('.stars .fa').click(function(){
    $(this).addClass('active')
    $(this).prevAll().addClass('active')
    $(this).nextAll().removeClass('active')
    

    num = $(this).index()
    starRate = num + 1
    
    if(starRate == 1){
    	$('.print').html('<img src="${contextPath}/resources/images/star-lv1.png">' + '별로예요')
    }else if(starRate == 2){
    	$('.print').html('<img src="${contextPath}/resources/images/star-lv2.png">' + '보통이예요')
    }else if(starRate == 3){
    	$('.print').html('<img src="${contextPath}/resources/images/star-lv3.png">' + '그냥 그래요')
    }else if(starRate == 4){
    	$('.print').html('<img src="${contextPath}/resources/images/star-lv4.png">' + '맘에 들어요')
    }else{
    	$('.print').html('<img src="${contextPath}/resources/images/star-lv5.png">' + '아주 좋아요')
    }
    
});


// 페이지 로딩 완료 시 댓글 목록 호출
$(function(){
	selectReviewList();
});

function selectReviewList(){
	$.ajax({
		url: "${contextPath}/review/selectReviewList/"+ parentPlaceNo,
		type: "post",
		dataType : "json",
		success : function(rList){
	         
	         var reviewListArea = $("#reviewListArea");
	         
	         reviewListArea.html("");
	         
	         $.each(rList, function(index, item){   
	            var li = $("<li>").addClass("review-row");
	            var div = $("<div>");
	            var starRating = $("<div>").addClass("starReview").html(arr[ Number(item.reviewRating) -1 ]);
	            var rWriter = $("<span>").addClass("rWriter").html(item.memberId);
	            var rDate = $("<p>").addClass("rDate").html("작성일 : " + item.reviewCreateDate + "<br>마지막 수정 날짜 : " + item.reviewModifyDate);
	            div.append(starRating).append(rWriter).append(rDate)
	            
	            // 댓글 내용
	            var rContent = $("<p>").addClass("rContent").html(item.reviewContent);
	            
	            // 대댓글, 수정, 삭제 버튼 영역
	            var reviewBtnArea = $("<div>").addClass("reviewBtnArea");
	            
	            if(item.memberId == loginMemberId){
	               
	               var showUpdate = $("<button>").addClass("btn ehsheYellow btn-sm ml-1").text("수정").attr("onclick", "showUpdateReview(" + item.reviewNo + ", this)");
	               var deleteReview = $("<button>").addClass("btn ehsheYellow btn-sm ml-1").text("삭제").attr("onclick", "deleteReview(" + item.reviewNo + ")");
	               
	               reviewBtnArea.append(showUpdate, deleteReview);
	            }
	            
	            li.append(div).append(rContent).append(reviewBtnArea);
	            
	            reviewListArea.append(li);
	         });
		},
		error : function(){
			console.log("댓글 목록 조회 실패");
		}
	});
	
}

//-----------------------------------------------------------------------------------------

// 댓글 등록
$("#addReview").on("click", function(){
	
	// 로그인이 되어있는지 확인
	if(loginMemberId == ""){
		swal({icon : "info", title : "로그인 후 이용해 주세요"});
		
	}else{
		
		var reviewContent = $("#reviewContent").val();
		
		if(reviewContent.trim().length == 0){
			swal({icon:"info", title:"댓글 작성 후 클릭해 주세요."})
			
		}else{ // 로그인 O, 댓글작성 O
			
			if(starRate == 0){
				swal({icon:"info", title:"별점을 안주셨어요~"})
				
			}else{
			
				$.ajax({
					url : "${contextPath}/review/insertReview/"+ parentPlaceNo,
					type : "post",
					data : {"reviewWriter" : reviewWriter, "reviewContent" : reviewContent, "starRate" : starRate},
					success : function(result){
						
						if(result > 0){ // 댓글 삽입 성공
							$("#reviewContent").val(""); //작성한 댓글 내용을 삭제
								swal({icon:"success", title:"댓글 삽입 성공"});
								selectReviewList(); // 다시 목록 조회
						}
						
					},
					error: function(){
						console.log("댓글 삽입 실패")
					}
					
				});
			}
		}
	}
	
	
	
});




//댓글 수정 폼

var beforeReviewRow;

function showUpdateReview(reviewNo, el){
	   if($(".reviewUpdateContent").length > 0){
	      $(".reviewUpdateContent").eq(0).parent().html(beforeReviewRow);
	   }
	   
	   beforeReviewRow = $(el).parent().parent().html();
	   
	   var beforeContent = $(el).parent().prev().html();
	   
	   
	   beforeContent = beforeContent.replace(/&amp;/g, "&");   
	   beforeContent = beforeContent.replace(/&lt;/g, "<");   
	   beforeContent = beforeContent.replace(/&gt;/g, ">");   
	   beforeContent = beforeContent.replace(/&quot;/g, "\"");   
	   
	   beforeContent = beforeContent.replace(/<br>/g, "\n");   
	   
	   
	   $(el).parent().prev().remove();
	   var textarea = $("<textarea>").addClass("reviewUpdateContent").attr("rows", "3").val(beforeContent);
	   $(el).parent().before(textarea);
	   
	   
	   // 수정 버튼
	   var updateReview = $("<button>").addClass("btn ehsheYellow btn-sm ml-1 mb-4").text("댓글 수정").attr("onclick", "updateReview(" + reviewNo + ", this)");
	   
	   // 취소 버튼
	   var cancelBtn = $("<button>").addClass("btn ehsheYellow btn-sm ml-1 mb-4").text("취소").attr("onclick", "updateCancel(this)");
	   
	   var reviewBtnArea = $(el).parent();
	   
	   $(reviewBtnArea).empty(); 
	   $(reviewBtnArea).append(updateReview); 
	   $(reviewBtnArea).append(cancelBtn); 
	
}

//-----------------------------------------------------------------------------------------


//댓글 수정
function updateReview(reviewNo, el){
	
	var reviewContent = $(el).parent().prev().val();
	
	if(reviewContent.trim().length == 0){ // 댓글이 작성되지 않은 경우
		swal({icon:"info", title: "댓글을 작성해주세요."})	
	}else{
		
		$.ajax({
			url : "${contextPath}/review/updateReview/" + reviewNo,
			type : "post",
			data : {"reviewContent" : reviewContent},
			success : function(result){
				
				if(result > 0){
					swal({icon : "success", title:"댓글 수정 성공"});
					selectReviewList();
				}
				
			}, error : function(){
				console.log("댓글 수정 실패");
			}
			
		})
	}
}

//-----------------------------------------------------------------------------------------


//댓글 수정 취소 시 원래대로 돌아가기
function updateCancel(el){
	$(el).parent().parent().html(beforeReviewRow);
}
//-----------------------------------------------------------------------------------------

//댓글 삭제
function deleteReview(reviewNo){
	
	if(confirm("정말로 삭제하시겠습니까?")){
		
		$.ajax({
			url : "${contextPath}/review/deleteReview/" + reviewNo,
			success : function(result){
				
				if(result > 0){
					swal({ icon : "success", title : "댓글 삭제 성공"});
					selectReviewList();
				}
				
			}, error : function(){
				console.log("댓글 삭제 실패");
			}
			
		});
		
	}
	
}
</script>
	
	
</body>
</html>