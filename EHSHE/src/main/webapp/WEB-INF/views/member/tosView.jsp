<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jquery  -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- bootStrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
    		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/5a7a3b1a34.js" crossorigin="anonymous"></script>

<title>EHSHE</title>

<style>

*{margin : 0; padding : 0; box-sizing : border-box;}

.form-wrapper{
	margin: 50px 0 120px 0;
}

.title {
  font-size: 2rem; 
	font-weight: bold;
  text-align: center;
}

.title > a {
 	text-decoration: none;
	color: #404040;
} 

.hr {
	margin: auto; 
	width: 40%; 
	min-width: 350px; 
	text-align: center;
	border-top: 1px solid #e6e6e6; 
}

.tos-header {
	margin: auto;
	max-width: 385px;
	font-size: 18px;
	font-weight: normal;
	color : #909090; 
}

.form-container {
	height: 100%;
	margin: auto;
  max-width: 385px;
}


/* 체크박스 css */
input[id="checkAll"], input[name="check"] {
	display:none;
}

input[id="checkAll"] + label em, input[name="check"] + label em { /* 인접요소 선택자 */
    display : inline-block;
    width:16px;
    height:16px;
    margin:0 5px 3px 0;
    background: url(${contextPath}/resources/images/checkOut.png) 0 0 no-repeat;
    vertical-align: middle;
}

input[id="checkAll"]:checked + label em, input[name="check"]:checked + label em {
    background: url(${contextPath}/resources/images/check.png) 0 0 no-repeat;
}

label{
	font-size: 15px;
	color : #404040;
}

.text-tos {
	font-size: 15px;
	float: left;
}

.text-tos:hover, .text-tos-all:hover {
	cursor:pointer;
}

.view-all > a {
	float: right; 
	text-decoration: none;
	color: rgba(0,0,0,0.7);
	font-size: 14px;
}

.view-all > a:hover{
	color: #007bff;
}

.textarea-tos {
	resize: none; 
	text-align: left;
}

.btn{
	margin-top: 0.7rem;
	font-size: 15px !important;
	font-weight: 600 !important;
	color: #191919 !important;
	background-color: #f6f6f6 !important;
 	border-radius: 1rem !important;
	height: 2.6rem !important;
}

.btn:hover {
	background-color: #dbdbdb !important;
}

/* .modal-header{
	border-bottom: none;
} */

.modal-content{
	padding: 1.5rem 3rem 3rem 3rem;
	}

/* .modal-footer{
	border-top: none;
	}  */
 
</style>

</head>
<body>		
	<div class="form-wrapper">
		<div class="title">
			<a href="${contextPath}">EHSHE</a>
		</div>

		<br>  
    <div class="hr"></div>
		
		<br>
		<div class="tos-header">
			<span>EHSHE 계정 <br> 서비스 약관에 동의해 주세요.</span>
			
			<br><br>
			<input type="checkbox" id="checkAll">
			<label for="checkAll" class="text-tos-all" style="font-weight: bold;"><em></em>&nbsp; 모든 약관을 숙지하고 전체 동의 합니다.</label>
		</div>
		
	  <br>		    
		<div class="hr"></div>	
		
		<br>
		<div class="form-container">
		<%-- 이용약관 form --%>		
			<form action="signUpView">
				<input type="checkbox" id="check1" name="check" required>
				<label for="check1" class="text-tos"><em></em> &nbsp; [필수] 이용약관</label>	
				<div class=view-all>
			  	<a data-toggle="modal" href="#modal-container-1">전체보기</a>
		   	</div>
			
		  	<br><br>		   
			  <textarea readonly rows="6" cols="52" class="textarea-tos">
 제 1조 (샘플)
			    		   	
  Lorem ipsum dolor sit amet, consectetur
  adipisicing elit, sed do eiusmod tempor
  incididunt ut labore et dolore magna aliqua.
  Ut enim ad minim veniam, quis nostrud
  exercitation ullamco laboris nisi ut aliquip
  exea commodo consequat. Duis aute irure 
  dolor in reprehenderit in voluptate velit 
  esse cillum dolore eu fugiat nulla pariatur. 
  Excepteur sint occaecat cupidatat non 
  proident,sunt in culpa qui officia deserunt
  mollit anim id est laborum. </textarea>		

				<br><br>		
				<input type="checkbox" id="check2" name="check" required>
		    <label for="check2" class="text-tos"><em></em> &nbsp; [필수] 개인정보 수집 및 이용</label>	
		    <div class="view-all">
		    	<a class="modalOpacity" data-toggle="modal" href="#modal-container-1">전체보기</a>
		    </div>
		
		    <br><br>		     
		    <textarea readonly rows="6" cols="52" class="textarea-tos">
  제 1조 (샘플)
			    		   	
  Lorem ipsum dolor sit amet, consectetur
  adipisicing elit, sed do eiusmod tempor
  incididunt ut labore et dolore magna aliqua.
  Ut enim ad minim veniam, quis nostrud
  exercitation ullamco laboris nisi ut aliquip
  exea commodo consequat. Duis aute irure 
  dolor in reprehenderit in voluptate velit 
  esse cillum dolore eu fugiat nulla pariatur. 
  Excepteur sint occaecat cupidatat non 
  proident,sunt in culpa qui officia deserunt
  mollit anim id est laborum. </textarea>
  
	 			<br><br>			
				<input type="checkbox" id="check3" name="check">
		    <label for="check3" class="text-tos"><em></em> &nbsp; [선택] 개인정보 제 3자 제공</label>	
		    <div class="view-all">
		    	<a class="modalOpacity" data-toggle="modal" href="#modal-container-1">전체보기</a>
		    </div>
	    
	  	  <br><br>     
		    <textarea readonly rows="6" cols="52" class="textarea-tos">
  제 1조 (샘플)
			    		   	
  Lorem ipsum dolor sit amet, consectetur
  adipisicing elit, sed do eiusmod tempor
  incididunt ut labore et dolore magna aliqua.
  Ut enim ad minim veniam, quis nostrud
  exercitation ullamco laboris nisi ut aliquip
  exea commodo consequat. Duis aute irure 
  dolor in reprehenderit in voluptate velit 
  esse cillum dolore eu fugiat nulla pariatur. 
  Excepteur sint occaecat cupidatat non 
  proident,sunt in culpa qui officia deserunt
  mollit anim id est laborum. </textarea>	   		
		    				
				<br><br>
				<button type="submit" class="btn btn-lg btn-block">동의</button>
			</form>
		</div>
	</div>
	
	<%-- 전체보기 모달창 --%>
	<div class="modal fade" id="modal-container-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
					</button>
				</div>

				<div class="modal-body">
					<p>
						 제 1조 (샘플)
				    <br><br>		   	
					  Lorem ipsum dolor sit amet, consectetur
					  adipisicing elit, sed do eiusmod tempor
					  incididunt ut labore et dolore magna aliqua.
					  Ut enim ad minim veniam, quis nostrud
					  exercitation ullamco laboris nisi ut aliquip
					  exea commodo consequat. Duis aute irure 
					  dolor in reprehenderit in voluptate velit 
					  esse cillum dolore eu fugiat nulla pariatur. 
					  Excepteur sint occaecat cupidatat non 
					  proident,sunt in culpa qui officia deserunt
					  mollit anim id est laborum.
					</p>
				</div>
				<div class="modal-footer">
				</div>
			</div>
		</div>
	</div>

	<%-- footer include --%>
	<jsp:include page="../common/footer.jsp" />
		
			
	<script>

	// --------------- 체크 박스 함수 ---------------
	// 전체 체크 및 해제, 버튼 활성화
  $("#checkAll").on("click", function(){
    if($("#checkAll").prop("checked")){
			$("input[name=check]").prop("checked",true);
			$(".btn").attr("style", "background-color: #F5DF4D !important;")
			.mouseover(function(){
				$(this).attr("style", "background-color: #f0d700 !important;");	
			})		
			.mouseout(function(){
				$(this).attr("style", "background-color: #F5DF4D !important;");	
			});		 
  }else{
  	$("input[name=check]").prop("checked",false);
		$(".btn").attr("style", "background-color: #f6f6f6  !important;")
		.mouseover(function(){
			$(this).attr("style", "background-color: #dbdbdb !important;");	
		})		
		.mouseout(function(){
			$(this).attr("style", "background-color: #f6f6f6 !important;");	
		});	
   }
	});
    
	// 한개의 체크박스 해제시 전체 선택도 해제
 	$("input[name='check']").on("click", function(){
			$("#checkAll").prop("checked", false);						
	});
	
	// 체크에 따라 버튼 색 변경
	// 부트스트랩 사용 시, css 변경할 경우 !important가 필요
	// -> .css() 메서드는 !important 안되므로  .atrr() 사용
	$("#check1, #check2").on("change", function(){
		if($('#check1').prop('checked') && $('#check2').prop('checked')){	
			$(".btn").attr("style", "background-color: #F5DF4D !important;")
			.mouseover(function(){
				$(this).attr("style", "background-color: #f0d700 !important;");	
			})		
			.mouseout(function(){
				$(this).attr("style", "background-color: #F5DF4D !important;");	
			});	
		} else {
			$(".btn").attr("style", "background-color: #f6f6f6  !important;")
			.mouseover(function(){
				$(this).attr("style", "background-color: #dbdbdb !important;");	
			})		
			.mouseout(function(){
				$(this).attr("style", "background-color: #f6f6f6 !important;");	
			});								
		}
 	}); // 체크박스 함수 end
	
	</script>		
</body>
</html>

