<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextPath"
	value="${pageContext.servletContext.contextPath}" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>나만의 장소</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="${contextPath}/resources/css/board/boardList.css">


</head> 

<body>
	<jsp:include page="../common/header.jsp" />

	<div class="container-fluid boardMain">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-12">
						<h1 class="myPlace-header">내 댓글<br><br><br>
						
						<div>

							<a href="${contextPath}/page/mypagemain"> <img
								src="${contextPath}/resources/images/asd123.png"
								style="width: 100px; height: 100px; margin-bottom: 5px"></a>
						</div>
						
						</h1>

					</div>
				</div>
				
				
				
				<div class="container board-list">
			<!-- 게시글  얻어오기 -->
		
			<div>
				<table class="table table-hover table-striped" id="list-table">
					
						<tr>

							<th><input type="checkbox" id="checkall"></th>
							<th>게시글 번호</th>
							<th>제목</th>
							<th>카테고리이름</th>
							<th>작성일</th>

						</tr>
				
	
						<c:if test="${empty bList}">
							<tr>
								<td colspan="4">존재하는 게시글이 없습니다.</td>
							</tr>
						</c:if>

						<c:if test="${!empty bList}">
							<c:forEach var="board" items="${bList}" varStatus="vs">

								<tr class="cklist">
									<td><input type="checkbox" name="chk"></td>
									
									
									<td>${board.boardNo}</td>
									<td>${board.boardTitle}</td>
									<td>${board.memberNo}</td>
									
									<td>
										<%-- 날짜 출력 모양 지정 --%> <fmt:formatDate var="createDate"
											value="${board.boardCreateDate }" pattern="yyyy-MM-dd" /> <fmt:formatDate
											var="now" value="<%=new java.util.Date()%>"
											pattern="yyyy-MM-dd" /> <c:choose>
											<c:when test="${createDate != now}">
											${createDate }
										</c:when>
											<c:otherwise>
												<fmt:formatDate value="${board.boardCreateDate }"
													pattern="HH:mm" />
											</c:otherwise>
										</c:choose>
									</td>

								</tr>
							</c:forEach>
						</c:if>






		



				</table>
			</div>

			<hr>

		
			</tbody>
			</table>
		</div>






				<div class="row">
					<div class="col-md-12 insert-btn">
						<c:if test="${!empty loginMember }">
							<a class="btn ehsheYellow float-right writeBtn" 
								href="#">삭제하기</a>
									<button id="deleteBtn" class="btn ehsheYellow">1삭1제1</button>
								
						</c:if>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="pagination-area">
							<ul class="pagination">
								<%-- 주소 조합 작업 --%>
								<c:url var="pageUrl" value="?"/>
	
								<!-- 화살표에 들어갈 주소를 변수로 생성 -->
								<c:set var="firstPage" value="${pageUrl}cp=1" />
								<c:set var="lastPage" value="${pageUrl}cp=${pInfo.maxPage}" />

								<fmt:parseNumber var="c1"
									value="${(pInfo.currentPage - 1) / 10 }" integerOnly="true" />
								<fmt:parseNumber var="prev" value="${ c1 * 10 }"
									integerOnly="true" />
								<c:set var="prevPage" value="${pageUrl}cp=${prev}" />

								<fmt:parseNumber var="c2"
									value="${(pInfo.currentPage + 9) / 10 }" integerOnly="true" />
								<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }"
									integerOnly="true" />
								<c:set var="nextPage" value="${pageUrl}cp=${next}" />

								<c:if test="${pInfo.currentPage > pInfo.pageSize}">
									<li><a class="page-link" href="${firstPage}">&lt;&lt;</a></li>

									<li><a class="page-link" href="${prevPage}">&lt;</a></li>
								</c:if>

								<!-- 페이지 목록 -->
								<c:forEach var="page" begin="${pInfo.startPage}"
									end="${pInfo.endPage}">
									<c:choose>
										<c:when test="${pInfo.currentPage == page }">
											<li><a class="page-link">${page}</a></li>
										</c:when>

										<c:otherwise>
											<li><a class="page-link" href="${pageUrl}cp=${page}">${page}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:if test="${next <= pInfo.maxPage}">
									<li><a class="page-link" href="${nextPage }">&gt;</a></li>

									<li><a class="page-link" href="${lastPage }">&gt;&gt;</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
				
					<div class="col-md-2"></div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />

	<c:set var="returnListURL" 
					value="${contextPath}/board/boardlist/${pageUrl}cp=${pInfo.currentPage}"
					scope="session"/>

	<script>
		// 게시글 상세보기 기능 (jquery를 통해 작업)
		$(".cklist").on("click", function() {
			var boardNo = $(this).children().eq(1).text();
	
			var boardViewURL = "${contextPath}/board/" + boardNo;
			
			// var boardViewURL = "../" + boardNo;

			location.href = boardViewURL;
		});
		

		//체크박스 선택시 전체 선택
		$(document).ready(function(){
		    //최상단 체크박스 클릭
		    $("#checkall").click(function(){
		        //클릭되었으면
		        if($("#checkall").prop("checked")){
		            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
		            $("input[name=chk]").prop("checked",true);
		            //클릭이 안되있으면
		        }else{
		            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
		            $("input[name=chk]").prop("checked",false);
		        }
		    })
		})

	// 게시글 삭제
	$("#deleteBtn").on("click", function(){
		if( $("input[name=chk]").prop("checked",true)){
			if(confirm("게시글을 삭제하시겠습니까?")){
				
				var boardNo = $(this).children().eq(0).text();
				
				location.href = "deleteAction/" + boardNo;
		
		}
				}
	});
	</script>




</body>
</html>