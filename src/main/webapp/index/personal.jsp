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
    <title>社团Cloud</title>
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
        <h1><a href="./index.jsp"><b>首页</b></a></h1>
        <nav id="nav">
            <ul>
                <li class="special">
                    <a href="#menu" class="menuToggle"><span><b>菜单</b></span></a>
                    <div id="menu">
                        <ul>
                            <li><a href="../index/index.jsp">主页</a></li>
                            <c:if test="${user.userName==null}">
                                <li><a href="../login/login.jsp">登录</a></li>
                                <li><a href="../login/register.jsp">注册</a></li>
                            </c:if>
                            <c:if test="${user.userName!=null}">
                                <li><a href="../index/view.jsp">查看社团</a></li>
                                <li><a href="../index/manage.jsp">管理社团</a></li>
                                <li><a href="../index/personal.jsp">个人中心</a></li>
                                <li><a href="../index/index.jsp">退出登录</a> </li>
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
                        <h3>学校名：<input type="text" name="schoolName" value="${user.schoolName}"></h3>
                        <h3>学工号：<input type="text" name="academicNum" value="${user.academicNum}"></h3>
                        <h3>证件号：<input type="text" name="idCard" value="${user.idCard}"></h3>
                        <h3>用户状态：${user.status==0?"正常":"冻结"}</h3>
                        <h3>用户简介：<input type="text" name="description" value="${user.description}"></h3>
                        <input type="submit" value="提交信息">
                    </form>
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
