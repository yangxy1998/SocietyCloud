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
    <link rel="stylesheet" href="./css/main.css" />
  </head>
  <body>


  <form method="post" action="admin">
    <input type="submit" name="user" value="用户管理">
    <input type="submit" name="society" value="社团管理">
    <input type="submit" name="log" value="查看日志">
  </form>

  <form method="post" action="admin">
  <header id="header" class="alt">
  <nav id="nav">
  <ul>
    <li class="special">
      <a href="#menu" class="menuToggle"><span><b>菜单</b></span></a>
      <div id="menu">
        <ul>
          <li><a href="../admin/admin.jsp" name="user">用户管理</a></li>
          <li><a href="../admin/admin.jsp" name="society">社团管理</a></li>
          <li><a href="../admin/admin.jsp" name="log">查看日志</a></li>
        </ul>
      </div>
    </li>
  </ul>
  </nav>
  </header>
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

  <!-- Scripts -->
  <script src="./css/js/jquery.min.js"></script>
  <script src="./css/js/jquery.scrollex.min.js"></script>
  <script src="./css/js/jquery.scrolly.min.js"></script>
  <script src="./css/js/skel.min.js"></script>
  <script src="./css/js/util.js"></script>
  <script src="./css/js/main.js"></script>

  </body>
</html>
