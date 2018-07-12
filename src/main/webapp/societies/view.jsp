<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/10
  Time: 19:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Themeum">

    <!-- Include All Css -->


    <link rel="stylesheet" href="css/font-awesome.min.css">

    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/magnific-popup.css">
    <link rel="stylesheet" href="./css/animate.css">
    <link rel="stylesheet" href="./css/fonts.css">
    <link rel="stylesheet" href="./css/preset.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/responsive.css">
    <link rel="stylesheet" href="./assets/css/main.css" />

</head>
<body >
<!-- Header Area -->
<div id="page-wrapper">
    <header id="header" >
        <h1><a href="../index/index.jsp"><b>首页</b></a>&nbsp;&nbsp;&nbsp;<a href="#"><b>社团广场</b></a></h1>

        <nav id="nav">
            <ul>
                <li class="special">
                    <a href="#menu" class="menuToggle"><span><b>菜单</b></span></a>
                    <div id="menu">
                        <ul>
                            <li><a href="../index/index.jsp">主页</a></li>
                            <li><a href="generic.html">管理社团</a></li>
                            <li><a href="elements.html">查看社团</a></li>
                            <li><a href="file:///C:/Users/KINIONG/Desktop/1/%E7%99%BB%E5%BD%95.html">登录</a></li>
                            <li><a href="file:///C:/Users/KINIONG/Desktop/2/%E6%B3%A8%E5%86%8C.html">注册</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>

    </header>
</div>

<header class="header-area inner-page">


    <!-- Breadcrumb  -->
    <section class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-xs-12 text-center">
                    <div class="breadcrumb-content">
                        <br><br>
                        <h2><font size="40">&nbsp;&nbsp;社团CLOUD</font></h2>
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /.breadcrumb-section  -->
    <br>
    <!-- /.header-top -->
    <!-- 颜色 -->
    <nav>
        <!-- 居中 -->
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-xs-12">

                    <ul class="main-menu pull-lift">
                        <li class="menu-has-child">
                            <a href="index.html">艺术类</a>
                            <ul>
                                <li><a href="index2.html">美术</a></li>
                                <li><a href="index3.html">音乐</a></li>
                            </ul>
                        </li>
                        <li><a href="about-us.html">运动类</a></li>
                        <li class="menu-has-child">
                            <a href="#">科技类</a>
                            <ul>
                                <li>
                                    <a href="event.html">Event</a>
                                    <ul>
                                        <li><a href="event-details.html">Event Details</a></li>
                                    </ul>
                                </li>
                                <li><a href="routine.html">Routine</a></li>
                                <li><a href="contact.html">Contact</a></li>
                                <li><a href="404.html">404</a></li>
                                <li><a href="coming-soon.html">Coming Soon</a></li>
                            </ul>
                        </li>
                        <li><a href="shortcode.html">XX类</a></li>
                        <li class="menu-has-child">
                            <a href="class.html">教学类</a>
                            <ul>
                                <li><a href="class-details.html">Classes Details</a></li>
                            </ul>
                        </li>
                        <li class="menu-has-child">
                            <a href="blog.html">社会类</a>
                            <ul>
                                <li><a href="blog-details.html">Blog Details</a></li>
                            </ul>
                        </li>
                        <li class="menu-has-child">
                            <a href="teacher.html">生活类</a>
                            <ul>
                                <li><a href="teacher-details.html">Teacher Details</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" id="search-pop"><i class="fa fa-search"></i></a>
                        </li>
                    </ul>
                    <div class="mobile-menu hidden-lg hidden-md hidden-sm">
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="search-area">
            <form action="#" method="post">
                <input type="search" name="search" placeholder="输入社团名字">
            </form>
            <a href="#" class="search-close"><i class="fa fa-times"></i></a>
        </div>
    </nav>
</header>
<!-- /.header-area -->

<br><br>
<!-- Classes Section -->
<section class="classes-section-2">
    <div class="container">

        <!--搜索2
            <div class="row">
                <div class="col-sm-12 col-xs-12">
                    <div class="class-sort-btn-section">
                        <ul class="sort-btn pull-left">
                            <li class="active filter" data-filter="mix"><a href="#">All</a></li>
                            <li class="filter" data-filter="kinder" id="kinder"><a href="#">X1</a></li>
                            <li class="filter" data-filter="play" id="play"><a href="#">X2</a></li>
                            <li class="filter" data-filter="primary" id="primary"><a href="#">X3</a></li>
                            <li class="filter" data-filter="story" id="story"><a href="#">X4</a></li>
                        </ul>
                        <form method="post" action="#" class="class-search pull-right">
                            <input type="search" name="search" placeholder="搜索社团">
                            <button type="submit"><i class="fa fa-search"></i></button>
                        </form>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        -->
        <div class="row">

            <div id="mixer">
                <div class="col-sm-4 col-xs-12 mix kinder play">
                    <div class="single-class">
                        <div class="class-img">
                            <img alt="" src="images/class1/class1.jpg">
                            <div class="class-hover">
                                <a href="images/class1/class1.jpg" class="popup"><i class="icon-link"></i></a>
                            </div>
                        </div>
                        <div class="class-details">
                            <h3><a href="class.html">XX社</a></h3>
                            <p>Admission Close</p>
                            <div class="clearfix">
                                <div class="class-meta pull-left">
                                    <span>Years Old</span>
                                    <p>2-3</p>
                                </div>
                                <div class="class-meta pull-left">
                                    <span>Class Size</span>
                                    <p>24</p>
                                </div>
                                <div class="class-meta pull-left">
                                    <span>Tution Fee</span>
                                    <p>$129</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 col-xs-12 mix primary story">
                    <div class="single-class">
                        <div class="class-img">
                            <img alt="" src="images/class1/class2.jpg">
                            <div class="class-hover">
                                <a href="images/class1/class2.jpg" class="popup"><i class="icon-link"></i></a>
                            </div>
                        </div>
                        <div class="class-details">
                            <h3><a href="class.html">XX社</a></h3>
                            <p>Admission Open</p>
                            <div class="clearfix">
                                <div class="class-meta pull-left">
                                    <span>Years Old</span>
                                    <p>3-5</p>
                                </div>
                                <div class="class-meta pull-left">
                                    <span>Class Size</span>
                                    <p>20</p>
                                </div>
                                <div class="class-meta pull-left">
                                    <span>Tution Fee</span>
                                    <p>$140</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 col-xs-12 mix kinder primary">
                    <div class="single-class">
                        <div class="class-img">
                            <img alt="" src="images/class1/class3.jpg">
                            <div class="class-hover">
                                <a href="images/class1/class3.jpg" class="popup"><i class="icon-link"></i></a>
                            </div>
                        </div>
                        <div class="class-details">
                            <h3><a href="class.html">XX社</a></h3>
                            <p>Admission Close</p>
                            <div class="clearfix">
                                <div class="class-meta pull-left">
                                    <span>Years Old</span>
                                    <p>4-6</p>
                                </div>
                                <div class="class-meta pull-left">
                                    <span>Class Size</span>
                                    <p>15</p>
                                </div>
                                <div class="class-meta pull-left">
                                    <span>Tution Fee</span>
                                    <p>$150</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 col-xs-12 mix story kinder">
                    <div class="single-class">
                        <div class="class-img">
                            <img alt="" src="images/class1/class4.jpg">
                            <div class="class-hover">
                                <a href="images/class1/class4.jpg" class="popup"><i class="icon-link"></i></a>
                            </div>
                        </div>
                        <div class="class-details">
                            <h3><a href="class.html">XX社</a></h3>
                            <p>Admission Close</p>
                            <div class="clearfix">
                                <div class="class-meta pull-left">
                                    <span>Years Old</span>
                                    <p>2-3</p>
                                </div>
                                <div class="class-meta pull-left">
                                    <span>Class Size</span>
                                    <p>24</p>
                                </div>
                                <div class="class-meta pull-left">
                                    <span>Tution Fee</span>
                                    <p>$129</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-xs-12 mix kinder play">
                    <div class="single-class">
                        <div class="class-img">
                            <img alt="" src="images/class1/class5.jpg">
                            <div class="class-hover">
                                <a href="images/class1/class5.jpg" class="popup"><i class="icon-link"></i></a>
                            </div>
                        </div>
                        <div class="class-details">
                            <h3><a href="class.html">XX社</a></h3>
                            <p>Admission Open</p>
                            <div class="clearfix">
                                <div class="class-meta pull-left">
                                    <span>Years Old</span>
                                    <p>3-5</p>
                                </div>
                                <div class="class-meta pull-left">
                                    <span>Class Size</span>
                                    <p>20</p>
                                </div>
                                <div class="class-meta pull-left">
                                    <span>Tution Fee</span>
                                    <p>$140</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-xs-12 mix primary story">
                    <div class="single-class">
                        <div class="class-img">
                            <img alt="" src="images/class1/class6.jpg">
                            <div class="class-hover">
                                <a href="images/class1/class6.jpg" class="popup"><i class="icon-link"></i></a>
                            </div>
                        </div>
                        <div class="class-details">
                            <h3><a href="class.html">XX社</a></h3>
                            <p>Admission Close</p>
                            <div class="clearfix">
                                <div class="class-meta pull-left">
                                    <span>Years Old</span>
                                    <p>4-6</p>
                                </div>
                                <div class="class-meta pull-left">
                                    <span>Class Size</span>
                                    <p>15</p>
                                </div>
                                <div class="class-meta pull-left">
                                    <span>Tution Fee</span>
                                    <p>$150</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-xs-12 mix kinder primary">
                    <div class="single-class">
                        <div class="class-img">
                            <img alt="" src="images/class1/class7.jpg">
                            <div class="class-hover">
                                <a href="images/class1/class7.jpg" class="popup"><i class="icon-link"></i></a>
                            </div>
                        </div>
                        <div class="class-details">
                            <h3><a href="class.html">XX社</a></h3>
                            <p>Admission Close</p>
                            <div class="clearfix">
                                <div class="class-meta pull-left">
                                    <span>Years Old</span>
                                    <p>2-3</p>
                                </div>
                                <div class="class-meta pull-left">
                                    <span>Class Size</span>
                                    <p>24</p>
                                </div>
                                <div class="class-meta pull-left">
                                    <span>Tution Fee</span>
                                    <p>$129</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-xs-12 mix play story">
                    <div class="single-class">
                        <div class="class-img">
                            <img alt="" src="images/class1/class8.jpg">
                            <div class="class-hover">
                                <a href="images/class1/class8.jpg" class="popup"><i class="icon-link"></i></a>
                            </div>
                        </div>
                        <div class="class-details">
                            <h3><a href="class.html">XX社</a></h3>
                            <p>Admission Open</p>
                            <div class="clearfix">
                                <div class="class-meta pull-left">
                                    <span>Years Old</span>
                                    <p>3-5</p>
                                </div>
                                <div class="class-meta pull-left">
                                    <span>Class Size</span>
                                    <p>20</p>
                                </div>
                                <div class="class-meta pull-left">
                                    <span>Tution Fee</span>
                                    <p>$140</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-xs-12 mix kinder play">
                    <div class="single-class">
                        <div class="class-img">
                            <img alt="" src="images/class1/class9.jpg">
                            <div class="class-hover">
                                <a href="images/class1/class9.jpg" class="popup"><i class="icon-link"></i></a>
                            </div>
                        </div>
                        <div class="class-details">
                            <h3><a href="class.html">XX社</a></h3>
                            <p>Admission Close</p>
                            <div class="clearfix">
                                <div class="class-meta pull-left">
                                    <span>Years Old</span>
                                    <p>4-6</p>
                                </div>
                                <div class="class-meta pull-left">
                                    <span>Class Size</span>
                                    <p>15</p>
                                </div>
                                <div class="class-meta pull-left">
                                    <span>Tution Fee</span>
                                    <p>$150</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 col-xs-12 text-center">
                <ul class="paginations">
                    <li><a href="#"><i class="icon-prev"></i></a></li>
                    <li><a href="#">1</a></li>
                    <li class="active"><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">6</a></li>
                    <li><a href="#">7</a></li>
                    <li><a href="#">8</a></li>
                    <li><a href="#">9</a></li>
                    <li><a href="#">10</a></li>
                    <li><a href="#"><i class="icon-next"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</section>
<!-- /.classes-section -->



<!-- Footer Section -->
<footer class="footer-section">
    <div class="footer">
        <div class="container">
            <div class="footer-main">
                <div class="col-md-4 footer-left">
                    <span class="glyphicon glyphicon-map-marker map-marker" aria-hidden="true"></span>
                    <p>武汉 <span>洪山区</span> 国软</p>
                </div>
                <div class="col-md-4 footer-left">
                    <span class="glyphicon glyphicon-phone map-marker" aria-hidden="true"></span>
                    <p>13163292915 </p>
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
</footer>



<!-- /.footer-section -->

<!-- Include All JavaScript -->
<script src="./js/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/mixIt.js"></script>
<script src="./js/jquery.magnific-popup.min.js"></script>
<script src="./js/main.js"></script>

<script src="./assets/js/jquery.min.js"></script>
<script src="./assets/js/jquery.scrollex.min.js"></script>
<script src="./assets/js/jquery.scrolly.min.js"></script>
<script src="./assets/js/skel.min.js"></script>
<script src="./assets/js/util.js"></script>
<script src="./assets/js/main.js"></script>

</body>
</html>
