<!--@author 杨晓宇-->
<!--@author 万培林-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/8
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看日志</title>
    <style type="text/css">
        table
        {
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
            background: #ffd88d;
        }
        table tr:nth-child(even)
        {
            background: rgb(255, 251, 253);
        }



    </style>

</head>

<body>

<jsp:useBean id="logs" type="java.util.List<util.Log>" scope="session"/>


<center>
    <table border="1">
        <tr>
            <th>日志时间</th>
            <th>日志内容</th>
            <th>日志类型</th>
            <th>日志属性</th>
        </tr>



        <c:forEach var="log" items="${logs}">
            <c:if test="${log.type.equals(\"event\")}">
                <tr>
                    <td><font color="gray">${log.time}</font></td>
                    <td><font color="gray">${log.log}</font></td>
                    <td><font color="gray">${log.type}</font></td>
                    <td><font color="gray">${log.attribute}</font></td>
                </tr>
            </c:if>
            <c:if test="${log.type.equals(\"error\")}">
                <tr>
                    <td><font color="#8b0000">${log.time}</font></td>
                    <td><font color="#8b0000">${log.log}</font></td>
                    <td><font color="#8b0000">${log.type}</font></td>
                    <td><font color="#8b0000">${log.attribute}</font></td>
                </tr>
            </c:if>
            <c:if test="${log.type.equals(\"user\")}">
                <tr>
                    <td><font color="#b8860b">${log.time}</font></td>
                    <td><font color="#b8860b">${log.log}</font></td>
                    <td><font color="#b8860b">${log.type}</font></td>
                    <td><font color="#b8860b">${log.attribute}</font></td>
                </tr>
            </c:if>
            <c:if test="${log.type.equals(\"society\")}">
                <tr>
                    <td><font color="#8b008b">${log.time}</font></td>
                    <td><font color="#8b008b">${log.log}</font></td>
                    <td><font color="#8b008b">${log.type}</font></td>
                    <td><font color="#8b008b">${log.attribute}</font></td>
                </tr>
            </c:if>
            <c:if test="${log.type.equals(\"admin\")}">
                <tr>
                    <td><font color="#00008b">${log.time}</font></td>
                    <td><font color="#00008b">${log.log}</font></td>
                    <td><font color="#00008b">${log.type}</font></td>
                    <td><font color="#00008b">${log.attribute}</font></td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
    <form method="post" action="admin">
        <input type="submit" style="width:104px;height:50px;border:none;" value="刷新">
        <%
            request.setAttribute("admin","log");
        %>
    </form>
</center>



</body>
</html>
