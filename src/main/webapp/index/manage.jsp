<%@ page import="util.function.Pages" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/10
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>社团云平台</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--[if lte IE 8]><script src="./assets/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="./assets/css/main.css" />
    <!--[if lte IE 8]><link rel="stylesheet" href="./assets/css/ie8.css" /><![endif]-->
    <!--[if lte IE 9]><link rel="stylesheet" href="./assets/css/ie9.css" /><![endif]-->
</head>
<body>

<!-- Page Wrapper -->
<div id="page-wrapper">

    <!-- Header -->
    <header id="header">
        <jsp:useBean id="user" class="model.entity.User" scope="session" />
        <h1>
            <a href="<%=Pages.USER_MAIN_PAGE%>"><b>首页</b></a>
            <a href="<%=Pages.SOCIETY_MALL_PAGE%>"><b>社团广场</b></a>
            <a href=""><b>活动中心</b></a>
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
                                <li><a href="<%=Pages.USER_JOINED_SOCIETY_PAGE%>">查看社团</a></li>
                                <li><a href="<%=Pages.USER_MANAGE_SOCIETY_PAGE%>">管理社团</a></li>
                                <li><a href="<%=Pages.USER_PERSONAL_CENTER_PAGE%>">个人中心</a></li>
                                <li><a href="<%=Pages.USER_LOGIN_PAGE%>">退出登录</a> </li>
                            </c:if>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
    </header>

    <!-- Main -->
    <article id="main">
        <header>
            <h2>管理社团</h2>
            <p>Community Manage</p>
        </header>
        <section class="wrapper style5">
            <div class="inner">

                <section>
                    <c:if test="${user.manageSocieties.size()>=1}">
                        <h4>可管理社团:</h4>
                        <blockquote>
                            <c:forEach var="society" items="${user.manageSocieties}">
                                <form action="/manage.Society">
                                    <div class="12u$" class="row uniform">
                                        <ul class="actions">
                                            <li>
                                                <input type="submit" name="societyName" style="width:300px;height:80px;" value="${society.society.societyName}" />
                                                权限：
                                                <c:if test="${society.priority==0}">无权限</c:if>
                                                <c:if test="${society.priority==1}">社团委员</c:if>
                                                <c:if test="${society.priority==2}">社团秘书</c:if>
                                                <c:if test="${society.priority==3}">社团发言人</c:if>
                                                <c:if test="${society.priority==4}">社团总管理</c:if>
                                                <c:if test="${society.priority==5}">社团拥有者</c:if>
                                            </li>
                                        </ul>
                                    </div>
                                </form>
                            </c:forEach>
                        </blockquote>
                    </c:if>
                    <c:if test="${user.manageSocieties.size()<1}">
                        <blockquote>
                            <h3>你并没有参加过社团哦~</h3>
                        </blockquote>
                    </c:if>

                    <blockquote>
                        <h3>您现在可以<a href="../user.Found">创建一个社团</a>或者<a href="/view.Mall">加入一个社团</a> 。 </h3>
                    </blockquote>
                    <hr />
                    <hr />

                </section>



            </div>
        </section>
    </article>

    <!-- Footer -->


</div>

<!-- Scripts -->
<script src="./assets/js/jquery.min.js"></script>
<script src="./assets/js/jquery.scrollex.min.js"></script>
<script src="./assets/js/jquery.scrolly.min.js"></script>
<script src="./assets/js/skel.min.js"></script>
<script src="./assets/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="./assets/js/main.js"></script>

</body>
</html>
