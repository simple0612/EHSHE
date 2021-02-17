<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style>

*{margin: 0;padding: 0;box-sizing:border-box}

body .col-md-6  {
    font-family: 'Note Sans KR',sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  
}



.login-form h1{
    font-size: 32px; color:#999;
    text-align:center;
}
.int-area{
    width: 400px; position: relative;

}
.int-area input{
    width:100%;
    padding: 20px 10px 10px;
    background-color: transparent;
    border:none;
    border-bottom: 1px solid #999;
    font-size: 18px;color: #fff;
   outline: none;
}
.int-area label{
    position: absolute; left: 10px; top:15px;
    font-size: 18px; columns: #999;

}
.int-area input:focus + label,
.int-area input:valid + label{
top: 0;
font-size: 13px;color: #166cea;
}


button{
    width: 400px;
    height: 40px;
    background-color: yellow;
}
    
</style>


</head>
<body>


	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 ">

				<jsp:include page="../common/header.jsp" />
			</div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">



						<section class="login-form">
                         
                            <h1>로그인을 시작합니다</h1>
                            <br>
                            <h1>회원 로그인</h1>
                           
							<form action="">
								<div class="int-area">
									<input type="text" name="id" id="id" autocomplete="off"
										required> 
                                        <label for="id"> ID 입력하세요</label>
								</div>

								<div class="int-area">
									<input type="password" name="pw" id="pw" autocomplete="off"
										required> 
                                        <label for="id">pass 입력하세요</label>
								</div>
                            <br> <input type="checkbox"> 아이디 저장
								<div class="btn-area">
									<button type="submit">login</button>
								</div>

                                    <ul>
                                        <a href="#">아이디 찾기</a>
                                        <a href="#">비밀번호 찾기</a>
                                        <a href="#">회원가입</a>
                                    </ul>
    
               
    
                                    <a href="#" 
                                    ><img src ="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png"
                                    width="200px" height="50px"></a>
                                    <a href="#" 
                                    ><img src ="https://lh3.googleusercontent.com/proxy/kpQnV3vS2kY_lFCOC_UCI-1jyTeDMR9jLl9ztmN4eZ-zhIvpOdNgw_l7Jbp1sEi0ZpLYRAYFERYbUin8D5mEjYAPVSSB-mjGtoIBiYnvfK3ZPkY"
                                    width="200px" height="50px"></a>
        

                                
							</form>

                            
						</section>

                        
					</div>



				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-md-12">

			<jsp:include page="../common/footer.jsp" />
		</div>
	</div>
</body>
</html>

