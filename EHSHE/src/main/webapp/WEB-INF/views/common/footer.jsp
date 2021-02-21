<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="${contextPath}/resources/css/default.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">

<title>footer</title>

</head>
<body>
	<footer class="footer_area">
        <div class="footer_top">
            <div class="footer_item">
                <h3 class="logo">EHSHE</h3>
                <img src="${contextPath}/resources/images/ehsheLogo.png" style="width:80px;">
            </div>
            <div class="footer_item">
                <P class="team_introduce">기획팀</P>
                <ul class="team-list list1">
                    <li class="team_member">
                        <figure class="member_photo" style="background-image: url(${contextPath}/resources/images/manhee.jpg);"></figure>
                        <p class="team_name">김만희</p> &nbsp;&nbsp;
                        <p class="member_message">
                            오늘 밤 너를 갖겠어..
                        </p>
                    </li>
                    <li class="team_member">
                        <figure class="member_photo" style="background-image: url(${contextPath}/resources/images/heedo.jpg)"></figure>
                        <p class="team_name">박희도</p> &nbsp;&nbsp;
                        <p class="member_message">
                            오늘 밤 너를 갖겠어..
                        </p>
                    </li>
                    <li class="team_member">
                        <figure class="member_photo" style="background-image: url(${contextPath}/resources/images/junho.jpg);"></figure>
                        <p class="team_name">이준호</p> &nbsp;&nbsp;
                        <p class="member_message">
                            오늘 밤 너를 갖겠어..
                        </p>
                    </li>
                </ul>

                <ul class="team-list list2">
                    <li class="team_member">
                        <figure class="member_photo" style="background-image: url(${contextPath}/resources/images/taewoo.jpg);"></figure>
                        <p class="team_name">김태우</p> &nbsp;&nbsp;
                        <p class="member_message">
                            오늘 밤 너를 갖겠어..
                        </p>
                    </li>
                    <li class="team_member">
                        <figure class="member_photo" style="background-image: url(${contextPath}/resources/images/jikwon.jpg);"></figure>
                        <p class="team_name">유지권</p> &nbsp;&nbsp;
                        <p class="member_message">
                           오늘 밤 너를 갖겠어..
                        </p>
                    </li>
                </ul>
            </div>
            <div class="footer_item">
                <p class="team-leader"> 대표 이름 : 김 만 희</p>
                <p class="team-phone"> 010 - 0000 - 0000</p>
                <p class="team-address"> 서울 중구 남대문로 120 대일빌딩 2층, 3층</p>

            </div>
        </div>
        <div class="footer_bottom">
            <div class="footer_item2">
                <p>Copyright &copy; KH Information Educational Institute A-Class</p>
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