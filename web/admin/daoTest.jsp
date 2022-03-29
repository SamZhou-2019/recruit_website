<%@ page import="java.util.List" %>
<%@ page import="database.Person" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet"
          href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script
            src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <title>学生数据查询与管理页面</title>
</head>
<body>
<%
    List<Person> pList = (List<Person>) request.getAttribute("listPerson");
%>
<div class="jumbotron container">
    <table class="table table-hover">
        <tr style="background: #AF2125">
            <th>姓名</th>
            <th>学号</th>
            <th>年龄</th>
            <th>性别</th>
            <th>生源地</th>
            <th>年级</th>
            <th>学院</th>
            <th>专业</th>
            <th>删除</th>
            <th>更新</th>
        </tr>
        <c:forEach var="row" items="${listPerson}">
            <tr>
                <td><c:out value="${row.name}"/></td>
                <td><c:out value="${row.stuID}"/></td>
                <td><c:out value="${row.age}"/></td>
                <td><c:out value="${row.sex}"/></td>
                <td><c:out value="${row.home}"/></td>
                <td><c:out value="${row.grade}"/></td>
                <td><c:out value="${row.school}"/></td>
                <td><c:out value="${row.major}"/></td>
                <td><a
                        href="delete.do?stuID=<c:out value="${row.stuID}" />">删除</a></td>
                <td><a
                        href="loadByID.do?stuID=<c:out value="${row.stuID}" />">更新</a></td>
            </tr>
        </c:forEach>
    </table>
    <p>
        <a class="btn btn-primary btn-lg" href="admin/addPerson.jsp" role="button">添加学生数据</a>
        <a class="btn btn-primary btn-lg" href="index.jsp" role="button">返回首页</a>
    </p>
</div>
</body>
</html>
