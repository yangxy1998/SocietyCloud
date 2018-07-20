<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.function.Pages" %>
<%@ page import="util.function.Creator" %>
<%@ page import="controller.tools.user.ViewMallTool" %>
<%@ page import="controller.servlet.InitServlet" %>
<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/10
  Time: 19:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>社团广场</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Themeum">

    <!-- Include All Css -->

    <link rel="stylesheet" href="./css/font-awesome.min.css">

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


<jsp:useBean id="alert" type="java.lang.String" scope="session"/>
${alert}
<%session.setAttribute("alert","");%>
<jsp:useBean id="user" type="model.entity.User" scope="session" />
<jsp:useBean id="currentPages" type="java.util.List<java.lang.String>" scope="session" />
<jsp:useBean id="currentPage" type="java.lang.String" scope="session" />
<jsp:useBean id="societies" type="java.util.List<model.entity.Society>" scope="session"/>
<jsp:useBean id="mainTypes" type="java.util.List<util.function.MainType>" scope="session"/>
<!-- Header Area -->
<div id="page-wrapper">
    <header id="header" >
        <h1>
            <a href="<%=Pages.USER_MAIN_PAGE%>"><b>首页</b></a>&nbsp;&nbsp;&nbsp;
            <a href="<%=Pages.SOCIETY_MALL_PAGE%>"><b>社团广场</b></a>&nbsp;&nbsp;&nbsp;
            <a href="<%=Pages.ACTIVITY_CENTER_PAGE%>"><b>活动中心</b></a>
        </h1>

        <nav id="nav">
            <ul>
                <li class="special">
                    <a href="#menu" class="menuToggle"><span><b>菜单</b></span></a>
                    <div id="menu">
                        <ul>
                            <li>${user.nickName}</li>
                            <li><a href="../index/index.jsp">主页</a></li>
                            <c:if test="${user.userName==null}">
                                <li><a href="<%=Pages.USER_LOGIN_PAGE%>">登录</a></li>
                                <li><a href="<%=Pages.USER_REGISTER_PAGE%>">注册</a></li>
                            </c:if>
                            <c:if test="${user.userName!=null}">
                                <li><a href="<%=Pages.USER_MANAGE_SOCIETY_PAGE%>">我的社团</a></li>
                                <li><a href="<%=Pages.USER_ACTIVITY_PAGE%>">我的活动</a> </li>
                                <li><a href="<%=Pages.USER_PERSONAL_CENTER_PAGE%>">个人中心</a></li>
                                <li><a href="../login">退出登录</a> </li>
                            </c:if>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>

    </header>
</div>

<header class="header-area inner-page">


    <!-- Breadcrumb  -->
    <article id="main">
        <header>
            <p><font size="24">社团广场</font></p>
            <p>Community square</p>
        </header>
    </article>
    <!-- /.breadcrumb-section  -->
    <br>
    <!-- /.header-top -->
    <!-- 颜色 -->
    <nav>
        <!-- 居中 -->
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-xs-12">
                    <ul class="main-menu pull-lift ">


                        <form action="<%=Pages.SOCIETY_MALL_PAGE%>">
                        <c:forEach var="mainType" items="${mainTypes}">


                            <li class="menu-has-child">

                                <input type="submit" name="${mainType.mainType}" value="${mainType.mainType}">
                                <ul>
                                    <c:forEach var="subType" items="${mainType.subTypes}">
                                        <li ><input  type="submit" name="${subType}" value="${subType}"></li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:forEach>
                            <li>
                                <input style="width: 150px;height: 25px" type="text" name="keyword" placeholder="输入关键字">
                            </li>
                            <li>
                                <input type="submit" value="搜索">
                            </li>
                        </form>
                    </ul>
                    <div class="mobile-menu hidden-lg hidden-md hidden-sm">
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>
<!-- /.header-area -->

<br>
<!-- Classes Section -->
<section class="classes-section-2">
    <div class="container">

        <div class="row">

            <div id="mixer">
                <form action="/view.Society" method="post">
                <c:forEach var="society" items="${societies}">
                    <div class="col-sm-4 col-xs-12 mix kinder play">
                        <div class="single-class">
                            <div class="class-img">
                                <c:if test="${society.isPictureExist}">
                                    <img alt="" src="../SocietyFiles/${society.societyId}/${society.societyId}.jpg">
                                </c:if>
                                <c:if test="${!society.isPictureExist}">
                                    <img alt="" src="images/class1/class1.jpg">
                                </c:if>
                                <div class="class-hover">
                                    <c:if test="${society.isPictureExist}">
                                        <a href="../SocietyFiles/${society.societyId}/${society.societyId}.jpg" class="popup">
                                    </c:if>
                                    <c:if test="${!society.isPictureExist}">
                                        <a href="images/class1/class1.jpg" class="popup">
                                    </c:if>
                                        <i class="icon-link"></i>
                                    </a>
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
