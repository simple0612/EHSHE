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
    		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous">
</script>

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/5a7a3b1a34.js" crossorigin="anonymous"></script>

<title>EHSHE</title>

<style>

*{margin : 0; padding : 0; box-sizing : border-box;}

.form-wrapper{
	margin: 50px 0 120px 0;
}

.form-container {
	margin: auto;
	height: 100%;
  max-width: 400px;
}

.ehshe-text {
  font-size: 2rem; 
	font-weight:bold;
  text-align:center;
}

.ehshe-text > a, .ehshe-text > a:link{
 	text-decoration: none;
	color: #404040;
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
	color : #252525;
	margin-bottom: 0; 
}

.tos-header {
	font-size: 15px;
	float: left;
}

.all-view > a {
	float: right; 
	text-decoration: none;
	color: rgba(0,0,0,0.7);
	font-size: 14px;
}

.all-view > a:hover{
	color: #007bff;
}

.btn{
	margin-top: 0.5rem;
	font-size: 16px !important;
	font-weight: 900 !important;
	color: #191919 !important;
	background-color: #dbdbdb !important;
}]
</style>


</head>
<body>		
	<div class="form-wrapper">
		<div class="form-container">
			<div class="ehshe-text">
				<a href="${contextPath}">EHSHE</a>
			</div>

			<br>
	   
	    <div style="margin:auto; width: 100%; min-width:320px; border-top: 1px solid #e6e6e6; text-align:center;"></div>					

			<br>

			<h5>서비스 약관에 동의해주세요.</h5>
				
			<br>
			
			<%-- 이용약관 form --%>		
			<form action="signUpView">
					
				<input type="checkbox" id="checkAll">
		    <label for="checkAll" style="font-weight: bold;"><em></em>&nbsp; 모든 약관을 숙지하고 전체 동의 합니다.</label>
		    
		    <br><br>
					    
		    <div style="margin:auto; width: 100%; min-width:320px; border-top: 1px solid #e6e6e6; text-align:center;"></div>					
					
				<br>
	
				<input type="checkbox" id="check1" name="check">
		    <label for="check1" class="tos-header"><em></em> &nbsp; [필수] 이용약관</label>	
		    <div class="all-view">
		    	<a href="#">전체보기</a>
		    </div>
	 
		    <br><br>
	     
		    <textarea readonly rows="5" cols="54" style="resize:none; text-align:left;">
  제 1조 (샘플)
			    		   	
  Lorem ipsum dolor sit amet, consectetur adipisicing 
  elit, sed do eiusmod tempor incididunt ut labore et 
  dolore magna aliqua. Ut enim ad minim veniam, quis 
  nostrud exercitation ullamco laboris nisi ut aliquip 
  exea commodo consequat. Duis aute irure dolor in 
  reprehenderit in voluptate velit esse cillum dolore eu 
  fugiat nulla pariatur. Excepteur sint occaecat cupidatat 
  non proident, sunt in culpa qui officia deserunt mollit 
  anim id est laborum. </textarea>		

				<br><br>	

				<input type="checkbox" id="check2" name="check">
		    <label for="check2" class="tos-header"><em></em> &nbsp; [필수] 개인정보 수집 및 이용</label>	
		    <div class="all-view">
		    	<a href="#">전체보기</a>
		    </div>

		    <br><br>
		     
 		    <textarea readonly rows="5" cols="54" style="resize:none; text-align:left;">
  제 1조 (샘플)
			    		   	
  Lorem ipsum dolor sit amet, consectetur adipisicing 
  elit, sed do eiusmod tempor incididunt ut labore et 
  dolore magna aliqua. Ut enim ad minim veniam, quis 
  nostrud exercitation ullamco laboris nisi ut aliquip 
  exea commodo consequat. Duis aute irure dolor in 
  reprehenderit in voluptate velit esse cillum dolore eu 
  fugiat nulla pariatur. Excepteur sint occaecat cupidatat 
  non proident, sunt in culpa qui officia deserunt mollit 
  anim id est laborum. </textarea>
  
  			<br><br>		

				<input type="checkbox" id="check3" name="check">
		    <label for="check3" class="tos-header"><em></em> &nbsp; [선택] 개인정보 제 3자 제공</label>	
		    <div class="all-view">
		    	<a href="#">전체보기</a>
		    </div>
	    
	  	  <br><br>
	     
 		    <textarea readonly rows="5" cols="54" style="resize:none; text-align:left;">
  제 1조 (샘플)
			    		   	
  Lorem ipsum dolor sit amet, consectetur adipisicing 
  elit, sed do eiusmod tempor incididunt ut labore et 
  dolore magna aliqua. Ut enim ad minim veniam, quis 
  nostrud exercitation ullamco laboris nisi ut aliquip 
  exea commodo consequat. Duis aute irure dolor in 
  reprehenderit in voluptate velit esse cillum dolore eu 
  fugiat nulla pariatur. Excepteur sint occaecat cupidatat 
  non proident, sunt in culpa qui officia deserunt mollit 
  anim id est laborum. </textarea>	   		
	    				
				<br><br>
				
				<button class="btn btn-lg btn-block" onclick="location.href='${contextPath}/member/signUpView'" disabled>동의</button>
			</form>
		
		</div>
	</div>

	<%-- footer include --%>
	<jsp:include page="../common/footer.jsp" />
		
		
	<script>

	// --------------- 체크 박스 함수 ---------------
	// 전체 체크 및 해제
  $("#checkAll").on("click", function(){
    if($("#checkAll").prop("checked")){
			$("input[name=check]").prop("checked",true);
  }else{
  	$("input[name=check]").prop("checked",false);
    }
	});
    
	// 한개의 체크박스 해제시 전체 선택도 해제
 	$("input[name='check']").on("click", function(){
			$("#checkAll").prop("checked", false);						
	});

	
	// 체크에 따라 버튼 색 변경
	// 부트스트랩 사용 시, css 변경할 경우 !important가 필요해서 .css() 대신 .atrr() 사용
	$("#check1").on("change", function(){
		if($("#check1").prop("checked")){
			$(".btn").attr("style", "background-color: #F5DF4D !important;").attr("disabled", false)
				.mouseover(function(){
					$(this).attr("style", "background-color: #f0d700 !important;");	
				})		
				.mouseout(function(){
					$(this).attr("style", "background-color: #F5DF4D !important;");	
				});		
		} else {
 			$(".btn").attr("style", "background-color: #f6f6f6 !important;").attr("disabled", true)

			}
	});
	

	// 체크 여부에 따른 alert 제어	  
/* 	$(".btn").on("click", function(){
		if(!$("#check1").prop("checked")){		
			swal({icon : "warning",
			title : "서비스 약관에  동의해주세요."});
		}
	});  */
	 	
	
	</script>
		
</body>

</html>

