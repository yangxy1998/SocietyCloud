<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.relation.UserManageSociety" %>
<%@ page import="util.function.Pages" %>
<%@ page import="model.Managers" %>
<%@ page import="java.util.List" %>
<%@ page import="model.relation.UserCommentSociety" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="util.function.Creator" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/13
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>社团评论</title>
    <jsp:useBean id="society" type="model.entity.Society" scope="session" />
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
    <c:forEach var="comment" items="${society.commentUsers}">
        <script type="text/javascript">
            <%--$(function(){--%>
            <%--$("#${member.userId}").click(function()--%>
            <%--{--%>
            <%--$("#${member.user.nickName}").show();--%>
            <%--});--%>
            <%--});--%>
            $(function(){
                $(".${comment.userId}").click(function(){
                    $(".${comment.user.userName}").show();
                    if(".${comment.user.userName}"!=document.lastShow)
                        $(document.lastShow).hide();
                    document.lastShow=".${comment.user.userName}";
                })
            })
        </script>
    </c:forEach>
    <!--start-smoth-scrolling-->
</head>
<body>

<article id="main">
    <header>
        <h2>社团评论</h2>
    </header>
</article>

<jsp:useBean id="alert" type="java.lang.String" scope="session"/>
${alert}
<%session.setAttribute("alert","");%>
<jsp:useBean id="user" type="model.entity.User" scope="session" />
<!--start-header-->
<div id="page-wrapper">

    <!-- Header -->
    <header id="header" >
        <h1><a href="<%=Pages.USER_MAIN_PAGE%>"><b>首页</b></a>
            &nbsp;&nbsp;&nbsp;<a href="<%=Pages.SOCIETY_MALL_PAGE%>"><b>社团广场</b></a>
            &nbsp;&nbsp;&nbsp;<a href="<%=Pages.ACTIVITY_CENTER_PAGE%>"><b>活动中心</b></a>
            &nbsp;&nbsp;&nbsp;<a href="<%=Pages.SOCIETY_MAIN_PAGE%>"><b>社团首页</b></a>
            &nbsp;&nbsp;&nbsp;<a href="<%=Pages.SOCIETY_COMMENT_PAGE%>"><b>社团评论</b></a>
            &nbsp;&nbsp;&nbsp;<a href="<%=Pages.SOCIETY_ACTIVITY_PAGE%>"><b>社团活动</b></a>
            <%
                for (UserManageSociety ums:society.getManageUsers()) {
                    if(ums.getUserId().equals(user.getUserId())){
                        out.println("&nbsp;&nbsp;&nbsp;<a href=\""+Pages.SOCIETY_MANAGE_PAGE+"\"><b>管理社团</b></a>");
                        out.println("&nbsp;&nbsp;&nbsp;<a href=\""+Pages.SOCIETY_LOG_PAGE+"\"><b>社团日志</b></a>");
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



<%
    List<UserCommentSociety> comments=society.getCommentUsers();
    if(comments==null)comments=new ArrayList<>();
    request.setAttribute("comments", comments);
%>




<div class="welcome">
    <div class="container">
        <div class="welcome-top">
            <div class="col-md-6 welcome-left">
                <c:forEach var="comment" items="${comments}">
                    <c:if test="${comments.size()<1}">
                        <br/>还没有人评论这个社团~
                    </c:if>
                    <c:if test="${comment.visible==1}">
                        <br/>
                        <p>
                            <font color="#ff4500" size="5">TOP<br/>${comment.user.nickName}
                            <br/>于${comment.commentDate}评论：</font></p>
                        <%request.setAttribute("creator",new Creator());%>
                        <div style="width: 1000px;border: 2px solid black;border-radius:10px;
                        background-color: rgba(${creator.createRandomNumber(100)},${creator.createRandomNumber(100)}
                                ,${creator.createRandomNumber(100)},0.23)" >
                            <p><font color="black" size="5">${comment.comment}</font></p>
                            <br>
                        </div>
                    </c:if>
                </c:forEach>

            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<div class="join">
    <div class="container">
        <div class="join-main">


            <c:forEach var="comment" items="${comments}">
                <c:if test="${comment.visible==0}">
                    <br/>
                    <p><font color="black">
                        ${comment.user.nickName}
                        <br/>
                        于${comment.commentDate}评论：</font></p>
                    <div style="width: 1000px;border: 2px solid black;border-radius:10px;
                            background-color: rgba(${creator.createRandomNumber(100)},${creator.createRandomNumber(100)}
                            ,${creator.createRandomNumber(100)},0.23)" >
                        <p><font color="black">${comment.comment}</font></p>
                        <br>
                    </div>
                </c:if>
            </c:forEach>



            <div class="clearfix"></div>
        </div>
    </div>
</div>



<br/>
<br/>
<center>
<form method="post" action="../user.Comment">
    <input type="text" name="comment" placeholder="您可以在这里输入您的评论：字数不超过500字。">
    <input type="submit" value="评论">
</form>
</center>
<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>

</body>
</html>
