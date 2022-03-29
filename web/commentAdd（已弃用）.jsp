<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%--该页面用于连接数据库以添加留言--%>
<%
    final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    final String URL = "jdbc:sqlserver://localhost:1433;DatabaseName=recruit";
    final String USER = "sa";
    final String PASSWORD = "sam@2021";

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String user = request.getParameter("user");
    String comment = request.getParameter("comment");

    Date now = new Date();
    SimpleDateFormat ft = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    String date = ft.format(now);


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

    String sql = "insert into [schema].comment (name, comment, \"time\")\n" +
            "values ('"+user+"','"+comment+"','"+date+"');select *\n" +
            "from [schema].comment;";

    ps = con.prepareStatement(sql);
    rs = ps.executeQuery();

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
<%response.sendRedirect("comment.jsp");%>