<%@ page import="model.entity.User" %>
<%@ page import="util.function.Pages" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/10
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>登录表单</title>


    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>


    <link rel="stylesheet" href="./css/login-style.css" type="text/css" media="all">



</head>




<body>
<jsp:useBean id="alert" type="java.lang.String" scope="session"/>
${alert}
<%session.setAttribute("alert","");%>
<h1>社团Cloud</h1>

<div class="container w3layouts agileits">

    <div class="login w3layouts agileits">
        <h2>登 录</h2>
        <form action="../login" method="post">
            <input type="text" Name="username" placeholder="用户名" required="">
            <input type="password" Name="password" placeholder="密码" required="">
            <ul class="tick w3layouts agileits">
                <li>
                    <input type="checkbox" id="brand1" value="">
                    <label for="brand1"><span></span>记住我</label>
                </li>
            </ul>
            <div class="send-button w3layouts agileits">
                <input type="submit" value="立 即 登 录">
            </div>
        </form>
        <a href="<%=Pages.USER_REGISTER_PAGE%>" ><font size="3" color="lightblue">注册</font></a>
        <div class="social-icons w3layouts agileits">
            <p>- 其他方式登录 -</p>
            <ul>

                <li class="weixin w3ls"><a href="#">
                    <span class="icons w3layouts"></span>
                    <span class="text w3layouts agileits">微信</span></a></li>

            </ul>
        </div>
        <div class="clear"></div>
    </div>



    <div class="clear"></div>

</div>



</body>

</html>
