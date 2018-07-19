<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.relation.UserManageSociety" %>
<%@ page import="util.function.Creator" %>
<%@ page import="util.function.Pages" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/13
  Time: 13:55
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
    <!--start-smoth-scrolling-->
</head>
<body>
<jsp:useBean id="alert" type="java.lang.String" scope="session"/>
${alert}
<%session.setAttribute("alert","");%>
<jsp:useBean id="user" type="model.entity.User" scope="session" />
<jsp:useBean id="activity" type="model.entity.Activity" scope="session" />
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
<!--end-header-->
<!-- Main -->
<article id="main">
    <header>
        <h2>修改活动信息</h2>
        <p>Modify Activity Infomation</p>
    </header>
    <center>
        <form method="post" action="../manage.Activity">
            活动名：<input type="text" name="activityName" value="${activity.activityName}">
            <br>
            活动类型：
            <select name="activityType">
                <%request.setAttribute("types",Creator.getActivityTypes());%>
                <c:forEach var="type" items="${types}">
                    <c:if test="${type.equals(activity.activityType)}">
                        <option value="${type}" selected="selected">${type}</option>
                    </c:if>
                    <c:if test="${!type.equals(activity.activityType)}">
                        <option value="${type}">${type}</option>
                    </c:if>
                </c:forEach>
            </select>
            <br>
            主办方：<input type="text" name="organizer" value="${activity.organizer}">
            <br>
            开始时间：<input type="text" name="beginTime" value="${activity.beginTime}">
            <br>
            结束时间：<input type="text" name="endTime" value="${activity.endTime}">
            <br>
            活动地址：<input type="text" name="address" value="${activity.address}">
            <br>
            人员限制：
            <select name="limit">
                <%request.setAttribute("limits",Creator.getActivityLimits());%>
                <c:forEach var="limit" items="${limits}">
                    <c:if test="${limit.equals(activity.limit)}">
                        <option value="${limit}" selected="selected">${limit}</option>
                    </c:if>
                    <c:if test="${!limit.equals(activity.limit)}">
                        <option value="${limit}">${limit}</option>
                    </c:if>
                </c:forEach>
            </select>
            <br>
            活动简介：<input type="text" name="description" value="${activity.description}">
            <br>
            <input type="submit" value="提交修改">
        </form>
        <br>
        <br>
        社团图片上传：
        <form id="form" method="post" action="/upload?type=activity" enctype="multipart/form-data" >
            <input type="submit" value="上传图片" />
            选择文件:
            <input type="file" name="uploadFile" />
        </form>
    </center>
    <!--start-footer-->
    <div class="footer">
        <%--<div class="container">--%>
        <%--<div class="footer-main">--%>
        <%--<div class="col-md-4 footer-left">--%>
        <%--<span class="glyphicon glyphicon-map-marker map-marker" aria-hidden="true"></span>--%>
        <%--<p>武汉 <span>洪山区</span> 国软</p>--%>
        <%--</div>--%>
        <%--<div class="col-md-4 footer-left">--%>
        <%--<span class="glyphicon glyphicon-phone map-marker" aria-hidden="true"></span>--%>
        <%--<p>13163292915 <span>13163292915</span> </p>--%>
        <%--</div>--%>

        <%--<div class="clearfix"></div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <script type="text/javascript">
            $(document).ready(function() {
                /*
                 var defaults = {
                 containerID: 'toTop', // fading element id
                 containerHoverID: 'toTopHover', // fading element hover id
                 scrollSpeed: 1200,
                 easingType: 'linear'
                 };
                 */

                $().UItoTop({ easingType: 'easeOutQuart' });

            });
        </script>
</article>

</div>
<!--end-footer-->
<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>
