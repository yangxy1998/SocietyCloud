<%@ page import="model.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/4
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Pop HTML5 Template</title>
    <!-- load CSS -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
    <link rel="stylesheet" href="css/tooplate-style.css">

    <script>document.documentElement.className="js";var supportsCssVars=function(){var e,t=document.createElement("style");return t.innerHTML="root: { --tmp-var: bold; }",document.head.appendChild(t),e=!!(window.CSS&&window.CSS.supports&&window.CSS.supports("font-weight","var(--tmp-var)")),t.parentNode.removeChild(t),e};supportsCssVars()||alert("Please view this in a modern browser such as latest version of Chrome or Microsoft Edge.");</script>

</head>

<body>

<div id="tm-bg"></div>
<div id="tm-wrap">
    <div class="tm-main-content">
        <div class="container tm-site-header-container">
            <div class="row">
                <div class="col-sm-12 col-md-6 col-lg-6 col-md-col-xl-6 mb-md-0 mb-sm-4 mb-4 tm-site-header-col">

                    <div class="tm-site-header">
                        <h1 class="mb-4">社团Cloud</h1>
                        <img src="img/underline.png" class="img-fluid mb-4">
                        <%
                            User user=(User)request.getAttribute("user");
                            if(user!=null)
                                out.println("<p>"+user.getUserName()+"</p>");
                            else
                                out.println("<p>"+"登录了解更多~"+"</p>");
                        %>
                    </div>
                </div>

                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
                    <div class="content">
                        <div class="grid">
                            <div class="grid__item" id="home-link">
                                <div class="product">
                                    <div class="tm-nav-link">
                                        <i class="fas fa-home fa-3x tm-nav-icon"></i>
                                        <a href="../login/login.html">
                                            <span class="tm-nav-text">欢迎</span>
                                        </a>
                                        <div class="product__bg"></div>
                                    </div>
                                    <div class="product__description">
                                        <div class="row mb-3">
                                            <div class="col-12">
                                                <h2 class="tm-page-title">欢迎加入各大社团</h2>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                <img src="img/welcome-1.jpg" class="img-fluid mb-3">
                                                <p>社团简介： 摄影协会是在校团委领导下的学生社团之一，成立于1986年，在成长的过程中，始终坚持“团结，进取，求实，创新”的宗旨，历年均与高分被评为“一级协会”，“十佳社团”。在1998年，在广东省大学生摄影比赛中获得“一、二、三”等奖，两个优秀奖，会员作品在《中国青年报》、《南方日报》、《西江日报》、《高腰报》以及校级刊物发表，共达200多幅。<a href="file:///C:/Users/KINIONG/Desktop/2/%E6%B3%A8%E5%86%8C.html" ><font size="4" color="lightblue">了解详细</font></a></p>
                                                <p>社团简介： 摄影协会是在校团委领导下的学生社团之一，成立于1986年，在成长的过程中，始终坚持“团结，进取，求实，创新”的宗旨，历年均与高分被评为“一级协会”，“十佳社团”。在1998年，在广东省大学生摄影比赛中获得“一、二、三”等奖，两个优秀奖，会员作品在《中国青年报》、《南方日报》、《西江日报》、《高腰报》以及校级刊物发表，共达200多幅。<a href="file:///C:/Users/KINIONG/Desktop/2/%E6%B3%A8%E5%86%8C.html" ><font size="4" color="lightblue">了解详细</font></a></p>
                                                <p>社团简介： 摄影协会是在校团委领导下的学生社团之一，成立于1986年，在成长的过程中，始终坚持“团结，进取，求实，创新”的宗旨，历年均与高分被评为“一级协会”，“十佳社团”。在1998年，在广东省大学生摄影比赛中获得“一、二、三”等奖，两个优秀奖，会员作品在《中国青年报》、《南方日报》、《西江日报》、《高腰报》以及校级刊物发表，共达200多幅。<a href="file:///C:/Users/KINIONG/Desktop/2/%E6%B3%A8%E5%86%8C.html" ><font size="4" color="lightblue">了解详细</font></a></p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                <p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                                value<p>Vivamus placerat in nunc eget volutpat. Etiam tincidunt blandit sapien, sed posuere enim. Ut eget ornare lectus.</p>
                                            </div>
                                            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                                <p>科学探索协会是一个在2006年至2007年第一学期新成立的协会，旨在探索古今中外的各类奥秘。它的创立为厦门大学的同学提供了一块新天地。 科学探索协会是一个具有探索精神的社团。对于身边的或我们听说的未知事物的，无论是出于人性好奇的本质，还是出于人类的职责所在，人们都致力于对它们的开发和探索。而我们，作为一群有责任感，求知预望强烈的大学生，面对浩大神秘世界，更应积极主动的去探索，去发现，去挑战那些未知领域。科学探索协会也正是基于这样一种理念，将激励各位同学勇敢的闯入那些“不毛之地”、将探索精神内化为人生态度。<a href="file:///C:/Users/KINIONG/Desktop/2/%E6%B3%A8%E5%86%8C.html" ><font size="4" color="lightblue">注册</font></a></p>
                                                <p>社团简介： 摄影协会是在校团委领导下的学生社团之一，成立于1986年，在成长的过程中，始终坚持“团结，进取，求实，创新”的宗旨，历年均与高分被评为“一级协会”，“十佳社团”。在1998年，在广东省大学生摄影比赛中获得“一、二、三”等奖，两个优秀奖，会员作品在《中国青年报》、《南方日报》、《西江日报》、《高腰报》以及校级刊物发表，共达200多幅。<a href="file:///C:/Users/KINIONG/Desktop/2/%E6%B3%A8%E5%86%8C.html" ><font size="4" color="lightblue">了解详细</font></a></p>
                                                <img src="img/welcome-2.jpg" class="img-fluid">
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="grid__item" id="team-link">
                                <div class="product">
                                    <div class="tm-nav-link">
                                        <i class="fas fa-users fa-3x tm-nav-icon"></i>
                                        <span class="tm-nav-text">查看社团</span>
                                        <div class="product__bg"></div>
                                    </div>
                                    <div class="product__description">
                                        <div class="p-sm-4 p-2">
                                            <div class="row mb-3">
                                                <div class="col-12">
                                                    <h2 class="tm-page-title">社团信息</h2>
                                                </div>
                                            </div>
                                            <div class="row tm-reverse-sm">
                                                <div class="col-sm-12 col-md-8 col-lg-8 col-xl-8">
                                                    <p class="mb-4"></p>
                                                    <p class="mb-4"></p>
                                                    <p class="mb-5">已参加社团:</p>
                                                    <p class="mb-5">社团活动:</p>
                                                    <p class="mb-5">社团新闻:</p>
                                                    <p class="mb-5">社团人士改动:</p>
                                                    <p class="mb-5">邀请成员:</p>
                                                    <p class="mb-5">退出社团:</p>
                                                    <a href="#" class="btn tm-btn-gray">Read More</a>
                                                </div>
                                                <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4 mb-lg-0 mb-sm-4 mb-4">
                                                    <img src="img/team.jpg" class="img-fluid">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="grid__item">
                                <div class="product">
                                    <div class="tm-nav-link">
                                        <i class="fas fa-handshake fa-3x tm-nav-icon"></i>
                                        <span class="tm-nav-text">管理社团</span>
                                        <div class="product__bg"></div>
                                    </div>
                                    <div class="product__description">
                                        <div class="p-sm-4 p-2">
                                            <div class="row mb-3">
                                                <div class="col-12">
                                                    <h2 class="tm-page-title">可管理社团:</h2>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-12">
                                                    <p>XX社</p>
                                                    <p>发布社团活动</p>
                                                    <p>修改成员权利</p>
                                                    <p>邀请成员</p>
                                                    <p>删除成员</p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="p-sm-4 p-2 tm-img-container">
                                                        <div class="tm-img-slider" id="tmImgSlider">
                                                            <img src="img/gallery-img-01-tn.jpg" alt="Image" class="tm-slider-img">
                                                            <img src="img/gallery-img-02-tn.jpg" alt="Image" class="tm-slider-img">
                                                            <img src="img/gallery-img-03-tn.jpg" alt="Image" class="tm-slider-img">
                                                            <img src="img/gallery-img-04-tn.jpg" alt="Image" class="tm-slider-img">
                                                            <img src="img/gallery-img-05-tn.jpg" alt="Image" class="tm-slider-img">
                                                            <img src="img/gallery-img-06-tn.jpg" alt="Image" class="tm-slider-img">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="grid__item">
                                <div class="product">
                                    <div class="tm-nav-link">
                                        <i class="fas fa-comments fa-3x tm-nav-icon"></i>
                                        <span class="tm-nav-text">反馈</span>
                                        <div class="product__bg"></div>
                                    </div>
                                    <div class="product__description">
                                        <div class="pt-sm-4 pb-sm-4 pl-sm-5 pr-sm-5 pt-2 pb-2 pl-3 pr-3">
                                            <div class="row mb-3">
                                                <div class="col-12">
                                                    <h2 class="tm-page-title">信息</h2>
                                                </div>
                                            </div>
                                            <div class="row mb-4">
                                                <div class="col-12">
                                                    <p>xxxx</p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <form action="index.html" method="post" class="contact-form">
                                                        <div class="row">
                                                            <div class="form-group col-md-6 col-lg-6 col-xl-6">
                                                                <input type="text" id="contact_name" name="contact_name" class="form-control" placeholder="Name"  required/>
                                                            </div>
                                                            <div class="form-group col-md-6 col-lg-6 col-xl-6 tm-col-email">
                                                                <input type="email" id="contact_email" name="contact_email" class="form-control" placeholder="Email"  required/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <textarea id="contact_message" name="contact_message" class="form-control" rows="9" placeholder="Message" required></textarea>
                                                        </div>
                                                        <button type="submit" class="btn btn-primary tm-btn-submit">Submit</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<script src="js/jquery-3.2.1.slim.min.js"></script>
<script src="slick/slick.min.js"></script>
<script src="js/anime.min.js"></script>
<script src="js/main.js"></script>
<script>

    function setupFooter() {
        var pageHeight = $('.tm-site-header-container').height() + $('footer').height() + 100;

        var main = $('.tm-main-content');

        if($(window).height() < pageHeight) {
            main.addClass('tm-footer-relative');
        }
        else {
            main.removeClass('tm-footer-relative');
        }
    }

    /* DOM is ready
     ------------------------------------------------*/
    $(function(){

        setupFooter();

        $(window).resize(function(){
            setupFooter();
        });

        $('.tm-current-year').text(new Date().getFullYear());
    });

</script>

</body>
</html>
