<%@ page import="java.util.*, java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员页面</title>
</head>
<body>
<%--这里是防止未登录即进入设置界面--%>
<%
    jakarta.servlet.http.Cookie[] cookies = request.getCookies();
    String status = "default";
    //out.println("目前的Cookies：<br>");
    for (jakarta.servlet.http.Cookie c : cookies){
        //out.println(c.getName()+' '+c.getValue()+"<br>");
        if (Objects.equals(c.getName(), "login")){
            status = c.getValue();
        }
    }
    //out.println(status);
    if (!Objects.equals(status, "success") && !Objects.equals(request.getAttribute("login"), "success")){
        out.println("非法操作，请登录后再试！");
    }
    else {

    %>
<p>恭喜您，登录成功！</p>
<iframe src="../list.do" name="stuDB" style="width: 80%;height: 80%;border:2px solid black;"></iframe>
        <%
    }
%>

<%--在这里出现了一个和网页无关的错误：Address localhost:1099 is already in use
经检查是Tomcat出错。解决方案：https://blog.csdn.net/SXY16044314/article/details/97692664 --%>
</body>
</html>
