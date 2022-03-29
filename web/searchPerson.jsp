<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="text/html; charset=UTF-8">
    <!--[if lt IE]>
    <script>window.alert("请注意，此网页不兼容IE。\n请使用其他浏览器（如360浏览器，Firefox，Chrome等。\n如有疑问请联系网页制作者（QQ：1301621033）。");</script>
    <![endif]-->
    <link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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

    <div class="search" id="search">
        <h2 class="big2">录取查询</h2><br>

        <form name="searchPerson" method="get" action="load.do">
            输入考生姓名：<input type="text" name="name" style="width: 20%" maxlength="50">
            </select> <input type="submit" value="查询">
        </form>

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
