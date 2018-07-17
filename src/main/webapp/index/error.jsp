<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.function.Creator" %>
<%@ page import="util.function.Pages" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/16
  Time: 19:29
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
<body>
<header id="header">
    <jsp:useBean id="user" class="model.entity.User" scope="session" />
    <%
        request.setAttribute("schools", Creator.getSchools());
    %>
    <jsp:useBean id="schools" type="java.util.List<java.lang.String>" scope="request"/>
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
<article id="main">
    <header>
        <h2>出错啦！</h2>
        <p>An Error Occurred!</p>
    </header>
</article>
</body>
</html>
