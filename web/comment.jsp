<%@ page import="java.util.Objects" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh_CN">
<jsp:useBean id="commentA" class="beans.commentBean" scope="page"/>
<jsp:setProperty name="commentA" property="*"/>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="text/html; charset=UTF-8">
    <!--[if lt IE]>
    <script>window.alert("请注意，此网页不兼容IE。\n请使用其他浏览器（如360浏览器，Firefox，Chrome等。\n如有疑问请联系网页制作者（QQ：1301621033）。");</script>
    <![endif]-->
    <link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>留言板</title>
    <script src="js/pages.js"></script>
    <script src="js/school.js"></script>
    <script src="js/time.js"></script>
</head>

<body onload="startTime()">
<h1 class="big1" id="big1">自制西电招生网站</h1>
<div class="nav">
    <table style="width: 20%">
        <tr>
            <th><a href="index.jsp">返回首页</a></th>
        </tr>
    </table>
</div>

<div class="main">


    <div class="menu">
        <button class="menu_button">快速链接</button>
        <div class=menu_content>
            <a href="https://www.xidian.edu.cn/" target=_blank>西电官网</a>
            <a href="https://tieba.baidu.com/f?kw=%CE%F7%B0%B2%B5%E7%D7%D3%BF%C6%BC%BC%B4%F3%D1%A7"
               target=_blank>西电贴吧</a>
            <a href="https://weibo.com/xidian" target=_blank>西电微博</a>
            <a href="https://space.bilibili.com/224699503" target=_blank>西电B站</a>
            <a href="https://www.toutiao.com/c/user/4124851253/" target=_blank>西电头条号</a>
            <a href="http://image.xidian.edu.cn/" target=_blank>影像西电</a>
            <a href="https://gis.xidian.edu.cn/" target=_blank>西电校园地图</a>
            <a href="https://news.xidian.edu.cn/" target=_blank>西电新闻网</a>
        </div>
    </div>

    <div class="top"><a href="#big1"><b>&nbsp;&nbsp;Δ&nbsp;&nbsp;</b></a></div>

    <div class="comment" id="comment">
        <h2 class="big2">留言列表</h2><br>
        <jsp:include page="commentList.jsp"></jsp:include>
        <h2 class="big2">留言区</h2>
        <% if (!Objects.equals(commentA.getUser(), "") && !Objects.equals(commentA.getComment(), "")) {
            try {
                commentA.databaseWriter();
                response.sendRedirect("comment.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else {
            out.println("注意：用户名或留言内容不能为空！");
        }%>
        <form name="bean" method="post" action="comment.jsp">
            输入用户名：<input type="text" name="user" style="width: 20%" maxlength="50"><br>
            输入留言：<input type="text" name="comment" style="width: 20%;height: 60%" maxlength="500"><br>
            </select> <input type="submit" value="留言">
        </form>
        <!--JavaBean部分参考了https://www.runoob.com/jsp/jsp-javabean.html-->
    </div>
</div>

<div class="bottom">
    <p>这个网站是由个人维护的，不代表西电招生办或西电任何部门或组织机构。&gt; 。&lt;</p>
    <div id="txt"></div>
    <script>document.write('\n这里是本页面的底部。');</script>
    <a href="admin/login.jsp">管理员登录</a>
</div>
</body>

</html>