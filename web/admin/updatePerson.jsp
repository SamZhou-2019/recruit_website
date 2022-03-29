<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="database.Person" %>
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
    <title>学生数据更新页面</title>
</head>
<body>
<script>
    majors = new Object();
    majors['经济学院'] = new Array('应用经济学', '金融', '会计', '财务管理');
    majors['管理学院'] = new Array('工商管理', '公共管理', '人力资源管理', '电子商务', '旅游管理');
    majors['信息学院'] = new Array('软件工程', '计算机科学与技术', '人工智能', '信息安全', '信息管理');
    majors['工程学院'] = new Array('工程管理', '工业工程', '通信工程', '土木工程', '生物工程');
    majors['理学院'] = new Array('数学', '理论物理', '理论化学', '地理学', '生物医学');
    majors['文学院'] = new Array('汉语言文学', '英语', '法语', '哲学');

    function set_major(school, major) {
        var sv, mv;
        var i, ii;

        sv = school.value;

        major.length = 1;

        if (sv == '0') return;
        if (typeof (majors[sv]) == 'undefined') return;

        for (i = 0; i < majors[sv].length; i++) {
            ii = i + 1;
            major.options[ii] = new Option();
            major.options[ii].text = majors[sv][i];
            major.options[ii].value = majors[sv][i];
        }
    }

    function back(){
        location.href="${pageContext.request.contextPath}/list.do";
    }
</script>


<%
    Person p = (Person) request.getAttribute("targetPerson");
%>
<div class="jumbotron container">
    <h1>修改学生数据</h1>
    <p>您正在修改的学生学号为：<%=p.getStuID()%></p>
    <form name="updatePerson" method="post" action="${pageContext.request.contextPath}/update.do">
        <label for="name">姓名</label><br>
        <input type="text" name="name" id="name" maxlength="20" value="<%=p.getName()%>"><br>
        <label for="stuID" style="display: none">学号</label>
        <input type="hidden" name="stuID" id="stuID" maxlength="10" value="<%=p.getStuID()%>">
        <label for="age">年龄</label><br>
        <input type="number" name="age" id="age" maxlength="3"  value="<%=p.getAge()%>"><br>
        性别<br>
        <% if (p.getSex().equals("男")){ %>
        <input type="radio" name="sex" id="男" value="男" checked="checked">
        <label for="男">男</label>
        <input type="radio" name="sex" id="女" value="女">
        <label for="女">女</label><br>
        <% } else { %>
        <input type="radio" name="sex" id="男" value="男">
        <label for="男">男</label>
        <input type="radio" name="sex" id="女" value="女" checked="checked">
        <label for="女">女</label><br>
        <% } %>
        <label for="home">生源地</label><br>
        <select name="home" id="home">
            <option value="<%=p.getHome()%>">不修改（<%=p.getHome()%>）</option>
            <option value="北京">北京市</option>
            <option value="天津">天津市</option>
            <option value="上海">上海市</option>
            <option value="重庆">重庆市</option>
            <option value="河北">河北省</option>
            <option value="山西">山西省</option>
            <option value="辽宁">辽宁省</option>
            <option value="吉林">吉林省</option>
            <option value="黑龙江">黑龙江省</option>
            <option value="江苏">江苏省</option>
            <option value="浙江">浙江省</option>
            <option value="安徽">安徽省</option>
            <option value="福建">福建省</option>
            <option value="江西">江西省</option>
            <option value="山东">山东省</option>
            <option value="河南">河南省</option>
            <option value="湖北">湖北省</option>
            <option value="湖南">湖南省</option>
            <option value="广东">广东省</option>
            <option value="海南">海南省</option>
            <option value="四川">四川省</option>
            <option value="贵州">贵州省</option>
            <option value="云南">云南省</option>
            <option value="陕西">陕西省</option>
            <option value="甘肃">甘肃省</option>
            <option value="青海">青海省</option>
            <option value="台湾">台湾省</option>
            <option value="内蒙古">内蒙古自治区</option>
            <option value="广西">广西壮族自治区</option>
            <option value="西藏">西藏自治区</option>
            <option value="宁夏">宁夏回族自治区</option>
            <option value="新疆">新疆维吾尔自治区</option>
            <option value="香港">香港特别行政区</option>
            <option value="澳门">澳门特别行政区</option>
            <option value="海外">其他国家或地区</option>
        </select><br>
        <label for="grade">年级</label><br>
        <input type="number" name="grade" id="grade" maxlength="4"  value="<%=p.getGrade()%>"><br>
        学院与专业<br>
        <select name="school" onChange="set_major(this, this.form.major);">
            <option value="<%=p.getSchool()%>">不修改（<%=p.getSchool()%>）</option>
            <option value="经济学院">经济学院</option>
            <option value="管理学院">管理学院</option>
            <option value="信息学院">信息学院</option>
            <option value="工程学院">工程学院</option>
            <option value="理学院">理学院</option>
            <option value="文学院">文学院</option>
        </select>
        <select name="major" id="majors">
            <option value="<%=p.getMajor()%>">不修改（<%=p.getMajor()%>）</option>
            <option value="0">选择专业</option>
        </select><br><br>
        <input type="submit" value="确定">
        <input type="button" value="放弃并返回" onclick="back();">
    </form>
</div>
</body>
</html>
