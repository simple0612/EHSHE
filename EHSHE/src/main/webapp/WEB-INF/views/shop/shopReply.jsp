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

#replyBtnArea {
	width: 100px;
	text-align: center;
}

.rWriter {
	display : inline-block;
	margin-right: 30px;
	vertical-align: top;
	font-weight: bold;
	font-size: 1.2em;
	color:#939597;
}

.rDate {
	display : inline-block;
	font-size: 0.5em;
	color: gray;
}

#replyListArea {
	list-style-type: none;
}

.rContent, .btnArea{
	display: inline-block;
	box-sizing: border-box;
}

.rContent {
	height: 100%;
	width : 100%;
	word-break:normal;
}


.replyBtnArea {
	text-align: right;
}


.replyUpdateContent {
	resize: none;
	width: 100%;
}


.reply-row{
	border-top : 1px solid #ccc;
	padding : 15px 0;
}

/* 답글(대댓글) */
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
}
.btnColor{
  background-color: #F5dF4D;
  color:white;
}
.btnColor2{
  background-color: #939597;
  color: white;
}


</style>
<div id="reply-area">
	<!-- 댓글 작성 부분 -->
	<div class="replyWrite">
		<table align="center">
			<tr>
				<td id="replyContentArea"><textArea rows="3" id="replyContent"></textArea>
				</td>
				<td id="replyBtnArea">
					<button type="button" class="btn btnColor" id="addReply" style="margin-bottom:15px;">댓글<br>등록</button>
				</td>
			</tr>
		</table>
	</div>


	<!-- 댓글 출력 부분 -->
	<div class="replyList mt-5 pt-2">
		<ul id="replyListArea">
			
		
		</ul>
	</div>

	
</div>

<script>
var loginMemberId = "${loginMember.memberId}"; // 로그인한 회원 아이디 (있으면 아이디 없으면 빈문자열)
var replyWriter = "${loginMember.memberNo}"; 
var replyGrade = "${loginMember.memberGrade}";
var parentBoardNo = ${shop.itemNo}; // 게시글 번호  -- > 자바스크립트에서는 "1" ==  1  == true

// 댓글
// 페이지 로딩 완료 시 댓글 목록 호출
$(function(){
	selectReplyList();
});

// 댓글 목록 불러오기(AJAX)
function selectReplyList(){
	
	$.ajax({
		url : "${contextPath}/ShopReply/selectReplyList/" + parentBoardNo,
		type: "post",
		dataType : "json",
		success : function(rList){
			
			// 조회된 댓글을 화면에 추가 (새로운 요소(태그)생성)
			// rList에는 현재 게시글의 댓글 List가 담겨 있음.
	        
	         var replyListArea = $("#replyListArea");
	         
	         replyListArea.html(""); // 기존 정보 초기화
	         
	         
	         // 댓글 List 반복 접근
	         $.each(rList, function(index, item){   
	            	console.log(item.replyNo);
	            // 댓글을 출력할 li 요소를 생성
	            var li = $("<li>").addClass("reply-row");
	            
	            
	            // 댓글의 깊이가 1인 요소는 대댓글 이므로 별도 스타일을 적용할 수 있도록 childReply-li 클래스를 추가
	            if(item.replyDepth == 1){
	               li.addClass("childReply-li");
	            }
	            
	            // 작성자, 작성일, 수정일 영역 
	            var div = $("<div>");
	            var rWriter = $("<a>").addClass("rWriter").html(item.memberId);
	            var rDate = $("<p>").addClass("rDate").html("작성일 : " + item.replyCreateDate + "<br>마지막 수정 날짜 : " + item.replyModifyDate);
	            div.append(rWriter).append(rDate)
	            
	            
	            // 댓글 내용
	            var rContent = $("<p>").addClass("rContent").html(item.replyContent);
	            
	            // 대댓글, 수정, 삭제 버튼 영역
	            var replyBtnArea = $("<div>").addClass("replyBtnArea");
	            
	            // 로그인 되어 있고, 대댓글이 아닐 경우 경우에 답글 버튼 추가
	            if(loginMemberId != "" && item.replyDepth != 1){
	               var childReply = $("<button type='button'>").addClass("btn btn-sm btnColor ml-1 childReply").text("답글").attr("onclick", "addChildReplyArea(this, "+ item.parentReplyNo + ")");
	               replyBtnArea.append(childReply);
	            }
	            
	            // 현재 댓글의 작성자와 로그인한 멤버의 아이디가 같을 때 버튼 추가
	            if(item.memberId == loginMemberId){
	               
	               // ** 추가되는 댓글에 onclick 이벤트를 부여하여 버튼 클릭 시 수정, 삭제를 수행할 수 있는 함수를 이벤트 핸들러로 추가함. 
	               var showUpdate = $("<button type='button'>").addClass("btn btnColor btn-sm ml-1").text("수정").attr("onclick", "showUpdateReply(" + item.replyNo + ", this)");
	               var deleteReply = $("<button type='button'>").addClass("btn btnColor2 btn-sm ml-1").text("삭제").attr("onclick", "deleteReply(" + item.replyNo + ")");
	               
	               replyBtnArea.append(showUpdate, deleteReply);
	            }
	            
	            
	            // 댓글 하나로 합치기
	            li.append(div).append(rContent).append(replyBtnArea);
	            
	            // 댓글 영역을 화면에 배치
	            replyListArea.append(li);
	         });
	         
			
		}, error : function(){
			console.log("댓글 목록 조회 실패");
		}
		
		
		
	});
	
}

//-----------------------------------------------------------------------------------------

// 댓글 등록
$("#addReply").on("click", function(){
	
	// 로그인 되어있는지 확인
	if(loginMemberId == ""){
		swal({icon : "info", title:"로그인 이후 이용해주세요."})
	
	}else{ // 로그인이 되어 있는 경우
		
		var replyContent =$("#replyContent").val(); // 작성된 댓글 내용을 얻어와 저장
		
		if(replyContent.trim().length == 0){ // 댓글이 작성되지 않은 경우
			
			swal({icon:"info",title: "댓글 작성 후 클릭해주세요."});			
			
		}else{ // 로그인 o , 댓글 작성 o 인 경우

			$.ajax({
				url : "${contextPath}/ShopReply/insertReply/" + parentBoardNo,
				type : "post",
				data :{"replyWriter" : replyWriter, "replyContent" : replyContent},
				success: function(result){
					
					 if(result>0){ // 댓글 삽입 성공
					  $("#replyContent").val(""); // 작성한 댓글 내용을 삭제
					  swal({icon:"success", title : "댓글 삽입 성공"});
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

var beforeReplyRow;

function showUpdateReply(replyNo, el){
	// replyNo : 수정하려는 댓글 번호
	// el  : 클릭된 수정 버튼 요소 자체
	   
	// 이미 열려있는 댓글 수정 창이 있을 경우 닫아주기
	   if($(".replyUpdateContent").length > 0){
	      $(".replyUpdateContent").eq(0).parent().html(beforeReplyRow);
	   }
	   
	   // 댓글 수정화면 출력 전 요소를 저장해둠.
	   beforeReplyRow = $(el).parent().parent().html();
	   
	   // 작성되어있던 내용(수정 전 댓글 내용) 
	   var beforeContent = $(el).parent().prev().html();
	   
	   
	   // 이전 댓글 내용의 크로스사이트 스크립트 처리 해제, 개행문자 변경
	   // -> 자바스크립트에는 replaceAll() 메소드가 없으므로 정규 표현식을 이용하여 변경
	   beforeContent = beforeContent.replace(/&amp;/g, "&");   
	   beforeContent = beforeContent.replace(/&lt;/g, "<");   
	   beforeContent = beforeContent.replace(/&gt;/g, ">");   
	   beforeContent = beforeContent.replace(/&quot;/g, "\"");   
	   
	   beforeContent = beforeContent.replace(/<br>/g, "\n");   
	   
	   
	   // 기존 댓글 영역을 삭제하고 textarea를 추가 
	   $(el).parent().prev().remove();
	   var textarea = $("<textarea>").addClass("replyUpdateContent").attr("rows", "3").val(beforeContent);
	   $(el).parent().before(textarea);
	   
	   
	   // 수정 버튼
	   var updateReply = $("<button type='button'>").addClass("btn btnColor btn-sm ml-1 mb-4").text("댓글 수정").attr("onclick", "updateReply(" + replyNo + ", this)");
	   
	   // 취소 버튼
	   var cancelBtn = $("<button type='button'>").addClass("btn btnColor2 btn-sm ml-1 mb-4").text("취소").attr("onclick", "updateCancel(this)");
	   
	   var replyBtnArea = $(el).parent();
	   
	   $(replyBtnArea).empty(); 
	   $(replyBtnArea).append(updateReply); 
	   $(replyBtnArea).append(cancelBtn); 	
	
}

//-----------------------------------------------------------------------------------------


//댓글 수정
function updateReply(replyNo, el){
	 // replyNo : 수정하려는 댓글 번호
	 // el : "댓글 수정" 버튼
	
	 // 수정된 댓글 내용 저장
	 var replyContent = $(el).parent().prev().val();
	 
	 if(replyContent.trim().length == 0){ // 댓글이 작성되지 않은 경우
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
				url : "${contextPath}/ShopReply/updateReply/"+ replyNo,
				type: "post",
				data: {"replyContent" : replyContent},
				success : function(result){
					
					if(result > 0){
						swal({icon : "success" , title : "댓글 수정 성공"});
						selectReplyList();
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
function updateCancel(el){
	// el : 취소 버튼 자체
	// beforeReplyRow : 수정 전 댓글 내용이 있던 요소 
	$(el).parent().parent().html(beforeReplyRow);
	
}
//-----------------------------------------------------------------------------------------

//댓글 삭제
function deleteReply(replyNo){
	// replyNo : 삭제할 댓글의 번호
	if(confirm("정말로 삭제하시겠습니까?")){
		
		$.ajax({
			url : "${contextPath}/ShopReply/deleteReply/" + replyNo,
			success: function(result) {
				
				// result : 댓글 삭제 결과, 성공 : 1, 실패 : 0
				
				if(result>0){
					
					swal({icon :"success",title:"댓글 삭제 성공"});
					selectReplyList();
					
				}
				
			}, error:function(){
				
				console.log("댓글 삭제실패")
			}
			
		});
		
	}
	
}

//---------------------------------------------------------------------------------------------------------

// 답글 버튼 동작(대댓글 작성 영역 생성)
// 1) 답글 버튼을 클릭한 댓글 밑에 생성되어야함.
// 		+ placeholder로  ' "댓글 작성자"에게 답글 작성하기'  라는 문구 추가
// 2) 대댓글 작성 영역은 여러 개가 아닌 딱 하나만 생성되게 해야함.

function addChildReplyArea(el,parentReplyNo){
	// el : 클릭한 답글 버튼
	// parentReplyNo : 답글 버튼이 클릭된  부모 댓글 번호
	
	
	// 일단 생성되어 있는 모든  대댓글 작성 영역을 화면에서 제거
	var check = cancelChildReply();
	
	
	// 이전에 생성된 대댓글 영역이 모두 삭제된 경우에만 새로운 대댓글 영역 생성
	if(check){
	
	// 댓글 작성자 아이디 얻어오기
	var writer =$(el).parent().prev().prev().children("a").text();
	
	
	// 댓글 작성 영역에 필요한 요소(textarea, button 2개) 생성
	
	var div = $("<div>").addClass("childReplyArea"); // 대댓글 작성 영역 전체를 감싼 div
	var textarea =$("<textarea row='3'>").addClass("childReplyContent")
	                .attr("placeholder", writer +"님께 답글 작성하기");
	
	var btnArea =  $("<div>").addClass("btnArea"); // 등록, 취소 버튼을 감쌀 div
	var insertBtn = $("<button type='button'>").addClass("btn btn-sm btnColor ml-1").text("등록")
									.attr("onclick","addChildReply(this, "+ parentReplyNo + ")");
												// onclick="addChildReply(this,5)"
	
	
  var cancelBtn =$("<button type='button'>").addClass("btn btn-sm btnColor2 ml-1 reply-cancel").text("취소")
  								.attr("onclick","cancelChildReply()");
	
	btnArea.append(insertBtn).append(cancelBtn); // 버튼 영역에 등록, 취소 버튼 추가
	div.append(textarea).append(btnArea); // 대댓글 영역에 textarea, 버튼 영역 추가
	
	$(el).parent().after(div); // 답글 버튼 부모 요소 다음(이후)에 대댓글 영역 추가
	
	// 추가된 대댓글 영역으로 포커스 이동
	$(".childReplyContent").focus();
	}
}
//-------------------------------------------------


// 답글(대댓글) 취소
// 내용이 작성되어 있으면 취소버튼 클릭 시 confirm 창 띄우기
function cancelChildReply(){

	// 대댓글 영역에 작성된 내용 얻어오기
	var tmp = $(".childReplyContent").val();

	
	// 대댓글 textarea에 아무것도 작성되지 않았거나,  대댓글 textarea가 없을 경우
	// == 아무것도 작성되지 않으면 confirm창으로 확인하는 과정없이 바로 닫히게 만듦.
	
	if(tmp == "" || tmp == undefined){
		
	// 대댓글 작성 영역 (childReplyArea)을 모두 제거
	$(".childReplyArea").remove();
	
	return true;
		
	}else{  // 대댓글 textarea에 내용이 작성되어 있을 경우
		
		var cancelConfirm = confirm("작성된 댓글 내용이 사라집니다. 작성 취소 하시겠습니까?");
		
		if(cancelConfirm){
			$(".childReplyArea").remove();
		}
	
		
		return cancelConfirm;
	}
	
	
}

// ---------------------------------------------------------------------------

// 답글(대댓글 ) 등록
function addChildReply(el,parentReplyNo){
	// el : 대댓글 등록버튼
	// parentReplyNo : 대댓글이 작성된 부모 댓글 번호
	
	// 작성된 대댓글 내용 얻어오기
	var replyContent = $(el).parent().prev().val();
	
	if(replyContent.trim().length == 0){ // 대댓글 미작성 시
		swal({icon : "info" , title : "댓글 작성 후 클릭해주세요."});

	}else{
		
		$.ajax({
			url : "${contextPath}/ShopReply/insertChildReply/" + parentBoardNo,
			data : {"parentReplyNo" : parentReplyNo, 
							"replyContent" : replyContent,
							"replyWriter" : replyWriter},
		
			type :"post",
			success : function(result){
				
				if(result > 0){
					
					swal({icon:"success", title : "답글 등록 성공"});
					selectReplyList();
				}
				
			}, error : function(){
				console.log("답글(대댓글) 등록 실패");
			}
			
			
			
		});
		
		
		
		
	}
	
	
	
}


</script>