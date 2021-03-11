<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>html문서 제목</title>

  <!-- 부트스트랩을 사용을 위한 css 추가 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
    <!-- 부트스트랩 사용을 위한 라이브러리 추가 -->
    <!-- jquery가 항상 먼저여야된다! -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

 <!--    <!-- include libraries(jQuery, bootstrap) -->
<!--   <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>  -->

 
 <style>
  /*    div{
            border: 1px solid black;
        }   */ 
.a{
margin: 0px auto;
}
.ShopUpdateImg{
    width: 100%;
    height: 100%;
}
.b{
    height: 200px;
    width: 200px;
    margin: 0px auto;
}
.q{
    width: 1280px;
}
.btnColor{
  background-color: #F5dF4D;
  color:white;
}
.btnColor2{
  background-color: #939597;
  color: white;
}
header{
position:relative !important;
}
.options{
border:none;
outline:none;
}
.optionDelete{
cursor:pointer;
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
<link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">

</head>
<body>
   <jsp:include page="../common/header.jsp"/>
   
	<!-- summernote 사용 시 필요한 js 파일 추가 -->
	<script src="${contextPath}/resources/summernote/js/summernote-lite.js"></script>
	<script src="${contextPath}/resources/summernote/js/summernote-ko-KR.js"></script>
	<script src="${contextPath}/resources/summernote/js/shopSummernote.js"></script>
	
    
    <div class="container" style="margin-top: 110px;">
      <h1>Shop Update</h1>
        <form action="shopUpdateAction" method="post" enctype="multipart/form-data" role="form" style="margin-bottom:200px;">
        <div class="row">
            		<div class="col-md-6">
               	<c:if test="${!empty shopAttachmnet}"> 
	                <div class="mb-4 a boardImg" style="height:400px;">
	 										<img src="${contextPath}${shopAttachmnet.filePath}/${shopAttachmnet.fileName}" class="rounded mx-auto d-block ShopUpdateImg">               
	                </div>
                </c:if>
            		</div>
                
                <div id="fileArea" style="display:none;">
				          	<input type="file" id="img0" name="images" onchange="LoadImg(this,0)"> 
                </div> 
               
                  <div class="col-md-6"> 

                    <div class="form-group mb-7">
                      <label for="productname">상품명</label>
                      <input class="form-control" id=" productname" type="text" name="itemNm" required value="${shop.itemNm}">
                    </div>
                   
                    <div class="form-group">
                    <label for="productCategory">카테고리</label>
                    <select class="form-control" id="productCategory" name="itemCategory">
                        <option selected>카테고리를선택하시오.</option>
                        <option value="1">Clothes</option>
                        <option value="2">Accessory</option>
                        <option value="3">Etc</option>
                    </select>
                   
                  </div>
                    <div class="form-group">
                          <label for="inputprice">가격</label>
                          <input class="form-control" id="inputprice" type="number" name="itemPrice" required value="${shop.itemPrice}">
                    </div>
                    <div class="form-group">
                      <label for=" deliverycharge">배송비</label>
                      <input class="form-control" id=" deliverycharge" type="number" name="transCharge" required value="${shop.transCharge}">
                    </div>

    
                   </div> 
                </div>
          
              <!-- <div class="col-md-6">
                <div class=""  id="wrapper3">
                  <label for="inputsize">size</label>
                  <input class="" id="inputsize" name="sizemenu" style="width: 200px;">
                  <button type="button" class="btn btnColor" id="add">추가</button>
               </div>
              </div>
				
             
              <div class="col-md-6">
                <div class=""  id="wrapper4">
                  <label for="inputcolor">color</label>
                  <input class="" id="inputcolor" name="colormenu" style="width: 200px;">
                  <button type="button" class="btn btnColor" id="add2">추가</button>
               </div>
              </div> -->
          
          
           
           
           
            <div class="row">            
                <div class="col-md-12" >
                    <label for="size" class="">사이즈</label>
                     <input type="text" class="form-control" id="size" placeholder="예시 : X,M,L ( ,로 구분)">
                </div>
                <div class="col-md-12" >
                    <label for="color" class="">색상</label>
                    <input type="text" class="form-control" id="color" placeholder="예시 : RED,BLUE,GRAY ( ,로 구분)">
                </div>
            </div>

            <div class="row" style="margin-top: 20px;">
               <div class="col-md-6" style="font-size:small ; font-weight:bolder  ;color:gray;">
								  * 상위목록부터 옵션이 노출됩니다.
							</div>
              
               <div class="col-md-12">
             		 <input type="button"class="btn btnColor2" id="optionBtn" value="옵션목록으로적용▼">
              </div>
            </div>

            <div class="row" style="margin-top: 20px;">
                <div class="col-md-12" >
                    <button type="button" class="btn btnColor2" id="selectDelete">선택삭제</button>
                <table class="table table-bordered" id="allTable" style="margin-top: 5px;">
                    <thead>
                      <tr>
                        <th scope="col"><input type="checkbox"  class="optionDelete"  id="optionCheckAll"></th>
                        <th scope="col">옵션목록</th>
                        <th scope="col" >삭제</th>
                      </tr>
                    </thead>
                    <tbody id="tbodyWrapper">
					             <c:forEach items="${option}" var="opt" varStatus="status">
<%-- 						           	 	<c:set var="start" value='${fn:indexOf(opt.optionSpecifyContent, "(" ) }'/>
						            	<c:set var="size" value="${fn:substring(opt.optionSpecifyContent, 0, start )}"/> 
						           	 	<c:set var="end" value='${fn:indexOf(opt.optionSpecifyContent, ")" ) }'/>
						            	<c:set var="color" value="${fn:substring(opt.optionSpecifyContent, start+1, end)}"/>  --%>
           
									       <c:if test="${opt.optionSpecifyContent ne '품절'}">
			                  <tr>
					       					<th scope='row'><input type='checkbox'class="optionDelete" name='optionCheckBox'style='text-align:center;'></th>
									        <td><input type="text" name="optionDetail" class="options" readonly value="${opt.optionSpecifyContent}"></td>
									        <td><div id="deleteBtn"   class="optionDelete" style="margin-left:10px;"><i class="fas fa-times"></i></div></td>
				        		  	</tr>
									       </c:if>
          					 </c:forEach> 
                    </tbody>
                  </table>
                  </div>
            </div>
            
            

            <br>
        <br>
        <div class="row">
          <div class="col-md-12">
              <h1>Product Content Update</h1>
              <div>
               <textarea id="summernote"name="itemContent" required>${shop.itemContent}</textarea>
              </div>
            </div>
        </div>
        <div class="float-right">
            <button class="btn btnColor btn" type="submit">수정</button>
            <a class="btn btnColor2 btn" href="${header.referer}">취소</a>
        </div>
       </form>
    </div>
  <jsp:include page="../common/footer.jsp"/>		
</body>

<script>


$(document).ready(function() {
	
	// 카테고리 선택
	$.each($("#productCategory > option"), function(index, item){
		if($(item).text() == "${shop.itemCategoryNm}"){
			$(item).prop("selected", "true");
		}
	});

	   
		
	 $("#optionBtn").on("click",function(){

	      var size =$("#size").val(); // 사이즈값 가져오기
	      var color =$("#color").val(); // 색상 값 가져오기
	      
	      var sizeSplit =[];  // size 배열에 담기
	      var colorSplit =[];  // color 배열에 담기

	      
	      var optionDetail =[];  // size 배열에 담기

	      
	      var temp =""; // 동적테이블 담을 변수
	      
	      if(!size && !color){

	          alert("size 혹은 color를 입력해주세요.");

	      }else{


	      // 사이즈,컬러 구분자로 쪼개기
	      sizeSplit = size.split(',');
	      console.log(sizeSplit);
	      colorSplit = color.split(',');
	      console.log(colorSplit);

	/*       // 사이즈,컬러 각각의 맞게 분배
	      for (var i=0; i<sizeSplit.length; i++) {

	          for(var j=0; j<colorSplit.length; j++){

	        	  $("#tbodyWrapper").empty();

	          temp +='<tr>';
	          temp +="<th scope='row'>"+ "<input type='checkbox' name='optionCheckBox'></th>";
	          temp +='<td>'+'<input type="text" name="sizeMenu" class="options" readonly value="'+ sizeSplit[i] +'"></td>';
	          temp +='<td>'+'<input type="text" name="colorMenu" class="options" readonly value="'+ colorSplit[j] +'"></td>';
	          temp +='<td>' +'<div id="deleteBtn" style="margin-left:10px;"><i class="fas fa-times"></i></div>'+ '</td>';
	          temp +='</tr>';

	          $("#tbodyWrapper").append(temp);

	          }
	          
	      }  */
	      
	      for (var i=0; i<sizeSplit.length; i++) {
	          
	    	  	for(var j=0; j<colorSplit.length; j++){
						   	
	    	  		if(sizeSplit[0] ==""){
	    	  			optionDetail = colorSplit[j];
	    	  			
	    	  			  $("#tbodyWrapper").empty();

	                  temp +='<tr>';
	                  temp +="<th scope='row'>"+ "<input type='checkbox'  class='optionDelete' name='optionCheckBox'></th>";
	                  temp +='<td>'+'<input type="text" name="optionDetail" class="options" readonly value="'+ optionDetail+'"></td>';
	                  temp +='<td>' +'<div id="deleteBtn" class="optionDelete" style="margin-left:10px;"><i class="fas fa-times"></i></div>'+ '</td>';
	                  temp +='</tr>';

	                  $("#tbodyWrapper").append(temp);
	    	  			
	    	  			
	    	  			
	    	  		}else if(colorSplit[0] ==""){
	    	  			optionDetail = sizeSplit[i];
	    	  			
	    	  			$("#tbodyWrapper").empty();
	                    temp +='<tr>';
	                    temp +="<th scope='row'>"+ "<input type='checkbox' class='optionDelete' name='optionCheckBox'></th>";
	                    temp +='<td>'+'<input type="text" name="optionDetail" class="options" readonly value="'+ optionDetail+'"></td>';
	                    temp +='<td>' +'<div id="deleteBtn" class="optionDelete" style="margin-left:10px;"><i class="fas fa-times"></i></div>'+ '</td>';
	                    temp +='</tr>';
	                    $("#tbodyWrapper").append(temp);
	    	  		
	    	  		}else{
	        	    optionDetail = sizeSplit[i] +"("+colorSplit[j]+")";
	           	  $("#tbodyWrapper").empty();

	              temp +='<tr>';
	              temp +="<th scope='row'>"+ "<input type='checkbox' class='optionDelete' name='optionCheckBox'></th>";
	              temp +='<td>'+'<input type="text" name="optionDetail" class="options" readonly value="'+ optionDetail+'"></td>';
	              temp +='<td>' +'<div id="deleteBtn"  class="optionDelete" style="margin-left:10px;"><i class="fas fa-times"></i></div>'+ '</td>';
	              temp +='</tr>';

	              $("#tbodyWrapper").append(temp);
	        	  
	    	  		}
	    	  }
	      }
	      }
	  });

	// 단일 tr 삭제
	$(document).on("click", "#deleteBtn", function(){
	    $(this).parent().parent().remove();
	 
	});

	// 체크박스된 tr만 삭제
	$("#selectDelete").on("click",function(){

	    var checkbox =$("input[name=optionCheckBox]:checked");
	    console.log(checkbox);

	        checkbox.each(function(i){
	    
	        var tr= checkbox.parent().parent();
	        
	        tr.remove();
	        

	     });

	     if($("td:empty")){
	         $("#optionCheckAll").prop("checked",false);
	       }  
	    });
	    


	    // 체크박스 전체해제 전체클릭
	    $("#optionCheckAll").click(function(){
	   
	    if($("#optionCheckAll").prop("checked")){
	      
	        $("input[name=optionCheckBox]").prop("checked",true);
	    }else{
	        $("input[name=optionCheckBox]").prop("checked",false);
	    }

	    });

	//체크박스 하나 해제시 전체체크박스 해제
	$(document).on("click", "input[name=optionCheckBox]", function(){

	var checkbox =$("input[name=optionCheckBox]:checked");

	if($("input[name=optionCheckBox]").length==checkbox.length){ 
	  
	    $("#optionCheckAll").prop("checked",true); 
	}else{ 
	   $('#optionCheckAll').prop("checked",false); 
	} 

	});




	});









      // 추가 버튼 클릭 시
/*   document.getElementById("add").onclick = function(){

        // 1) div 태그 생성
       // var div =document.getElementById("wrapper3");
        var div = document.createElement("div");
        div.setAttribute("style","margin-top:5px;");
        div.setAttribute("class","form-inline");



        var input = document.createElement("input");
        input.setAttribute("type","text"); 
        input.setAttribute("class","");
        input.setAttribute("name","sizemenu"); 


        div.appendChild(input); 
       
       
        var button = document.createElement("button"); 
        button.setAttribute("type","button");
        button.setAttribute("class","btn btnColor2 float-right"); 
        button.setAttribute("onclick","deleteRow(this);"); 
        button.setAttribute("style","margin-left: 5px;");
        button.innerHTML="삭제"; 
        
        div.appendChild(button);

       document.getElementById("wrapper3").appendChild(div);
      
      };

        // 삭제
        function deleteRow(el){
            // el에는 클릭된 버튼(this)이 담겨있음.

            // 클릭된 버튼의 부모 요소(부모 노드)를 선택해서 제거 == 한줄제거
            el.parentNode.remove();
        }


        document.getElementById("add2").onclick = function(){

        // 1) div 태그 생성
   //     var div =document.getElementById("wrapper4");
        var div = document.createElement("div");
        div.setAttribute("style","margin-top:10px;");
        div.setAttribute("class","form-inline");
        div.setAttribute("style"," white-space: nowrap;");



        var input = document.createElement("input");
        input.setAttribute("type","text"); 
        input.setAttribute("class",""); 
        input.setAttribute("name","colormenu"); 
        div.appendChild(input); 


        var button = document.createElement("button"); 
        button.setAttribute("type","button");
        button.setAttribute("class","btn btnColor2 float-right"); 
        button.setAttribute("onclick","deleteRow(this);"); 
        button.setAttribute("style","margin-left: 5px;");
        button.innerHTML="삭제"; 

        div.appendChild(button);

        document.getElementById("wrapper4").appendChild(div);

        
        }; */



	// 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
    $(function(){
		//	$("#fileArea").hide(); // #fileArea 요소를 숨김.		
			
			$(".boardImg").on("click", function(){ // 이미지 영역이 클릭 되었을 때
				
				// 클릭한 이미지 영역 인덱스 얻어오기
				var index = $(".boardImg").index(this);
						// -> 클릭된 요소가 .boardImg 중 몇번째 인덱스인지 반환
						
				//console.log(index);
				
				// 클릭된 영역 인덱스에 맞는 input file 태그 클릭
				$("#img" + index).click();
			});
			
		});
		 
		
		
	  // 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
	  function LoadImg(value, num) {
		  // value.files : 파일이 업로드되어 있으면 true
		  // value.files[0] : 여러 파일 중 첫번째 파일이 업로드 되어 있으면 true
		  
			if(value.files && value.files[0]){ // 해당 요소에 업로드된 파일이 있을 경우
				
				var reader = new FileReader();
       	// 자바스크립트 FileReader
      	// 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 
      	// 읽을 파일을 가리키는 File 혹은 Blob객체를 이용해 
      	// 파일의 내용을 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 해주는 객체
      	
      	reader.readAsDataURL(value.files[0]);
        // FileReader.readAsDataURL()
      	// 지정된의 내용을 읽기 시작합니다. 
      	// Blob완료되면 result속성 data:에 파일 데이터를 나타내는 URL이 포함 됩니다.	
      	
      	reader.onload = function(e){
        	// FileReader.onload
					// load 이벤트의 핸들러. 
					// 이 이벤트는 읽기 동작이 성공적으로 완료 되었을 때마다 발생합니다.	
      		
					// 읽어들인 내용(이미지 파일)을 화면에 출력
					
					$(".boardImg").eq(num).children("img").attr("src", e.target.result);
					// e.target.result : 파일 읽기 동작을 성공한 요소가 읽어들인 파일 내용
					
      	}
			}
		}

</script>
</html>
