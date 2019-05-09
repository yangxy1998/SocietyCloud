<!--@author 黄健勇-->
<!--@author 万培林-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.function.Pages" %>
<%@ page import="util.function.Creator" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/11
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>活动+平台</title>
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
                        <h3>社团名：<input type="text" name="societyName" placeholder="社团名，不多于64个字节。"></h3>
                        <h3>社团学校：
                            <select name="schoolName" size="1">
                                <c:forEach var="school" items="${schools}">
                                    <option value="${school}">${school}</option>
                                </c:forEach>
                            </select>
                        </h3>
                        <h3>主分类：
                            <select id="mainType" name="mainType" size="1" onchange="change()">
                                <option value="实践类">实践类</option>
                                <option value="学术类">学术类</option>
                                <option value="体育类">体育类</option>
                                <option value="艺术类">艺术类</option>
                                <option value="其他类">其他类</option>
                            </select>
                        </h3>
                        <script language="JavaScript">
                            function change(){
                                var mainType=document.getElementById("mainType");
                                var subType=document.getElementById("subType");
                                subType.options.length=0;
                                if(mainType.selectedIndex==0){
                                    subType.options.add(new Option("学生会"));
                                    subType.options.add(new Option("创新类"));
                                    subType.options.add(new Option("志愿者"));
                                }
                                else if(mainType.selectedIndex==1){
                                    subType.options.add(new Option("物理类"));
                                    subType.options.add(new Option("化学类"));
                                    subType.options.add(new Option("生物类"));
                                    subType.options.add(new Option("文学类"));
                                    subType.options.add(new Option("计算机类"));
                                }
                                else if(mainType.selectedIndex==2){
                                    subType.options.add(new Option("足球类"));
                                    subType.options.add(new Option("篮球类"));
                                    subType.options.add(new Option("排球类"));
                                    subType.options.add(new Option("电竞类"));
                                }
                                else if(mainType.selectedIndex==3){
                                    subType.options.add(new Option("美术类"));
                                    subType.options.add(new Option("影视类"));
                                    subType.options.add(new Option("歌舞类"));
                                }
                                else if(mainType.selectedIndex==4){
                                    subType.options.add(new Option("无"));
                                }
                            }
                        </script>
                        <h3>次级分类：
                            <select id="subType" name="subType" size="1">
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

