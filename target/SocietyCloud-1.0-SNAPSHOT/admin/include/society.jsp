<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.function.Creator" %>
<%@ page import="controller.tools.user.FoundTool" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/8
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>社团管理</title>
</head>
<body>
<jsp:useBean id="societies" type="java.util.List<model.entity.Society>" scope="session"/>
<center>
    <form method="post" action="admin.Society">
        <table border="1">
            <tr>
                <th>社团ID</th>
                <th>社团名</th>
                <th>学校名</th>
                <th>主分类</th>
                <th>次分类</th>
                <th>成立时间</th>
                <th>创始人</th>
                <th>社团状态</th>
                <th>社团描述</th>
                <th><input type="submit" name="create->newSociety" value="新增"></th>
            </tr>
            <jsp:useBean id="update" type="java.lang.String" scope="session"/>
            <c:if test="${update.equals(\"newSociety\")}">
                <%
                    session.setAttribute("uuid", FoundTool.getNewSocietyId());
                    session.setAttribute("currentTime",Creator.getTime());
                %>
                <jsp:useBean id="uuid" type="java.lang.String" scope="session"/>
                <jsp:useBean id="currentTime" type="java.lang.String" scope="session"/>
                <tr>
                    <td><input type="text" name="societyId" value="${uuid}"></td>
                    <td><input type="text" name="societyName" placeholder="new society name"></td>
                    <td><input type="text" name="schoolName" placeholder="school name of new society"></td>
                    <td></td>
                    <td></td>
                    <td><input type="text" name="foundDate" value="${currentTime}" placeholder="found time of new society"></td>
                    <td><input type="text" name="founder" placeholder="new user phone number"></td>
                    <td></td>
                    <td></td>
                    <td><input type="submit" name="commit->newSociety" value="确定"></td>
                    <td><input type="submit" name="cancel->newSociety" value="撤销"></td>
                </tr>
            </c:if>
            <c:forEach var="society" items="${societies}">
                <c:if test="${update.equals(society.societyId)}">
                    <tr>
                        <td><input type="text" name="societyId" value="${society.societyId}"></td>
                        <td><input type="text" name="societyName" value="${society.societyName}"></td>
                        <td><input type="text" name="schoolName" value="${society.schoolName}"></td>
                        <td><input type="text" name="mainType" value="${society.mainType}"></td>
                        <td><input type="text" name="subType" value="${society.subType}"></td>
                        <td><input type="text" name="foundDate" value="${society.foundTime}"></td>
                        <td><input type="text" name="founder" value="${society.founder}"></td>
                        <td><input type="text" name="status" value="${society.status}" placeholder="0：正常 1：冻结"></td>
                        <td><input type="text" name="description" value="${society.description}"></td>
                        <td><input type="submit" name="commit->${society.societyId}" value="确定"></td>
                        <td><input type="submit" name="cancel->${society.societyId}" value="撤销"></td>
                    </tr>
                </c:if>
                <c:if test="${!update.equals(society.societyId)}">
                    <tr>
                        <td>${society.societyId}</td>
                        <td>${society.societyName}</td>
                        <td>${society.schoolName}</td>
                        <td>${society.mainType}</td>
                        <td>${society.subType}</td>
                        <td>${society.foundTime}</td>
                        <td>${society.founder}</td>
                        <td>${society.status==0?"正常":"冻结"}</td>
                        <td>${society.description}</td>
                        <td><input type="submit" name="update->${society.societyId}" value="修改"></td>
                        <td><input type="submit" name="remove->${society.societyId}" value="删除"></td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
    </form>
</center>
</body>
</html>
