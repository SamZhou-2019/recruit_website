<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

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

    String sql = "select [name], [comment], [time] from [schema].comment order by [time];";

    ps = con.prepareStatement(sql);
    rs = ps.executeQuery();
%>
<table style="width:100%;border: 1px solid black">
    <tr style="background: #AF2125">
        <th>姓名</th>
        <th>留言内容</th>
        <th>留言时间</th>
    </tr>
    <%
        while (rs.next()) {
    %>

    <tr>
        <td><%=rs.getString("name")%></td>
        <td><%=rs.getString("comment")%></td>
        <td><%=rs.getString("time")%></td>
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