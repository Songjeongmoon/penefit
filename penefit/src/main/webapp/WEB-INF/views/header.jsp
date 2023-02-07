<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/footers/">
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.3.js"
        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css" >
</head>

<body>


        <div class="box">
            <header>
                <div id="logo_box"><a href="#"><img src="images/penefit.png" id="logo_img"></a></div>
                <div id="search_bar"><button><img src="images/loupe.png" id="loupe_img"></button></div>
                <div id="right_header">
                    <div id="icon_box">
                        <img src="images/myinfo.png">
                        <img src="images/shopping-cart.png">
                    </div><br>
                    <div id="log_box"><a href="#">로그인</a> | <a href="#">회원가입</a></div>
                </div>
                <nav>
                    <ul>
                        <li>
                            <div class="title">센터</div>
                            <div class="subtitle">
                                <div class="subtitle_li"><a href="#">센터소개</a></div>
                                <div class="subtitle_li"><a href="#">연혁</a></div>
                                <div class="subtitle_li"><a href="#">오시는길</a></div>
                                <div class="subtitle_li"><a href="#">새소식</a></div>

                            </div>
                        </li>
                        <li>
                            <div class="title">클래스</div>
                            <div class="subtitle">
                                <div class="subtitle_li"><a href="classList">클래스과정</a></div>
                                <div class="subtitle_li"><a href="#">수강문의</a></div>
                                <div class="subtitle_li"><a href="#">수강신청</a></div>
                                <div class="subtitle_li"><a href="#">클래스제안</a></div>

                            </div>
                        </li>
                        <li>
                            <div class="title">커뮤니티</div>
                            <div class="subtitle">
                                <div class="subtitle_li"><a href="#">공지사항</a></div>
                                <div class="subtitle_li"><a href="#">수강후기</a></div>
                                <div class="subtitle_li"><a href="#">지역별게시판</a></div>
                                <div class="subtitle_li"><a href="#">클래스별게시판</a></div>
                           
                            </div>
                        </li>
                        <li>
                            <div class="title">문의</div>
                            <div class="subtitle">
                                <div class="subtitle_li"><a href="#">FAQ</a></div>
                                <div class="subtitle_li"><a href="#">Q&A</a></div>
                                <div class="subtitle_li">&nbsp;</div>
                                <div class="subtitle_li">&nbsp;</div>
                            </div>
                        </li>
                    </ul>
                </nav>
            </header>
        </div>



    <script>
        $(".title").mouseover(function () {
            $(".subtitle").css("display", "block");
            $(".subtitle").mouseover(function () {
                $(".subtitle").css("display", "block");
            })
        })
        $(".title").mouseout(function () {
            $(".subtitle").css("display", "none");
        })
        $(".subtitle").mouseout(function () {
            $(".subtitle").css("display", "none");
        })
    </script>
</body>

</html>