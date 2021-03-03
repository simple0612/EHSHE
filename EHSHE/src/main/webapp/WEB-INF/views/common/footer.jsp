<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">

<title>footer</title>

</head>
<body>
	<footer>
        <div class="inner">
            <div class="footer-content">
                <ul class="introduce">
                    <li>Introduce</li>
                    <li><a href="#none">회사소개</a></li>
                    <li><a href="#none">이용약관</a></li>
                    <li><a href="#none">비지니스</a></li>
                    <li><a href="#none">위치</a></li>
                </ul>
                <ul class="network">
                    <li>Network</li>
                    <li><a href="#none">제휴문의</a></li>
                    <li><a href="#none">인재채용</a></li>
                    <li><a href="#none">광고</a></li>
                    <li><a href="#none">고객센터</a></li>
                </ul>
                <ul class="help">
                    <li>please contact us.</li>
                    <li>Drop me a line if I can do anything else for you.</li>
                    <li>Copyright © 2021 CodeBean. All rights reserved.</li>
                </ul>
            </div>
        </div>
    </footer>
    <div class="btn_top">
        <span class="fas fa-arrow-up"></span>
    </div>



    <script>
        $(".btn_top").click(function() {
            $('html').animate({
                scrollTop : 0
            }, 400);
        });
    </script>
</body>
</html>