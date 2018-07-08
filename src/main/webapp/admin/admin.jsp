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
  </head>
  <body>
  <form method="post" action="admin">
    <input type="submit" name="user" value="用户管理">
    <input type="submit" name="log" value="查看日志">
  </form>
  <jsp:useBean id="admin" type="java.lang.String" scope="session"/>
  <c:if test="${admin.equals(\"user\")}">
    <jsp:include page="./include/user.jsp"/>
  </c:if>
  <c:if test="${admin.equals(\"log\")}">
    <jsp:include page="./include/log.jsp"/>
  </c:if>
  </body>
</html>