<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.function.Pages" %>
<%@ page import="util.function.Creator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/11
  Time: 15:07
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
        <%
            request.setAttribute("schools", Creator.getSchools());
            request.setAttribute("mainTypes",Creator.getMainTypes());
            request.setAttribute("subTypes",new ArrayList<>());
        %>
        <jsp:useBean id="schools" type="java.util.List<java.lang.String>" scope="request"/>
        <jsp:useBean id="mainTypes" type="java.util.List<java.lang.String>" scope="request"/>
        <h1><a href="./index.jsp"><b>首页</b></a></h1>
        <nav id="nav">
            <ul>
                <li class="special">
                    <a href="#menu" class="menuToggle"><span><b>菜单</b></span></a>
                    <div id="menu">
                        <ul>
                            <li><a href="../index/index.jsp">主页</a></li>
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
            <h2>创建社团</h2>
            <p>Found A Society</p>
        </header>
        <section class="wrapper style5">
            <div class="inner">
                <section>
                    <form method="post" action="../user.Found">
                        <br>
                        <h3>社团名：<input type="text" name="societyName" placeholder="社团名"></h3>
                        <h3>社团学校：
                            <select name="schoolName" size="1">
                                <c:forEach var="school" items="${schools}">
                                    <option value="${school}">${school}</option>
                                </c:forEach>
                            </select>
                        </h3>
                        <h3>主分类：
                            <select name="mainType" size="1">
                                <c:forEach var="mainType" items="${mainTypes}">
                                    <option value="${mainType}">${mainType}</option>
                                </c:forEach>
                            </select>
                        </h3>
                        <%
                            if(request.getParameter("mainType")!=null){
                                request.setAttribute("subTypes",Creator.getSubTypes(request.getParameter("mainType")));
                            }
                            else {
                                ((List<String>)request.getAttribute("subTypes")).add("");
                            }
                        %>
                        <jsp:useBean id="subTypes" type="java.util.List<java.lang.String>" scope="request"/>
                        <h3>次级分类：
                            <select name="subType" size="1">
                                <c:forEach var="subType" items="${subTypes}">
                                    <option value="${subType}">${subType}</option>
                                </c:forEach>
                            </select>
                        </h3>
                        <h3>创建时间：<input type="text" name="foundTime" value="<%=Creator.getTime()%>"></h3>
                        <h3>创始人：<input type="text" name="founder" value="${user.realName}"></h3>
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

