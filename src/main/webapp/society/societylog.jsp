<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.relation.UserCommentSociety" %>
<%@ page import="model.relation.UserManageSociety" %>
<%@ page import="util.function.Pages" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Managers" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/14
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>社团日志</title>
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
</head>
<body>
<jsp:useBean id="alert" type="java.lang.String" scope="session"/>
${alert}
<%session.setAttribute("alert","");%>
<jsp:useBean id="user" type="model.entity.User" scope="session" />
<jsp:useBean id="society" type="model.entity.Society" scope="session" />
<!--start-header-->
<div id="page-wrapper">

    <!-- Header -->
    <header id="header" >
        <h1><a href="<%=Pages.USER_MAIN_PAGE%>"><b>首页</b></a>
            &nbsp;&nbsp;&nbsp;<a href="<%=Pages.SOCIETY_MALL_PAGE%>"><b>社团广场</b></a>
            &nbsp;&nbsp;&nbsp;<a href="<%=Pages.SOCIETY_MAIN_PAGE%>"><b>社团首页</b></a>
            &nbsp;&nbsp;&nbsp;<a href="<%=Pages.SOCIETY_COMMENT_PAGE%>"><b>社团评论</b></a>
            &nbsp;&nbsp;&nbsp;<a href="<%=Pages.SOCIETY_ACTIVITY_PAGE%>"><b>社团活动</b></a>
            <%
                for (UserManageSociety ums:society.getManageUsers()) {
                    if(ums.getUserId().equals(user.getUserId())){
                        out.println("&nbsp;&nbsp;&nbsp;<a href=\""+Pages.SOCIETY_MANAGE_PAGE+"\"><b>管理社团</b></a>");
                        out.println("&nbsp;&nbsp;&nbsp;<a href=\""+Pages.SOCIETY_LOG_PAGE+"\"><b>社团日志</b></a>");
                        request.setAttribute("priority",ums.getPriority());
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
<br/><br/>
<c:if test="${priority>2}">
    <form action="/note" method="post">
        <input type="text" name="societyNote" placeholder="您可以在这里手动输入一条社团笔记。">
        <input type="submit" value="提交笔记">
    </form>
</c:if>
<%
    request.setAttribute("logs", Managers.LogManager.getSocietyLogs(society.getSocietyName()));
%>
<table>
    <tr>
        <th>时间</th>
        <th>内容</th>
    </tr>
    <c:forEach var="log" items="${logs}">
        <tr>
            <td>${log.time}</td>
            <td>${log.log}</td>
        </tr>
    </c:forEach>
</table>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>

</body>
</html>
