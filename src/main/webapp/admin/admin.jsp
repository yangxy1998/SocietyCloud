<!--@author 杨晓宇-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Managers" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/4
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>社团云管理员工具</title>
    <link rel="stylesheet" href="../admin-style.css" />
    <style type="text/css">
      table
      {
        transition:0.5s all;
        -webkit-transition:0.5s all;
        -moz-transition:0.5s all;
        -o-transition:0.5s all;
        -ms-transition:0.5s all;
        text-decoration: none;
        border-collapse: collapse;
        margin: 0 auto;
        text-align: center;
      }
      table td, table th
      {
        border: 1px solid #000000;
        color: #020101;
        height: 30px;
      }
      table thead th
      {
        background-color: #ddf4ff;
        width: 100px;
      }
      table tr:nth-child(odd)
      {
        background: rgba(255, 251, 253,0.56);
      }
      table tr:nth-child(even)
      {
        background: rgba(255, 251, 253,0.31);
      }
      input[type="submit"], input[type="reset"], input[type="button"], button, .button {
        -moz-appearance: none;
        -webkit-appearance: none;
        -ms-appearance: none;
        appearance: none;
        -moz-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
        -webkit-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
        -ms-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
        transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
        background-color: transparent;
        border-radius: 3px;
        border: 0;
        box-shadow: inset 0 0 0 2px #fff;
        color: #fff;
        cursor: pointer;
        display: inline-block;
        font-size: 1.0em;
        font-weight: 900;
        height: 3.125em;
        letter-spacing: 0.225em;
        line-height: 3.125em;
        padding: 0 2.75em;
        text-align: center;
        text-decoration: none;
        text-transform: uppercase;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
      }
    </style>
  </head>
  <body>

  <p>                              </p>
  <form method="post" action="../admin" class="special">

    <input type="submit" name="user" value="用户管理">
    <input type="submit" name="society" value="社团管理">
    <input type="submit" name="log" value="查看日志">
  </form>

  <jsp:useBean id="admin" type="java.lang.String" scope="session"/>
  <c:if test="${admin.equals(\"user\")}">
    <jsp:include page="./include/user.jsp"/>
  </c:if>
  <c:if test="${admin.equals(\"society\")}">
    <jsp:include page="./include/society.jsp"/>
  </c:if>
  <c:if test="${admin.equals(\"log\")}">
    <jsp:include page="./include/log.jsp"/>
  </c:if>


  </body>
</html>
