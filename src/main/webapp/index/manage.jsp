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
                                <form method="post" action="#">
                                    <div class="12u$" class="row uniform">
                                        <ul class="actions">
                                            <li><input type="submit" style="width:300px;height:80px;" value="${society.society.societyName}" /></li>
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

                    <hr />
                    <header>
                        <h4>XXXXX</h4>
                        <p>XXXXX  XXXXX  XXXX </p>

                    </header>
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
