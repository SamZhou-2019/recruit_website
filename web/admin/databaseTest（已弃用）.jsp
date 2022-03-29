<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
    final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    final String URL = "jdbc:sqlserver://localhost:1433;DatabaseName=recruit";
    final String USER = "sa";
    final String PASSWORD = "sam@2021";

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName(DRIVER);
        System.out.println("数据库驱动[ " + DRIVER + "] 加载成功.");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        System.out.println("数据库驱动[ " + DRIVER + "] 加载失败");
    }

    try {
        con = DriverManager.getConnection(URL, USER, PASSWORD);
    } catch (SQLException e) {
        throw new RuntimeException("连接数据库失败", e);
    }

    String sql = "select [name], [stuID], [age], [sex], [home], [grade], [school], [major] from [schema].student;";

    ps = con.prepareStatement(sql);
    rs = ps.executeQuery();
%>
<table style="width:100%;border: 1px solid black">
    <tr style="background: #AF2125">
        <th>姓名</th>
        <th>学号</th>
        <th>年龄</th>
        <th>性别</th>
        <th>生源地</th>
        <th>年级</th>
        <th>学院</th>
        <th>专业</th>
    </tr>
    <%
        while (rs.next()) {
    %>

    <tr>
        <td><%=rs.getString("name")%></td>
        <td><%=rs.getInt("stuID")%></td>
        <td><%=rs.getInt("age")%></td>
        <td><%=rs.getString("sex").equals("M") ? "男" : "女"%></td>
        <td><%=rs.getString("home")%></td>
        <td><%=rs.getString("grade")%></td>
        <td><%=rs.getString("school")%></td>
        <td><%=rs.getString("major")%></td>
    </tr>

    <%
        }
    %>
</table>

<%
    //关闭连接
    if (rs != null) {
        rs.close();
    }
    if (ps != null) {
        ps.close();
    }
    if (con != null) {
        con.close();
    }
%>
</body>
</html>