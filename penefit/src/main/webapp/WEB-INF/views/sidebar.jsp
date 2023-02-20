<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        aside {
            width: 200px;
            height: 700px;
            position: relative;
            display: flex;
        }

        aside li {
            list-style-type: none;
        }

        .content {
            width: 1050px;
            border: 1px solid green;
            display: flex;
        }

        .aside_title {
            font-size: 25px;
            font-weight: bold;
        }

        .aside_menu:hover a {
            color: #71b425;
            font-size: 23PX;
        }
    </style>
</head>

<body>



            <aside>
                <ul>
                	<li class="aside_title">제목</li>
                    <li class="aside_menu"><a href="#">메뉴1</a></li>
                    <li class="aside_menu"><a href="#">메뉴1</a></li>
                    <li class="aside_menu"><a href="#">메뉴1</a></li>
                    <li class="aside_menu"><a href="#">메뉴1</a></li>
                    <li class="aside_menu"><a href="#">메뉴1</a></li>
                </ul> 

            </aside>
    


</body>

</html>