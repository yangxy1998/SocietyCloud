<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/10
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:useBean id="society" type="model.entity.Society" scope="session"/>
<head>
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Tutoring Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="./css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="./css/style.css" rel='stylesheet' type='text/css' />
    <script src="./js/jquery.min.js"></script>
    <script src="./js/bootstrap.js"></script>
    <!---- start-smoth-scrolling---->
    <script type="text/javascript" src="./js/move-top.js"></script>
    <script type="text/javascript" src="./js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>
    <!--start-smoth-scrolling-->
</head>
<body>
<!--start-header-->
<div class="header" id="home">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt="" /></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.html" class="hvr-bounce-to-top">主页 <span class="sr-only">(current)</span></a></li>
                    <li><a href="./about.html" class="hvr-bounce-to-top">关于社团</a></li>
                    <li><a href="./services.html" class="hvr-bounce-to-top">社团活动</a></li>
                    <li><a href="./typo.html" class="hvr-bounce-to-top">社团经历</a></li>
                    <li><a href="./contact.html" class="hvr-bounce-to-top">联系我们</a></li>
                </ul>
                <div class="clearfix"></div>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
<!--end-header-->
<!--start-banner-->
<div class="banner">
    <div class="container">
        <section class="slider">
            <div class="flexslider">
                <ul class="slides">
                    <li>
                        <div class="banner-top">
                            <h1>${society.societyName}</h1>
                            <h2>-${society.mainType}-</h2>
                            <h3>-${society.subType}-</h3>
                            <div class="bnr-btn">
                                <a href="#" class="hvr-shutter-out-horizontal">更多</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="banner-top">
                            <h1>XX社</h1>
                            <h2>XXXXXXXXXXX</h2>
                            <div class="bnr-btn">
                                <a href="#" class="hvr-shutter-out-horizontal">更多</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="banner-top">
                            <h1>XX社</h1>
                            <h2>XXXXXXXXXXX</h2>
                            <div class="bnr-btn">
                                <a href="#" class="hvr-shutter-out-horizontal">更多</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
    </div>
</div>
<!--end-banner-->
<!--FlexSlider-->
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<script defer src="./js/jquery.flexslider.js"></script>
<script type="text/javascript">
    $(function(){
        SyntaxHighlighter.all();
    });
    $(window).load(function(){
        $('.flexslider').flexslider({
            animation: "slide",
            start: function(slider){
                $('body').removeClass('loading');
            }
        });
    });
</script>
<!--End-slider-script-->
<!--start-provide-->

<!--end-provide-->
<!--start-welcome-->
<div class="welcome">
    <div class="container">
        <div class="welcome-top">
            <div class="col-md-6 welcome-left">
                <h3>主要工作</h3>
                <h4>XXXXXXXXXXXXX</h4>
                <p>XXXXXXXXXXX</p>
                <div class="w-btn">
                    <a href="#" class="hvr-shutter-out-horizontal">Read More</a>
                </div>
            </div>
            <div class="col-md-6 welcome-left">
                <h3>XXXXXXXX</h3>
                <h4>XXXXXXXX</h4>
                <p>XXXXXXXX</p>
                <div class="w-btn">
                    <a href="#" class="hvr-shutter-out-horizontal">Read More</a>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--end-welcome-->
<!--start-join-->
<div class="join">
    <div class="container">
        <div class="join-main">
            <div class="col-md-3 join-left">
                <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                <h4>活动很多</h4>
                <p>XXXXXXXXXXXXXXXXXXXXXXXXX</p>
            </div>
            <div class="col-md-3 join-left">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                <h4>成员</h4>
                <p>XXXXXXXXXXXXXXXXXXXXXXXXX</p>
            </div>
            <div class="col-md-3 join-left">
                <span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
                <h4>活动地点</h4>
                <p>XXXXXXXXXXXXXXXXXXXXXXXXX</p>
            </div>
            <div class="col-md-3 join-left">
                <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                <h4>日历<h4>
                    <p>XXXXXXXXXXXXXXXXXXXXXXXXX</p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--end-join-->

<!--start-news-->
<div class="news">
    <div class="container">
        <div class="news-top">
            <div class="col-md-8 news-left">
                <div class="news-heading">
                    <h3>新闻</h3>
                </div>
                <div class="news-bottom">
                    <h4>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</h4>
                    <p>XXXXXXXXXXXXXXXXXXXXXXXXXXX </p>
                    <div class="news-one">
                        <div class="news-one-left">
                            <img src="images/n-1.jpg" alt="" />
                        </div>
                        <div class="news-one-right">
                            <h4>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</h4>
                            <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="news-one">
                        <h4>XXXXXXXXXXXXXXXXXXXXXXX</h4>
                        <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 news-right">
                <div class="news-heading">
                    <h3>相册</h3>
                </div>
                <div class="news-btm">
                    <div class="news-1">
                        <img src="images/n-2.jpg" alt="" />
                        <div class="n-1">
                            <h5>XXXXXXXXXXXX</h5>
                            <p>XXXXXXXXXXXXXXXXXXX</p>
                        </div>
                    </div>
                    <div class="news-1">
                        <img src="images/n-3.jpg" alt="" />
                        <div class="n-1">
                            <h5>XXXXXXXXXXXXXXXXXXXXXXX</h5>
                            <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--end-news-->
<!--start-teacher-->
<div class="teacher">
    <div class="container">
        <div class="teacher-top">
            <h3>出色成员</h3>
        </div>
        <div class="teacher-main">
            <div class="teacher-left">
                <img src="images/t-1.jpg" alt="" />
                <h4>陈小明</h4>
                <p>🐮🍺</p>
            </div>
            <div class="teacher-left">
                <img src="images/t-2.jpg" alt="" />
                <h4>陈小明</h4>
                <p>🐮🍺</p>
            </div>
            <div class="teacher-left">
                <img src="images/t-3.jpg" alt="" />
                <h4>陈小明</h4>
                <p>🐮🍺</p>
            </div>
            <div class="teacher-left">
                <img src="images/t-4.jpg" alt="" />
                <h4>陈小明</h4>
                <p>🐮🍺</p>
            </div>
            <div class="teacher-left">
                <img src="images/t-5.jpg" alt="" />
                <h4>陈小明</h4>
                <p>🐮🍺</p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--end-teacher-->
<!--start-footer-->
<div class="footer">
    <div class="container">
        <div class="footer-main">
            <div class="col-md-4 footer-left">
                <span class="glyphicon glyphicon-map-marker map-marker" aria-hidden="true"></span>
                <p>武汉 <span>洪山区</span> 国软</p>
            </div>
            <div class="col-md-4 footer-left">
                <span class="glyphicon glyphicon-phone map-marker" aria-hidden="true"></span>
                <p>13163292915 <span>13163292915</span> </p>
            </div>

            <div class="clearfix"></div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function() {
            /*
             var defaults = {
             containerID: 'toTop', // fading element id
             containerHoverID: 'toTopHover', // fading element hover id
             scrollSpeed: 1200,
             easingType: 'linear'
             };
             */

            $().UItoTop({ easingType: 'easeOutQuart' });

        });
    </script>
    <a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</div>
<!--end-footer-->
</body>
</html>
