<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="controller.tools.user.ViewActivityTool" %>
<%@ page import="model.relation.UserJoinActivity" %>
<%@ page import="model.relation.UserManageSociety" %>
<%@ page import="util.function.Pages" %>
<%@ page import="model.Managers" %>
<%--
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
<jsp:useBean id="activity" type="model.entity.Activity" scope="session" />
<!--start-header-->
<div id="page-wrapper">

    <!-- Header -->
    <header id="header" >
        <h1><a href="<%=Pages.USER_MAIN_PAGE%>"><b>首页</b></a>
            &nbsp;&nbsp;&nbsp;<a href="<%=Pages.SOCIETY_MALL_PAGE%>"><b>社团广场</b></a>
            &nbsp;&nbsp;&nbsp;<a href="<%=Pages.ACTIVITY_CENTER_PAGE%>"><b>活动中心</b></a>
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
    UserJoinActivity uja= ViewActivityTool.isJoinedIntoActivity(user,activity);
    if(uja!=null){
        if(uja.getStatus()==1)session.setAttribute("joinStatus","已经参加");
        if(uja.getStatus()==0)session.setAttribute("joinStatus","接受邀请");
        if(uja.getStatus()==-1)session.setAttribute("joinStatus","已拒绝");
    }
    else{
        session.setAttribute("joinStatus","参加活动");
    }
%>
<div class="banner">
    <div class="container">
        <section class="slider">
            <div class="flexslider">
                <ul class="slides">
                    <li>
                        <div class="banner-top">
                            <h2>-${activity.activityName}-</h2>
                            <h3>-${activity.activityType}-</h3>
                            <div class="bnr-btn">
                                <c:if test="${joinStatus.equals(\"参加活动\")}">
                                    <a href="/join.Activity" class="hvr-shutter-out-horizontal">${joinStatus}</a>
                                </c:if>
                                <c:if test="${joinStatus.equals(\"接受邀请\")}">
                                    <a href="/join.Activity?stat=receive" class="hvr-shutter-out-horizontal">接受邀请</a>
                                    <a href="/join.Activity?stat=refuse" class="hvr-shutter-out-horizontal">拒绝邀请</a>
                                </c:if>
                                <c:if test="${!joinStatus.equals(\"参加活动\")||!joinStatus.equals(\"接受邀请\")}">
                                    <div class="hvr-shutter-out-horizontal">${joinStatus}</div>
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
<!--start-provide-->

<!--end-provide-->
<!--start-welcome-->
<div class="welcome">
    <div class="container">
        <div class="welcome-top">
            <div class="col-md-6 welcome-left">
                <h3>活动简介</h3>
                <h4>${activity.description}</h4>
                <div class="w-btn">
                    <a href="#" class="hvr-shutter-out-horizontal">Read More</a>
                </div>
            </div>
            <%
                int priority=ViewActivityTool.isManager(user,activity).getPriority();
                request.setAttribute("priority",priority);
            %>
            <c:if test="${priority>2}">
                <form action="/society.Organize">
                    您可以邀请一个用户参加此活动：<input type="text" name="inviteUser" placeholder="用户名">
                    您可以邀请一个社团举办此活动：<input type="text" name="inviteSociety" placeholder="社团名">
                    <input type="submit">
                </form>
            </c:if>
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
                <h4>开始时间</h4>
                <p>${activity.beginTime}</p>
            </div>
            <div class="col-md-3 join-left">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                <h4>结束时间</h4>
                <p>${activity.endTime}</p>
            </div>
            <div class="col-md-3 join-left">
                <span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
                <h4>地址</h4>
                <p>${activity.address}</p>
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
                    <h3>活动日志</h3>
                </div>
                <%request.setAttribute("logs", Managers.LogManager.getActivityLogs(activity.getActivityId()));%>
                <table>
                    <tr>
                        <th>时间</th>
                        <th>内容</th>
                    </tr>
                    <c:forEach var="log" items="${logs}">
                        <tr>
                            <td>${log.time}</td>
                            <td>${log.log}</td>
                        </tr>
                    </c:forEach>
                </table>
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
            <h3>参与社团</h3>
        </div>
        <div class="teacher-main">
            <form action="/view.Society">
            <c:forEach var="society" items="${activity.organizeSocieties}">
                <div class="teacher-left">
                    <input type="submit" value="${society.society.societyName}" name="${society.society.societyId}">
                </div>
            </c:forEach>
            </form>
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

</div>
<!--end-footer-->
<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>
