<%@ page import="util.function.Creator" %>
<%@ page import="util.function.Pages" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/10
  Time: 19:27
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
<jsp:useBean id="alert" type="java.lang.String" scope="session"/>
${alert}
<%session.setAttribute("alert","");%>
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

    <!-- Main -->
    <article id="main">
        <header>
            <h2>个人中心</h2>
            <p>Personal Center</p>
        </header>
        <%
            request.setAttribute("schools", Creator.getSchools());
        %>
        <jsp:useBean id="schools" type="java.util.List<java.lang.String>" scope="request"/>
        <section class="wrapper style5">
            <div class="inner">

                <section>
                    <form method="post" action="../user.Personal">
                        <br>
                        <h3>用户ID：${user.userId}</h3>
                        <h3>用户名：${user.userName}</h3>
                        <h3>电话号码：<input type="text" name="phoneNum" value="${user.phoneNum}"></h3>
                        <h3>用户昵称：<input type="text" name="nickName" value="${user.nickName}"></h3>
                        <h3>真实姓名：<input type="text" name="realName" value="${user.realName}"></h3>
                        <h3>学校名：
                            <select name="schoolName" size="1">
                            <c:forEach var="school" items="${schools}">
                                <option value="${school}">${school}</option>
                            </c:forEach>
                            </select>
                        </h3>
                        <h3>学工号：<input type="text" name="academicNum" value="${user.academicNum}"></h3>
                        <h3>证件号：<input type="text" name="idCard" value="${user.idCard}"></h3>
                        <h3>用户状态：${user.status==0?"正常":"冻结"}</h3>
                        <h3>用户简介：<input type="text" name="description" value="${user.description}"></h3>
                        <input type="submit" value="提交信息">
                    </form>

                    <h3><a href="<%=Pages.USER_LOG_PAGE%>">您可以在这里查看您的用户日志。</a> </h3>
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
