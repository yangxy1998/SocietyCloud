<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.entity.Activity" %>
<%@ page import="model.relation.SocietyOrganizeActivity" %>
<%@ page import="model.relation.UserManageSociety" %>
<%@ page import="util.function.Pages" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="controller.tools.user.ViewActivityTool" %>
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
    <title>社团活动</title>
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
<jsp:useBean id="society" type="model.entity.Society" scope="session"/>

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
<!--end-header-->

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
<%
    for (UserManageSociety ums:society.getManageUsers()) {
        if(ums.getUserId().equals(user.getUserId())){
            out.println("&nbsp;&nbsp;&nbsp;<a href=\""+Pages.SOCIETY_MANAGE_PAGE+"\"><b>管理社团</b></a>");
            out.println("&nbsp;&nbsp;&nbsp;<a href=\""+Pages.SOCIETY_LOG_PAGE+"\"><b>社团日志</b></a>");
            request.setAttribute("priority",ums.getPriority());
        }
    }
%>

<!-- Classes Section -->
<section class="classes-section-2">
    <div class="container">


        <%
            List<Activity> activities=new ArrayList<>();
            List<SocietyOrganizeActivity> soas=new ArrayList<>();
            for (SocietyOrganizeActivity soa:society.getOrganizeActivities()) {
                if(soa.getStatus()==1) activities.add(soa.getActivity());
                else soas.add(soa);
            }
            session.setAttribute("activities",activities);
            request.setAttribute("soas",soas);
        %>
        <div class="row">

            <div id="mixer">
                <c:if test="${priority>2}">
                    <a href="../society/organize.jsp">您可以创建一个活动。</a>
                        <c:if test="${soas.size()>0}">
                            您有待处理的活动邀请：
                            <c:forEach var="soa" items="${soas}">
                                <c:if test="${soa.status==0}">
                                    <a href="/view.Activity?activityId=${soa.activityId}">${soa.activity.activityName}</a>
                                    <a href="/society.Organize?activityId=${soa.activityId}&receive=true">接受邀请</a>
                                    <a href="/society.Organize?activityId=${soa.activityId}&refuse=true">拒绝邀请</a>
                                </c:if>
                                <c:if test="${soa.status==-1}">
                                    <a href="/view.Activity?activityId=${soa.activityId}">${soa.activity.activityName}</a>
                                    <span>已拒绝</span>
                                </c:if>
                            </c:forEach>
                        </c:if>
                </c:if>

                    <c:forEach var="activity" items="${activities}">
                        <div class="col-sm-4 col-xs-12 mix kinder play">
                            <div class="single-class">
                                <div class="class-img">
                                    <c:if test="${activity.isPictureExist}">
                                        <img alt="" src="../ActivityFiles/${activity.activityId}/${activity.activityId}.jpg">
                                    </c:if>
                                    <c:if test="${!activity.isPictureExist}">
                                        <img alt="" src="images/class1/class1.jpg">
                                    </c:if>
                                    <div class="class-hover">
                                        <a href="images/class1/class1.jpg" class="popup"><i class="icon-link"></i></a>
                                    </div>
                                </div>
                                <div class="class-details">
                                    <h3>${activity.activityName}
                                        <form action="/view.Activity" method="post">
                                        <br/><input type="submit" name="${activity.activityId}" value="查看">
                                        </form>
                                        <c:if test="${priority>2}">
                                            <form action="/manage.Activity">
                                                <br/><input type="submit" name="${activity.activityId}" value="修改">
                                            </form>
                                        </c:if>
                                    </h3>
                                    <div class="clearfix">
                                        <div class="class-meta pull-left">
                                            <span>主办方：${activity.organizer}</span>
                                            <span>开始时间：${activity.beginTime}</span>
                                            <span>
                                            参与人数：${activity.joinUsers.size()}
                                        </span>
                                            <c:if test="${activity.isComming==true}">
                                                <span>即将开始</span>
                                            </c:if>
                                            <c:if test="${activity.isRunning==true}">
                                                <span>正在进行</span>
                                            </c:if>
                                            <c:if test="${activity.isOver==true}">
                                                <span>已经结束</span>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                <div class="clearfix"></div>
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
