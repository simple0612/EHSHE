<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style>
/*댓글*/

.replyWrite{
border-top : 1px solid #ccc;
}

.replyWrite>table {
	width: 90%;
	margin-top : 100px;
}

#replyContentArea {
	width: 80%;
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
}

.rDate {
	display : inline-block;
	font-size: 0.5em;
	color: gray;
}

.placeReview textarea{
	width: 400px;
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

/* 답글 */
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

.ehsheYellow{
    background-color: #F5dF4D !important;
}


</style>
<div id="reply-area ">
	<!-- 댓글 작성 부분 -->
	<div class="replyWrite">
		<table align="center" id="">
			<tr>
				<td id="replyContentArea"><textArea rows="3" id="replyContent"></textArea>
				</td>
				<td id="replyBtnArea">
					<button class="btn ehsheYellow" id="addReply">댓글</button>
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
var loginMemberId = "${loginMember.memberId}";
var replyWriter = "${loginMember.memberNo}";
var parentBoardNo = ${board.boardNo};

// 페이지 로딩 완료 시 댓글 목록 호출
$(function(){
	selectReplyList();
});

function selectReplyList(){
	$.ajax({
		url: "${contextPath}/reply/selectReplyList/"+ parentBoardNo,
		type: "post",
		dataType : "json",
		success : function(rList){
	         
	         var replyListArea = $("#replyListArea");
	         
	         replyListArea.html("");
	         
	         $.each(rList, function(index, item){   
	        	 
	            var li = $("<li>").addClass("reply-row");
	            
	            if(item.replyDepth == 1){
	               li.addClass("childReply-li");
	            }
	            
	            var div = $("<div>");
	            var rWriter = $("<span>").addClass("rWriter").html(item.memberId);
	            var rDate = $("<p>").addClass("rDate").html("작성일 : " + item.replyCreateDate + "<br>마지막 수정 날짜 : " + item.replyModifyDate);
	            div.append(rWriter).append(rDate)
	            
	            // 댓글 내용
	            var rContent = $("<p>").addClass("rContent").html(item.replyContent);
	            
	            // 대댓글, 수정, 삭제 버튼 영역
	            var replyBtnArea = $("<div>").addClass("replyBtnArea");
	            
	            // 로그인 되어 있고, 대댓글이 아닐 경우 경우에 답글 버튼 추가
	            if(loginMemberId != "" && item.replyDepth != 1){
	               var childReply = $("<button>").addClass("btn btn-sm ehsheYellow ml-1 childReply").text("답글").attr("onclick", "addChildReplyArea(this, "+ item.parentReplyNo + ")");
	               replyBtnArea.append(childReply);
	            }
	            
	            // 현재 댓글의 작성자와 로그인한 멤버의 아이디가 같을 때 버튼 추가
	            if(item.memberId == loginMemberId){
	               
	               // ** 추가되는 댓글에 onclick 이벤트를 부여하여 버튼 클릭 시 수정, 삭제를 수행할 수 있는 함수를 이벤트 핸들러로 추가함. 
	               var showUpdate = $("<button>").addClass("btn ehsheYellow btn-sm ml-1").text("수정").attr("onclick", "showUpdateReply(" + item.replyNo + ", this)");
	               var deleteReply = $("<button>").addClass("btn ehsheYellow btn-sm ml-1").text("삭제").attr("onclick", "deleteReply(" + item.replyNo + ")");
	               
	               replyBtnArea.append(showUpdate, deleteReply);
	            }
	            
	            
	            // 댓글 하나로 합치기
	            li.append(div).append(rContent).append(replyBtnArea);
	            
	            // 댓글 영역을 화면에 배치
	            replyListArea.append(li);
	         });
		},
		error : function(){
			console.log("댓글 목록 조회 실패");
		}
	});
	
}

//-----------------------------------------------------------------------------------------

// 댓글 등록
$("#addReply").on("click", function(){
	
	// 로그인이 되어있는지 확인
	if(loginMemberId == ""){
		swal({icon : "info", title : "로그인 후 이용해 주세요"});
		
	}else{ // 로그인이 되어있는 경우
		
		var replyContent = $("#replyContent").val(); // 작성도니 댓글 내용을 얻어와 저장
		
		if(replyContent.trim().length == 0){ // 댓글이 작성되지 않은 경우
			swal({icon:"info", title:"댓글 작성 후 클릭해 주세요."})
			
		}else{ // 로그인 O, 댓글작성 O 인 경우
			
			$.ajax({
				url : "${contextPath}/reply/insertReply/"+ parentBoardNo,
				type : "post",
				data : {"replyWriter" : replyWriter, "replyContent" : replyContent},
				success : function(result){
					
					if(result > 0){ // 댓글 삽입 성공
						$("#replyContent").val(""); //작성한 댓글 내용을 삭제
							swal({icon:"success", title:"댓글 삽입 성공"});
							selectReplyList(); // 다시 목록 조회
					}
					
				},
				error: function(){
					console.log("댓글 삽입 실패")
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
	// el : 클릭된 수정버튼 요소 자체
	
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
	   var updateReply = $("<button>").addClass("btn ehsheYellow btn-sm ml-1 mb-4").text("댓글 수정").attr("onclick", "updateReply(" + replyNo + ", this)");
	   
	   // 취소 버튼
	   var cancelBtn = $("<button>").addClass("btn ehsheYellow btn-sm ml-1 mb-4").text("취소").attr("onclick", "updateCancel(this)");
	   
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
		swal({icon:"info", title: "댓글을 작성해주세요."})	
	}else{
		
		// queryString : 주소에 파라미터를 담아서 전달
		// -> /reply/updateReply?replyNo+100&replyContent=abc
				
		// PathVariable : 주소 경로 중 특정 부분을 값(변수)로 사용
		// -> /reply/updateReply/100
		
		// 언제 PathVariable? 언제 qeuryString?
		// PathVariable은 식별
		// queryString : 필터, 검색조건을 만들 때
		
		$.ajax({
			url : "${contextPath}/reply/updateReply/" + replyNo,
			type : "post",
			data : {"replyContent" : replyContent},
			success : function(result){
				
				if(result > 0){
					swal({icon : "success", title:"댓글 수정 성공"});
					selectReplyList();
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
	// el : 취소 버튼 자체
	// beforeReplyRow : 수정 전 댓글 내용이 있던 요소
	$(el).parent().parent().html(beforeReplyRow);
}
//-----------------------------------------------------------------------------------------

//댓글 삭제
function deleteReply(replyNo){
	
	if(confirm("정말로 삭제하시겠습니까?")){
		
		$.ajax({
			url : "${contextPath}/reply/deleteReply/" + replyNo,
			success : function(result){
				
				if(result > 0){
					swal({ icon : "success", title : "댓글 삭제 성공"});
					selectReplyList();
				}
				
			}, error : function(){
				console.log("댓글 삭제 실패");
			}
			
		});
		
	}
	
}

// ------------------------------------------------------------------------

// 답글 버튼 동작 (대댓글 작성 영역 생성)
// 1) 답글 버튼을 클릭한 댓글 밑에 생성되어야 함.
// + placeholder로 '"댓글 작성자"에게 답글 작성하기' 라는 문구 추가
function addChildReplyArea(el, parentReplyNo){
	// el : 클릭한 답글 버튼
	// parentReplyNo : 답글 버튼이 클릭된 부모 댓글 번호
	
	// 일단 생성되어 있는 모든 대댓글 작성 영역을 화면에서 제거
	var check = cancelChildReply();
	
	// 이전에 생성도니 대댓글 영역이 모두 삭제된 경우에만 새로운 대댓글 영역을 생성
	// 2) 대댓글 작성영역은 여러개가 아닌 딱 하나마나 생성되게 해야함.
	if(check){ // ture 일때 실행
	
	// 댓글 작성자 아이디 얻어오기
	var writer = $(el).parent().prev().prev().children("a").text();
	
	
	// 댓글 작성 영역에 필요한 요소 생성(textarea, button 2개) 생성
	
	var div = $("<div>").addClass("childReplyArea"); // 대댓글 작성 영영 전체를 감쌀 div
	var textarea = $("<textarea rows='3'>").addClass("childReplyContent")
									.attr("placeholder", writer + "님께 답글 작성하기");
	
	var btnArea = $("<div>").addClass("btnArea"); // 등록, 취소 버튼을 감쌀 div
	var insertBtn = $("<button>").addClass("btn btn-sm ehsheYellow ml-1").text("등록")
									.attr("onclick", "addChildReply(this, " + parentReplyNo + ")" );
	var cancelBtn = $("<button>").addClass("btn btn-sm ehsheYellow ml-1 reply-cancel").text("취소")
									.attr("onclick", "cancelChildReply()");
	
	btnArea.append(insertBtn).append(cancelBtn); // 버튼 영역에 등록, 취소 버튼  추가
	div.append(textarea).append(btnArea); // 대댓글 영역에 textarea, 버튼 영역 추가
	
	$(el).parent().after(div); // 답글 버튼 부모요소 다음 (이후)에 대댓글 영역을 추가
	
	// 추가된 대댓글 영역으로 포커스 이동
	$(".childReplyContent").focus();
	}
}

// 답글(대댓글)취소
// 내용이 작성되어 있으면 취소버튼 클릭 시 confirm창 띄우기
function cancelChildReply(){
	
	// 대댓글 영역에 작성된 내용 얻어오기
	var tmp = $(".childReplyContent").val();
	
	// 대댓글 textarea에 아무것도 작성되지 않았거나, 대댓글 textarea가 없을 경우
	// == 아무것도 작성되지 않으면 confirm창으로 확인하는 과정 없이 바로 닫히게 만듦.
	if(tmp == "" || tmp == undefined){
		// 대댓글 작성 영역 ( childReplyArea)을 모두 제거
		$(".childReplyArea").remove();
		return true;
		
	}else{ // 대댓글 textarea에 내용이 작성되어 있을 경우
		
		var cancelConfirm = confirm("작성된 댓글 내용이 사라집니다. 작성을 취소 하시겠습니까?");
		
		if(cancelConfirm){
			$(".childReplyArea").remove();
		}
		return cancelConfirm;
	}
}

// 답글(대댓글) 등록
function addChildReply(el, parentReplyNo){
	// el : 대댓글 등록 버튼
	// parentReplyNo : 대댓글이 작성된 무도 댓글 번호
	
	// 작성된 대댓글 내용 얻어오기
	var replyContent = $(el).parent().prev().val();
	
	if(replyContent.trim().length == 0){
		swal({ icon:"info" ,title : "댓글 작성 후 클릭해주세요"});
	}else{
		$.ajax({
			url : "${contextPath}/reply/insertChildReply/" + parentBoardNo,
			data : {"parentReplyNo" : parentReplyNo,
							"replyContent" : replyContent,
							"replyWriter" : replyWriter},
			type : "post",
			success : function(result){
				
				if(result > 0){
					swal({ icon : "success", title : "답글 등록 성공"});
					selectReplyList();
				}
				
			},error : function(){
				console.log("답글(대댓글) 등록 실패");
			}
		});
	}
}

</script>