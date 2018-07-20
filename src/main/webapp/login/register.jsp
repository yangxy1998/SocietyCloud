<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/10
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="util.function.Pages" %>
<html>
<head>

    <title>注册</title>


    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>


    <link rel="stylesheet" href="./css/register-style.css" type="text/css" media="all">



</head>

<body>
<jsp:useBean id="alert" type="java.lang.String" scope="session"/>
${alert}
<%session.setAttribute("alert","");%>
<h1>社团云</h1>

<div class="container w3layouts agileits">

    <div class="login w3layouts agileits">
        <h2>注 册</h2>
        <form action="../register" method="post">
            <input type="text" Name="username" placeholder="用户名"    required="">
            <input type="password" Name="password" placeholder="密码" required="">
            <input type="password" Name="confirmPassword" placeholder="确认密码" required="">
            <input type="text" Name="phoneNum" placeholder="手机号码"required="">
            <div class="send-button w3layouts agileits">
                <input type="submit" value="注册">
            </div>
        </form>
    </div>
    <a href="<%=Pages.USER_LOGIN_PAGE%>" ><font size="2" color="lightblue">直接登录</font></a>





    <div class="clear"></div>

</div>



</body>
</html>
