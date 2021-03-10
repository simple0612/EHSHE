<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <link rel="stylesheet" href="eee.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

<style>
body{
}

.star-rating{
    display: flex;
    justify-content: center;
    height : 100vh; 
    align-items: center;
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #333;
    width: 280px;
    text-align: center;
    border-radius: 5px;
    padding: 5px;
}
.star-rating div{
    float:left;
    width: 50%;
    
}
.stars{

}
.stars .fa{
    font-size: 20px;
    cursor: pointer;
}
.stars .fa.active{
    color: yellow;
    text-shadow: 0 0 5px;
}

.print{
    color: #fff;
}

print img{
    vertical-align: middle;
    margin-right: 5px;
}

</style>

</head>
<body>

    <div class="star-rating">
        <div class="stars">
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
        </div>
        <div class="print">
            별점 주기
        </div>

    </div>

    <script>
        $('.stars .fa').click(function(){
            $(this).addClass('active')
            $(this).prevAll().addClass('active')
            $(this).nextAll().removeClass('active')

            var num = $(this).index()
            var starRate = num + 1;
            $('.print').text(starRate);

            if(starRate == 1){$('.print').html('<img src="images/star-lv1.png">' + '별로예요')}
            else if(starRate == 2){$('.print').html('<img src="images/star-lv1.png">' + '보통이예요')}
            else if(starRate == 3){$('.print').html('<img src="images/star-lv1.png">' + '그냥 그래요')}
            else if(starRate == 4){$('.print').html('<img src="images/star-lv1.png">' + '맘에 들어요')}
            else{$('.print').html('<img src="images/star-lv1.png">' + '아주 좋아요')}
        })
    
    </script>

</body>
</html>