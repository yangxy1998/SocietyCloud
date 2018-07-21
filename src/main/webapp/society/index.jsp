<!--@author 黄健勇-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="controller.tools.user.ViewSocietyTool" %>
<%@ page import="model.entity.Activity" %>
<%@ page import="model.relation.SocietyOrganizeActivity" %>
<%@ page import="model.relation.UserJoinSociety" %>
<%@ page import="model.relation.UserManageSociety" %>
<%@ page import="util.function.Pages" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/10
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>社团首页</title>
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
    <jsp:useBean id="society" type="model.entity.Society" scope="session" />

    <script src="./css/new/jquery.js"></script>
    <c:forEach var="member" items="${society.joinUsers}">
        <script type="text/javascript">
            $(function(){
                $(".${member.userId}").click(function(){
                    $(".${member.user.userName}").show();
                    if(".${member.user.userName}"!=document.lastShow)
                        $(document.lastShow).hide();
                    document.lastShow=".${member.user.userName}";
                })
            })
        </script>
    </c:forEach>
</head>
<body>
<jsp:useBean id="alert" type="java.lang.String" scope="session"/>
${alert}
<%session.setAttribute("alert","");%>
<jsp:useBean id="user" type="model.entity.User" scope="session" />

<!--start-header-->
<div id="page-wrapper">

    <!-- Header -->
    <header id="header" >
        <h1><a href="<%=Pages.USER_MAIN_PAGE%>"><b>首页</b></a>
            &nbsp;&nbsp;&nbsp;<a href="<%=Pages.SOCIETY_MALL_PAGE%>"><b>社团广场</b></a>
            &nbsp;&nbsp;&nbsp;<a href="<%=Pages.ACTIVITY_CENTER_PAGE%>"><b>活动中心</b></a>
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
<style>
    .banner{
    <c:if test="${society.isPictureExist}">
        background: url("../SocietyFiles/${society.societyId}/${society.societyId}.jpg") no-repeat;
    </c:if>
    <c:if test="${!society.isPictureExist}">
        background: url("./images/banner.jpg") no-repeat;
    </c:if>
        background-size:cover;
        -webkit-background-size:cover;
        -moz-background-size:cover;
        -o-background-size:cover;
        -ms-background-size:cover;
        min-height:680px;
    }
</style>
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
<!--start-welcome-->
<div class="welcome">
    <div class="container">
        <div class="welcome-top">
            <div class="col-md-6 welcome-left">
                <h3>社团简介</h3>
                <h4>${society.description}</h4>
            </div>
            <div class="col-md-6 news-right">
                <div class="news-heading">
                    <h3>最新活动</h3>
                </div>
                <%
                    List<Activity> activities=new ArrayList<>();
                    int i=0;
                    for (SocietyOrganizeActivity soa:society.getOrganizeActivities()) {
                        activities.add(soa.getActivity());
                        i++;
                        if(i>=3)break;
                    }
                    request.setAttribute("activities",activities);
                %>
                <c:forEach var="activity" items="${activities}">
                    <div style="border: 2px solid #00E0F2">
                        <center>
                        <h3>${activity.activityName}</h3>
                        <c:if test="${activity.isComming==true}">
                            <h4>即将开始</h4>
                        </c:if>
                        <c:if test="${activity.isRunning==true}">
                            <h4>正在进行</h4>
                        </c:if>
                        <c:if test="${activity.isOver==true}">
                            <h4>已经结束</h4>
                        </c:if>
                        <div class="w-btn">
                            <a href="/view.Activity?activityId=${activity.activityId}" class="hvr-shutter-out-horizontal">了解更多</a>
                        </div>
                        </center>
                    </div>
                    <br/>
                </c:forEach>
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
                <h4>创建时间</h4>
                <p>${society.foundDate.split(" ")[0]}</p>
            </div>
            <div class="col-md-3 join-left">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                <h4>创始人</h4>
                <p>${society.founder}</p>
            </div>
            <div class="col-md-3 join-left">
                <span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
                <h4>学校</h4>
                <p>${society.schoolName}</p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--end-join-->


<!--start-teacher-->
<div class="teacher">
    <div class="container">
        <div class="teacher-top">
            <h3>社团成员</h3>
        </div>
        <div class="teacher-main">
            <c:forEach var="member" items="${society.joinUsers}">
                <c:if test="${member.status==1}">
                    <div class="teacher-left">
                        <input type="button" class="${member.userId}" value="${member.user.nickName}"/>
                        <div class="${member.user.userName}" style="display:none;
                     background-color: rgba(10, 10, 10, 0.23);width: 300px">
                            昵称：${member.user.nickName}<br/>
                            学校：${member.user.schoolName}<br/>
                            简介：${member.user.description}<br/>${member.user.init()}
                            加入社团：
                            <form action="/view.Society">
                                <div style="">
                                    <c:forEach var="ujs" items="${member.user.joinSocieties}">
                                        <c:if test="${ujs.status==1}">
                                            <input type="submit" value="${ujs.society.societyName}" name="societyName">
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </form>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
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
