<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Managers" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/4
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>管理员页面</title>
  </head>
  <body>

  <jsp:useBean id="users" type="java.util.List<model.entity.User>"/>
  <h2>
    <%
      if(request.getParameter("username").equals("admin")&&
              request.getParameter("password").equals("admin")){
        session.setAttribute("users", Managers.UserManager.getAllUsers());
      }
      else
      {
        out.println("<h2>Login Denied!</h2>")
      }
    %>
  </h2>

  <form method="post">
  <table>
  <tr>
  <c:forEach var="user" items="${users}">
    <td>${user.userId}</td>
    <td>${user.userName}</td>
    <td>${user.password}</td>
    <td>${user.phoneNum}</td>
    <td>${user.nickName}</td>
    <td>${user.realName}</td>
    <td>${user.academicNum}</td>
    <td>${user.idCard}</td>
    <td>${user.status}</td>
    <td>${user.description}</td>
    <input type="button" name="delete" placeholder="删除">
  </c:forEach>
  </tr>
    </table>
  </form>
  </body>
</html>
