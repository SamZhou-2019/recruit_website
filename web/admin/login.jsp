<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <style>
        div.login {
            position: fixed;
            width: 30%;
            height: 40%;
            top:10%;
            left: 10%;
            background: #00418288;
        }
    </style>
</head>
<body style="background-image: url('../src/bg.jpg')">

<div class="login">
    <b style="text-align: center;color: #AF2125;font-size: xx-large">管理员登录</b>
            <form method="post" action="../Servlet" target="_blank">
                <p>用户名：<input type="text" name="loginName" size="20"></p>
                <p>密码：  <input type="password" name="passWord" size="20"></p>
                <p><input type="submit" value="Submit"> <input type="reset"
                                                               value="Reset"></p>
            </form>
    <a href="settings.jsp">使用Cookie快速登录</a>
    <a href="../index.jsp">返回首页</a>
</div>
</body>

</html>
