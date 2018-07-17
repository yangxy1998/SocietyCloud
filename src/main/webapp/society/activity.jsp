<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.relation.UserManageSociety" %>
<%@ page import="util.function.Pages" %>
<%@ page import="controller.tools.user.ViewSocietyTool" %>
<%@ page import="model.relation.UserJoinSociety" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/10
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Tutoring Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>



    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="../societies/css/bootstrap.min.css">
    <link rel="stylesheet" href="../societies/css/magnific-popup.css">
    <link rel="stylesheet" href="../societies/css/animate.css">
    <link rel="stylesheet" href="../societies/css/fonts.css">
    <link rel="stylesheet" href="../societies/css/preset.css">
    <link rel="stylesheet" href="../societies/css/style.css">
    <link rel="stylesheet" href="../societies/css/responsive.css">
    <link rel="stylesheet" href="./assets/css/main2.css" />

    <link href="./css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="./css/style.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="./assets/css/main.css" />

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
<jsp:useBean id="alert" type="java.lang.String" scope="session"/>
${alert}
<%session.setAttribute("alert","");%>
<jsp:useBean id="user" type="model.entity.User" scope="session" />
<jsp:useBean id="society" type="model.entity.Society" scope="session" />
<!--start-header-->
<div id="page-wrapper">

    <!-- Header -->
    <header id="header" >
        <h1><a href="<%=Pages.USER_MAIN_PAGE%>"><b>首页</b></a>
            &nbsp;&nbsp;&nbsp;<a href="<%=Pages.SOCIETY_MALL_PAGE%>"><b>社团广场</b></a>
            &nbsp;&nbsp;&nbsp;<a href="<%=Pages.SOCIETY_MAIN_PAGE%>"><b>社团首页</b></a>
            &nbsp;&nbsp;&nbsp;<a href="<%=Pages.SOCIETY_COMMENT_PAGE%>"><b>社团评论</b></a>
            &nbsp;&nbsp;&nbsp;<a href="<%=Pages.SOCIETY_ACTIVITY_PAGE%>"><b>社团活动</b></a>
            <%
                for (UserManageSociety ums:society.getManageUsers()) {
                    if(ums.getUserId().equals(user.getUserId())){
                        out.println("&nbsp;&nbsp;&nbsp;<a href=\""+Pages.SOCIETY_MANAGE_PAGE+"\"><b>管理社团</b></a>");
                        out.println("&nbsp;&nbsp;&nbsp;<a href=\""+Pages.SOCIETY_LOG_PAGE+"\"><b>社团日志</b></a>");
                        break;
                    }
                }
            %>
        </h1>

        <nav id="nav">
            <ul>
                <li class="special">
                    <a href="#menu" class="menuToggle"><span><b>菜单</b></span></a>
                    <div id="menu">
                        <ul>
                            <li>${user.nickName}</li>
                            <a href="<%=Pages.USER_MAIN_PAGE%>"><b>首页</b></a>
                            <c:if test="${user.userName==null}">
                                <li><a href="<%=Pages.USER_LOGIN_PAGE%>">登录</a></li>
                                <li><a href="<%=Pages.USER_REGISTER_PAGE%>">注册</a></li>
                            </c:if>
                            <c:if test="${user.userName!=null}">
                                <li><a href="<%=Pages.USER_MANAGE_SOCIETY_PAGE%>">我的社团</a></li>
                                <li><a href="<%=Pages.USER_PERSONAL_CENTER_PAGE%>">个人中心</a></li>
                                <li><a href="<%=Pages.USER_LOGIN_PAGE%>">退出登录</a> </li>
                            </c:if>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>

    </header>
</div>
<!--end-header-->


<!--start-banner-->
<%
    UserJoinSociety ujs=ViewSocietyTool.isJoinedIntoSociety(user,society);
    if(ujs!=null){
        if(ujs.getStatus()==1)session.setAttribute("joinStatus","已经加入");
        if(ujs.getStatus()==0)session.setAttribute("joinStatus","等待审批");
        if(ujs.getStatus()==-1)session.setAttribute("joinStatus","已被拒绝");
    }
    else{
        session.setAttribute("joinStatus","加入社团");
    }
%>
<div class="banner">
    <div class="container">
        <section class="slider">
            <div class="flexslider">
                <ul class="slides">
                    <li>
                        <div class="banner-top">
                            <h2>-${society.societyName}-</h2>
                            <h3>-${society.mainType}-${society.subType}-</h3>
                            <div class="bnr-btn">
                                <c:if test="${!joinStatus.equals(\"加入社团\")}">
                                    <div class="hvr-shutter-out-horizontal">${joinStatus}</div>
                                </c:if>
                                <c:if test="${joinStatus.equals(\"加入社团\")}">
                                    <a href="/join.Society" class="hvr-shutter-out-horizontal">${joinStatus}</a>
                                </c:if>
                            </div>
                        </div>
                    </li>
                    <%--<li>--%>
                        <%--<div class="banner-top">--%>
                            <%--<h2>${society.societyName}</h2>--%>
                            <%--<div class="bnr-btn">--%>
                                <%--<a href="#" class="hvr-shutter-out-horizontal">更多</a>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<div class="banner-top">--%>
                            <%--<h2>${society.societyName}</h2>--%>
                            <%--<div class="bnr-btn">--%>
                                <%--<a href="#" class="hvr-shutter-out-horizontal">更多</a>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</li>--%>
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
                <form action="/view.Society" method="post">
                    <c:forEach var="society" items="${societies}">
                        <div class="col-sm-4 col-xs-12 mix kinder play">
                            <div class="single-class">
                                <div class="class-img">
                                    <img alt="" src="images/class1/class1.jpg">
                                    <div class="class-hover">
                                        <a href="images/class1/class1.jpg" class="popup"><i class="icon-link"></i></a>
                                    </div>
                                </div>
                                <div class="class-details">
                                    <h3>${society.societyName}
                                        <br/><input type="submit" name="${society.societyId}" value="查看"></h3>
                                    <div class="clearfix">
                                        <div class="class-meta pull-left">
                                            <span>所属学校：${society.schoolName}</span>
                                            <span>创建时间：${society.foundDate.split(" ")[0]}</span>
                                            <span>
                                            社团人数：${society.joinUsers.size()}
                                        </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </form>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 col-xs-12 text-center">
                <ul class="paginations">
                    <li><a href="#"><i class="icon-prev"></i></a></li>
                    <form action="<%=Pages.SOCIETY_MALL_PAGE%>">
                        <c:forEach var="p" items="${currentPages}">
                            <c:if test="${p.equals(currentPage)}">
                                <input type="submit" name="${p}" value="${p}">
                            </c:if>
                            <c:if test="${!p.equals(currentPage)}">
                                <input type="submit" name="${p}" value="${p}">
                            </c:if>
                        </c:forEach>
                    </form>
                    <li><a href="#"><i class="icon-next"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</section>
<!-- /.classes-section -->





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

</div>
<!--end-footer-->
<!-- Scripts -->
<script src="../societies/js/jquery.min.js"></script>
<script src="../societies/js/bootstrap.min.js"></script>
<script src="../societies/js/mixIt.js"></script>
<script src="../societies/js/jquery.magnific-popup.min.js"></script>
<script src="../societies/js/main.js"></script>


<script src="../societies/assets/js/jquery.min.js"></script>
<script src="../societies/assets/js/jquery.scrollex.min.js"></script>
<script src="../societies/assets/js/jquery.scrolly.min.js"></script>
<script src="../societies/assets/js/skel.min.js"></script>
<script src="../societies/assets/js/util.js"></script>
<script src="../societies/assets/js/main.js"></script>
</body>
</html>
