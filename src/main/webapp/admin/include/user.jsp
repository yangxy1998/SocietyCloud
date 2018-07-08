<%@ page import="util.function.Creator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/8
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
</head>
<body>
<jsp:useBean id="users" type="java.util.List<model.entity.User>" scope="session"/>
<center>
    <form method="post" action="admin.User">
        <table border="1">
            <tr>
                <th>用户ID</th>
                <th>用户名</th>
                <th>密码</th>
                <th>手机号</th>
                <th>昵称</th>
                <th>真实姓名</th>
                <th>学工号</th>
                <th>证件号</th>
                <th>用户状态</th>
                <th>用户备注</th>
                <th><input type="submit" name="create->newUser" value="新增"></th>
            </tr>
            <jsp:useBean id="update" type="java.lang.String" scope="session"/>
            <c:if test="${update.equals(\"newUser\")}">
                <%
                    session.setAttribute("uuid",Creator.createUUID());
                %>
                <jsp:useBean id="uuid" type="java.lang.String" scope="session"/>
                <tr>
                    <td><input type="text" name="userId" value="${uuid}"></td>
                    <td><input type="text" name="userName" placeholder="new user name"></td>
                    <td><input type="text" name="password" placeholder="new user password"></td>
                    <td><input type="text" name="phoneNum" placeholder="new user phone number"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><input type="submit" name="commit->newUser" value="确定"></td>
                    <td><input type="submit" name="cancel->newUser" value="撤销"></td>
                </tr>
            </c:if>
            <c:forEach var="user" items="${users}">
                <c:if test="${update.equals(user.userId)}">
                    <tr>
                        <td><input type="text" name="userId" value="${user.userId}"></td>
                        <td><input type="text" name="userName" value="${user.userName}"></td>
                        <td><input type="text" name="password" value="${user.password}"></td>
                        <td><input type="text" name="phoneNum" value="${user.phoneNum}"></td>
                        <td><input type="text" name="nickName" value="${user.nickName}"></td>
                        <td><input type="text" name="realName" value="${user.realName}"></td>
                        <td><input type="text" name="academicNum" value="${user.academicNum}"></td>
                        <td><input type="text" name="idCard" value="${user.idCard}"></td>
                        <td><input type="text" name="status" value="${user.status}" placeholder="0：正常 1：冻结"></td>
                        <td><input type="text" name="description" value="${user.description}"></td>
                        <td><input type="submit" name="commit->${user.userId}" value="确定"></td>
                        <td><input type="submit" name="cancel->${user.userId}" value="撤销"></td>
                    </tr>
                </c:if>
                <c:if test="${!update.equals(user.userId)}">
                    <tr>
                        <td>${user.userId}</td>
                        <td>${user.userName}</td>
                        <td>${user.password}</td>
                        <td>${user.phoneNum}</td>
                        <td>${user.nickName}</td>
                        <td>${user.realName}</td>
                        <td>${user.academicNum}</td>
                        <td>${user.idCard}</td>
                        <td>${user.status==0?"正常":"冻结"}</td>
                        <td>${user.description}</td>
                        <td><input type="submit" name="update->${user.userId}" value="修改"></td>
                        <td><input type="submit" name="remove->${user.userId}" value="删除"></td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
    </form>
</center>
</body>
</html>
