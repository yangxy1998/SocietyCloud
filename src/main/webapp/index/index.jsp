<!--@author 黄健勇-->
<!--@author 万培林-->
<!--@author 林志宸-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.function.Pages" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/5
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>活动+平台</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../index/assets/css/main.css" />

</head>

<body class="landing">

<!-- Page Wrapper -->
<div id="page-wrapper">

    <!-- Header -->
    <header id="header" class="alt">
        <jsp:useBean id="user" class="model.entity.User" scope="session" />
        <% session.setAttribute("alert","");%>
        <h1>
            <a href="<%=Pages.USER_MAIN_PAGE%>"><b>首页</b></a>
            <a href="<%=Pages.SOCIETY_MALL_PAGE%>"><b>社团广场</b></a>
            <a href="<%=Pages.ACTIVITY_CENTER_PAGE%>"><b>活动中心</b></a>
        </h1>
        <nav id="nav">
            <ul>
                <li class="special">
                    <a href="#menu" class="menuToggle"><span><b>${user.nickName}  菜单</b></span></a>
                    <div id="menu">
                        <ul>
                            <li>${user.nickName}</li>
                            <a href="<%=Pages.USER_MAIN_PAGE%>"><b>首页</b></a>
                            <c:if test="${user.userName==null}">
                                <li><a href="<%=Pages.USER_LOGIN_PAGE%>">登录</a></li>
                                <li><a href="<%=Pages.USER_REGISTER_PAGE%>">注册</a></li>
                            </c:if>
                            <c:if test="${user.userName!=null}">
                                <li><a href="<%=Pages.USER_MANAGE_SOCIETY_PAGE%>">我的组织</a></li>
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

    <!-- Banner -->
    <section id="banner">
        <div class="inner">
            <h2>活动+</h2>
            <p>欢迎您来到活动+<br />
            <p>Welcome to Activity Plus<br />
                <c:if test="${user.userName!=null}">
                用户名：${user.userName}<br />
                昵称：${user.nickName}
                </c:if>
        </div>
        <a href="#one" class="more scrolly">查看更多</a>
    </section>

    <!-- One -->
    <section id="one" class="wrapper style1 special">
        <div class="inner" >
            <header class="major">
                <h2>活动+介绍<br />
                    一个让你安心的活动管理平台</h2>
            </header>
            <ul class="icons major">
                <li><span class="icon fa-diamond major style1"><span class="label">Lorem</span></span></li>
                <li><span class="icon fa-heart-o major style2"><span class="label">Ipsum</span></span></li>
                <li><span class="icon fa-code major style3"><span class="label">Dolor</span></span></li>
            </ul>
        </div>
    </section>

    <!-- Two -->
    <section id="two" class="wrapper alt style2">
        <section class="spotlight">
            <div class="image"><img src="../index/images/3.png" alt="" /></div><div style="background-color: #21b2a6;" class="content">
            <h2>全面省心管理，校园身边事不再错过</h2>
            <p>可视化全面查看社团组织运作情况、活动举办情况、同学参与情况；
                校园身边事一手掌握，从此活动、信息不再错过。</p>
        </div>
        </section>
        <section class="spotlight">
            <div class="image"><img src="../index/images/4.png" alt="" /></div><div style="background-color: #4296c5;" class="content">
            <h2>社团组织资讯助飞，校外活动精彩纷呈</h2>
            <p>丰富的社团资讯，全国社团情况、活动趋势一看便知；
                精彩的校外活动助力个人充分利用课余时间，实现全面成长！</p>
        </div>
        </section>
        <section class="spotlight">
            <div class="image"><img src="../index/images/2.png" alt="" /></div><div style="background-color: #d08a8cb3;"     class="content">
            <h2>社团组织交流，关系网多点开花</h2>
            <p>线上线下社团活动，助你认识给多的人；
                同校、同地、同一个世界，    天下谁人不识君！</p>
        </div>
        </section>
    </section>

    <!-- Three -->
    <section id="three" class="wrapper style3 special">
        <div class="inner">
            <header class="major">
                <h2>主要功能</h2>
            </header>
            <ul class="features">
                <li class="icon fa-paper-plane-o">
                    <h3>新建组织</h3>
                    <p>新建一个社团组织,开启一个全新的世界。</p>
                </li>
                <li class="icon fa-laptop">
                    <h3>管理组织</h3>
                    <p></p>
                </li>
                <li class="icon fa-code">
                    <h3>查看组织最新消息</h3>
                    <p>获得组织最新活动信息</p>
                </li>
                <li class="icon fa-headphones">
                    <h3>组织</h3>

                </li>
                <li class="icon fa-heart-o">
                    <h3>关于</h3>
                </li>
                <li class="icon fa-flag-o">
                    <h3>反馈</h3>
                    <p>你可以在这里告诉我们你的不满和建议</p>
                </li>
            </ul>
        </div>
    </section>

</div>

<!-- Scripts -->
<script src="../index/assets/js/jquery.min.js"></script>
<script src="../index/assets/js/jquery.scrollex.min.js"></script>
<script src="../index/assets/js/jquery.scrolly.min.js"></script>
<script src="../index/assets/js/skel.min.js"></script>
<script src="../index/assets/js/util.js"></script>
<script src="../index/assets/js/main.js"></script>

</body>
</html>
