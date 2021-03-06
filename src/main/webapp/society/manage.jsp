<!--@author 万培林-->
<!--@author 林志宸-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.relation.UserManageSociety" %>
<%@ page import="util.function.Creator" %>
<%@ page import="util.function.Pages" %>
<%@ page import="java.util.List" %>
<%@ page import="model.relation.UserJoinSociety" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="controller.tools.user.ManageSocietyTool" %>
<%@ page import="model.Managers" %>
<%@ page import="controller.tools.user.ViewSocietyTool" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/13
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>社团首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Tutoring Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>



    <link href="./css/style.css" rel='stylesheet' type='text/css' />
    <link href="./css/bootstrap.css" rel='stylesheet' type='text/css' />
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
    <jsp:useBean id="society" type="model.entity.Society" scope="session" />
</head>
<body>
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
<!--start-banner-->
<%
    UserJoinSociety ujs=ViewSocietyTool.isJoinedIntoSociety(user,society);
    if(ujs!=null){
        if(ujs.getStatus()==1)session.setAttribute("joinStatus","已经加入");
        if(ujs.getStatus()==0)session.setAttribute("joinStatus","等待审批");
        if(ujs.getStatus()==-1)session.setAttribute("joinStatus","已被拒绝");
    }
    else{
        session.setAttribute("joinStatus","加入社团");
    }
%>
<style>
    .banner{
    <c:if test="${society.isPictureExist}">
        background: url("../SocietyFiles/${society.societyId}/${society.societyId}.jpg") no-repeat;
    </c:if>
    <c:if test="${!society.isPictureExist}">
        background: url("./images/banner.jpg") no-repeat;
    </c:if>
        background-size:cover;
        -webkit-background-size:cover;
        -moz-background-size:cover;
        -o-background-size:cover;
        -ms-background-size:cover;
        min-height:680px;
    }
</style>
<div class="banner">
    <div class="container">
        <section class="slider">
            <div class="flexslider">
                <ul class="slides">
                    <li>
                        <div class="banner-top">
                            <h2>-${society.societyName}-</h2>
                            <h3>-${society.mainType}-${society.subType}-</h3>
                            <div class="bnr-btn">
                                <c:if test="${!joinStatus.equals(\"加入社团\")}">
                                    <div class="hvr-shutter-out-horizontal">${joinStatus}</div>
                                </c:if>
                                <c:if test="${joinStatus.equals(\"加入社团\")}">
                                    <a href="/join.Society" class="hvr-shutter-out-horizontal">${joinStatus}</a>
                                </c:if>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
    </div>
</div>
<!--end-banner-->
<!-- Main -->
<article id="main">

<center>
    <form method="post" action="../manage.Society">
        <c:if test="${priority>4}">
            <br>
            管理社团管理员权限：
            <table style="width:1100px;height:200px;">
                <tr>
                    <th>用户昵称</th>
                    <th>当前权限</th>
                    <th>&nbsp;</th>
                </tr>
                <c:forEach var="manager" items="${society.manageUsers}">
                    <tr>
                        <td>${manager.user.nickName}</td>
                        <td>
                            <select name="priority">
                                <c:if test="${manager.priority==5}">
                                    <option value="5" selected="selected">社团拥有者</option>
                                </c:if>
                                <c:if test="${manager.priority==4}">
                                    <option value="5">社团拥有者</option>
                                    <option value="4" selected="selected">社团总管理</option>
                                    <option value="3">社团发言人</option>
                                    <option value="2">社团秘书</option>
                                    <option value="1">社团委员</option>
                                    <option value="0">无权限</option>
                                </c:if>
                                <c:if test="${manager.priority==3}">
                                    <option value="5">社团拥有者</option>
                                    <option value="4">社团总管理</option>
                                    <option value="3" selected="selected">社团发言人</option>
                                    <option value="2">社团秘书</option>
                                    <option value="1">社团委员</option>
                                    <option value="0">无权限</option>
                                </c:if>
                                <c:if test="${manager.priority==2}">
                                    <option value="5">社团拥有者</option>
                                    <option value="4">社团总管理</option>
                                    <option value="3">社团发言人</option>
                                    <option value="2" selected="selected">社团秘书</option>
                                    <option value="1">社团委员</option>
                                    <option value="0">无权限</option>
                                </c:if>
                                <c:if test="${manager.priority==1}">
                                    <option value="5">社团拥有者</option>
                                    <option value="4">社团总管理</option>
                                    <option value="3">社团发言人</option>
                                    <option value="2">社团秘书</option>
                                    <option value="1" selected="selected">社团委员</option>
                                    <option value="0">无权限</option>
                                </c:if>
                                <c:if test="${manager.priority==0}">
                                    <option value="5">社团拥有者</option>
                                    <option value="4">社团总管理</option>
                                    <option value="3">社团发言人</option>
                                    <option value="2">社团秘书</option>
                                    <option value="1">社团委员</option>
                                    <option value="0" selected="selected">无权限</option>
                                </c:if>
                            </select>
                        </td>
                        <td><input type="submit" name="changePriority->${manager.userId}" value="修改"></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <c:if test="${priority<=4}">
            <br>
            社团管理成员：
            <table>
                <tr>
                    <th>用户昵称</th>
                    <th>当前权限</th>
                </tr>
                <c:forEach var="manager" items="${society.manageUsers}">
                    <tr>
                        <td>${manager.user.nickName}</td>
                        <td>
                        权限：
                        <c:if test="${manager.priority==0}">无权限</c:if>
                        <c:if test="${manager.priority==1}">社团委员</c:if>
                        <c:if test="${manager.priority==2}">社团秘书</c:if>
                        <c:if test="${manager.priority==3}">社团发言人</c:if>
                        <c:if test="${manager.priority==4}">社团总管理</c:if>
                        <c:if test="${manager.priority==5}">社团拥有者</c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <c:if test="${priority>3}">
            <br>
            授予其他成员权限：
            <table style="width:1100px;height:200px;">
                <tr>
                    <th>用户昵称</th>
                    <th>授予权限</th>
                </tr>
                <%
                    List<UserJoinSociety> joiners=new ArrayList<>();
                    for (UserJoinSociety joiner:society.getJoinUsers()) {
                        UserManageSociety ums=ManageSocietyTool.isManager(
                                Managers.UserManager.getUserById(joiner.getUserId()),society);
                        if(ums==null)joiners.add(joiner);
                    }
                    request.setAttribute("joiners",joiners);
                %>
                <c:forEach var="joiner" items="${joiners}">
                    <c:if test="${joiner.status==1}">
                        <tr>
                            <td>${joiner.user.nickName}</td>
                            <td>
                                <select name="priority">
                                    <option value="3">社团发言人</option>
                                    <option value="2">社团秘书</option>
                                    <option value="1">社团委员</option>
                                    <option value="0" selected="selected">无权限</option>
                                </select>
                            </td>
                            <td><input type="submit" name="givePriority->${joiner.userId}" value="授权"></td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </c:if>
        <c:if test="${priority>2}">
            <br>
            修改社团基本信息：
            <h3>社团ID：${society.societyId}</h3>
            <h3>社团名：<input type="text" name="societyName" value="${society.societyName}" placeholder="社团名"></h3>
            <h3>社团学校：
                <%
                    request.setAttribute("schools",Creator.getSchools());
                %>
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
            <h3>创建时间：<input type="text" name="foundTime" value="${society.foundDate}"></h3>
            <h3>创始人：<input type="text" name="founder" value="${society.founder}"></h3>
            <h3>社团简介：
                <%--<input type="text" name="description" value="${society.description}">--%>
                <textarea name="description" style="width:1100px;height:200px;">${society.description}</textarea>

            </h3>
            <input type="submit" name="changeInformation->0" value="提交信息">
            <br>
            <br>
            <br>
            <br>
            批准用户申请：
            <table style="width:1100px;height:200px;">
                <tr>
                    <th>用户昵称</th>
                    <th>是否是社团成员</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                </tr>
                <c:forEach var="joiner" items="${society.joinUsers}">
                    <tr>
                        <td>${joiner.user.nickName}</td>
                        <c:if test="${joiner.status==1}">
                            <td>正式成员</td>
                            <td><input type="submit" name="deny->${joiner.userId}" value="踢出"></td>
                        </c:if>
                        <c:if test="${joiner.status==0}">
                            <td>等待审批</td>
                            <td><input type="submit" name="pass->${joiner.userId}" value="批准"></td>
                            <td><input type="submit" name="deny->${joiner.userId}" value="拒绝"></td>
                        </c:if>
                        <c:if test="${joiner.status==-1}">
                            <td>已被拒绝</td>
                        </c:if>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <c:if test="${priority>0}">
            <br>
            管理社团评论信息：
            <table style="width:1100px;height:200px;">
                <tr>
                    <th>用户昵称</th>
                    <th>评论时间</th>
                    <th>评论内容</th>
                    <th>可见性</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>

                </tr>
            <c:forEach var="comment" items="${society.commentUsers}">
                <tr>
                    <td>${comment.user.nickName}</td>
                    <td>${comment.commentDate}</td>
                    <td>${comment.comment}</td>
                    <td>
                        <c:if test="${comment.visible==1}">置顶</c:if>
                        <c:if test="${comment.visible==0}">正常显示</c:if>
                        <c:if test="${comment.visible==-1}">隐藏</c:if>
                    </td>
                    <td><input type="submit" name="summit->${comment.userId}<-${comment.commentDate}" value="置顶"></td>
                    <td><input type="submit" name="show->${comment.userId}<-${comment.commentDate}" value="显示"></td>
                    <td><input type="submit" name="hide->${comment.userId}<-${comment.commentDate}" value="隐藏"></td>
                </tr>
            </c:forEach>
            </table>
        </c:if>

    </form>
    <br>


    <c:if test="${priority>2}">
    社团图片上传：
    <form id="form" method="post" action="/upload" enctype="multipart/form-data" style="display:inline;"  >
        <br>
           <input type="file" name="uploadFile"  />
        <input type="submit" value="上传图片" />
    </form>
    </c:if>
</center>
<!--start-footer-->
<div class="footer">
    <script type="text/javascript">
        $(document).ready(function() {

            $().UItoTop({ easingType: 'easeOutQuart' });

        });
    </script>
</div>
</article>
<!--end-footer-->
<!-- Scripts -->
<script src="./assets/js/jquery.min.js"></script>
<script src="./assets/js/jquery.scrollex.min.js"></script>
<script src="./assets/js/jquery.scrolly.min.js"></script>
<script src="./assets/js/skel.min.js"></script>
<script src="./assets/js/util.js"></script>
<script src="./assets/js/main.js"></script>
</body>
</html>
