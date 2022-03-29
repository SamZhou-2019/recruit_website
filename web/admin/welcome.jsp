<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String status = "success";
    jakarta.servlet.http.Cookie c = new jakarta.servlet.http.Cookie("login",status);
    c.setMaxAge(3600);
    //Cookie 的持续时间为3600秒，即1小时
    response.addCookie(c);
    request.setAttribute("login",c.getValue());
%>
<jsp:forward page="settings.jsp" />
<%--jsp实现页面跳转的几种方式:https://blog.csdn.net/zg97zb/article/details/93527209
转发和重定向区别：https://blog.csdn.net/liubin5620/article/details/79922692 --%>
