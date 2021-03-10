<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

   <!-- header.css -->
   <link rel="stylesheet" href="${contextPath}/resources/css/header.css">
    <!-- jquery  -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://kit.fontawesome.com/5a7a3b1a34.js" crossorigin="anonymous"></script>
   
   <!-- sweetalert : alert창을 꾸밀 수 있게 해주는 라이브러리 https://sweetalert.js.org/ -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
   <title>Header</title>
</head>


<body>
   <c:if test="${!empty swalTitle}">
      <script>
         swal({icon  : "${swalIcon}",
              title  : "${swalTitle}",
              text   : "${swalText}"});
      </script>
   </c:if>
   
   
   
       <div class="btn_area">
        <span class="fas fa-bars"></span>
       </div>
 
    <header>
        <nav>
            <div class="logo_area">
                <a href="${contextPath}">
                    <img id="logo_img" src="${contextPath}/resources/images/ehshe_final_logo.png">
                </a>
            </div>



            <ul class="menu_area">
                <li><a href="${contextPath}/place/placeMain">데이트</a></li>
                
                <li id="shop_category"><a href="${contextPath}/shop/shopMain">SHOP</a>
                    
                    <ul class=plus_menu_area>
                        <li><a href="${contextPath}/shop/shopList/1">Clothes</a></li>
                        <li><a href="${contextPath}/shop/shopList/2">Accessory</a></li>
                        <li><a href="${contextPath}/shop/shopList/3">Etc</a></li>
                    </ul>
                    
                </li>
                
                <li><a href="${contextPath}/board/boardList">커뮤니티</a></li>
            </ul>

            <div class="login_area">
                    <c:choose>
                   <c:when test="${empty sessionScope.loginMember}">                
                      <span><a href="${contextPath}/member/loginView">로그인</a></span>
                   </c:when>            
                                  
                   <c:otherwise>
                 
                 <c:if test="${loginMember.memberGrade eq 'A'}">
                     <span><a href="${contextPath}/page/adminpage">${loginMember.memberNm}</a></span>
                     <!-- 아이디출력 -->
                  </c:if>
                  <c:if test="${loginMember.memberGrade eq 'G'}">
                     <span><a href="${contextPath}/page/mypagemain">${loginMember.memberNm}</a></span>
                     <!-- 아이디출력 -->
                  </c:if>
                 
                 
                    
                      <!-- <span><a href="javascript:gLogout()">로그아웃</a></span>   -->
                      <%-- <span><a href="${contextPath}/member/logout">로그아웃</a></span> --%>
                      <span><a href="#" id="logout">로그아웃</a></span>
                     <span><a href="${contextPath}/shop2/cart"><img src="${contextPath}/resources/images/shoppingCart.png"></a></span>
                           </c:otherwise>
              </c:choose>
            </div>
        </nav>
    </header>

    <div class="side_menu">
        <div class="sidebar">
            <ul class="side1">
                <a href="${contextPath}">EHSHE</a>

                <li><a href="${contextPath}/place/placeMain">데이트</a></li>

                <li class="popup"><a href="${contextPath}/shop/shopMain">SHOP<i class="fas fa-caret-down"></i></a>
                    <ul>
                        <li><a href="${contextPath}/shop/shopList/1">Clothes</a></li>
                        <li><a href="${contextPath}/shop/shopList/2">Accessory</a></li>
                        <li><a href="${contextPath}/shop/shopList/3">etc</a></li>
                    </ul>
                </li>
                <li><a href="${contextPath}/board/boardList">커뮤니티</a></li>
            </ul>
                        
            <ul class="side2">
               <c:choose>                        
                  <c:when test="${empty sessionScope.loginMember}">                
                  <li><a href="${contextPath}/member/loginView">로그인</a></li>
               </c:when>                     
                
               <c:otherwise>
             
             <c:if test="${loginMember.memberGrade eq 'A'}">
                  
                        <li><a href="${contextPath}/page/adminpage">${loginMember.memberNm}</a></li> <!-- 아이디출력 -->
                     <!-- 아이디출력 -->
                  </c:if>
                  <c:if test="${loginMember.memberGrade ne  'A'}">
                     
                        <li><a href="${contextPath}/page/mypagemain">${loginMember.memberNm}</a></li> <!-- 아이디출력 -->
                     <!-- 아이디출력 -->
                  </c:if>
             
            
                <%-- <li><a href="${contextPath}/member/logout">로그아웃</a></li> --%>
                <li><a href="#" id="logout1">로그아웃</a></li>
                <li><a href="${contextPath}/shop2/cart"><img src="${contextPath}/resources/images/shoppingCart.png"></a></li>
                     </c:otherwise>
                  </c:choose>
           </ul>
        </div>
    </div>
    
   <%-- 카카오 로그인 JS --%>
   <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

   <%-- 구글 로그인 JS --%>
   <script src="${contextPath}/resources/js/googleLogin.js"></script>

   <%-- 구글 로그아웃 팝업창 숨김 (임시대처용..) --%>   
  <iframe width=0 height=0 name="hiddenframe" style="display:none;"></iframe>
 
  <script>
        /* 사이드바 토글  */
      $('.btn_area').click(function(){
          $(this).toggleClass("click");
          $('.sidebar').toggleClass("show");
      });
           
      /* 사이드바 shop메뉴 슬라이드 다운 업 */
      $('.popup').mouseenter(function(){

          $(this).children('ul').stop().slideDown();

      });
      $('.popup').mouseleave(function(){

          $(this).children('ul').stop().slideUp();

      });
  
      /* 구글 로그아웃  */
      var popup;
      $("#logout, #logout1").on("click",function(){
         popup = window.open("https://accounts.google.com/logout", "hiddenframe", "resiable=no, width=1, height=1, left=-500, top:-500");
         window.setTimeout(function(){
            popup.close();
          location.href = "${contextPath}/member/logout"; 
         }, 500) 
      }) 
  </script>    
</body>
</html>