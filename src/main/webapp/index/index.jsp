<!--@author 黄健勇-->
<!--@author 万培林-->
<!--@author 林志宸-->
<%@ page import="model.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/5
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>社团云平台</title>
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
        <h1><a href="../index/index.jsp"><b>首页</b></a></h1>
        <nav id="nav">
            <ul>
                <li class="special">
                    <a href="#menu" class="menuToggle"><span><b>菜单</b></span></a>
                    <div id="menu">
                        <ul>
                            <li><a href="../index/index.jsp">主页</a></li>
                            <li><a href="../index/generic.html">管理社团</a></li>
                            <li><a href="../index/elements.html">查看社团</a></li>
                            <li><a href="../login/login.jsp">登录</a></li>
                            <% session.setAttribute("alert","");%>
                            <li><a href="../register/register.jsp">注册</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
    </header>

    <!-- Banner -->
    <section id="banner">
        <div class="inner">
            <h2>社团云</h2>
            <p>欢迎您来到社团云<br />
                ${user.userName}<br />
                ${user.nickName}
        </div>
        <a href="#one" class="more scrolly">查看更多</a>
    </section>

    <!-- One -->
    <section id="one" class="wrapper style1 special">
        <div class="inner">
            <header class="major">
                <h2>社团云介绍<br />
                    一个让你安心的管理平台</h2>
                <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX<br />
                    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
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
            <div class="image"><img src="../index/images/01.jpg" alt="" /></div><div class="content">
            <h2>XXXXXXXXXXXXXXXXXXXXXXXXXXXXX<br />
               XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</h2>
            <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
        </div>
        </section>
        <section class="spotlight">
            <div class="image"><img src="../index/images/02.jpg" alt="" /></div><div class="content">
            <h2>XXXXXXXXXXXXXXXXXXXXXXX<br />
                XXXXXXXXXXXXXXXXXXXXXXXX</h2>
            <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
        </div>
        </section>
        <section class="spotlight">
            <div class="image"><img src="../index/images/03.jpg" alt="" /></div><div class="content">
            <h2>XXXXXXXXXXXXXXXXXXXXXXXXXXX<br />
                XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</h2>
            <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
        </div>
        </section>
    </section>

    <!-- Three -->
    <section id="three" class="wrapper style3 special">
        <div class="inner">
            <header class="major">
                <h2>主要功能</h2>
                <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX<br />
                    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
            </header>
            <ul class="features">
                <li class="icon fa-paper-plane-o">
                    <h3>新建社团</h3>
                    <p>新建一个社团,XXXXXXXXX</p>
                </li>
                <li class="icon fa-laptop">
                    <h3>管理社团</h3>
                    <p>管理您的社团,XXXXXXXXXXXXXXXXXXXXXXX</p>
                </li>
                <li class="icon fa-code">
                    <h3>查看社团最新消息</h3>
                    <p>获得社团最新活动信息</p>
                </li>
                <li class="icon fa-headphones">
                    <h3>社团</h3>
                    <p>社团XXXXXXXXXXXXXXXXX</p>
                </li>
                <li class="icon fa-heart-o">
                    <h3>关于</h3>
                    <p>本网站XXXXXXXXXXXXXXXXXXXXXX</p>
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
