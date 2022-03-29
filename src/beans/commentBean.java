package beans;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.*;

public class commentBean implements Serializable {
    private String user = "";
    private String comment = "";
    private static final long serialVersionUID = 1L;

    public String getUser() {
        return user;
    }

    public void setUser(String user) { this.user = user; }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void databaseWriter() throws SQLException {
        final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        final String URL = "jdbc:sqlserver://localhost:1433;DatabaseName=recruit";
        final String USER = "sa";
        final String PASSWORD = "sam@2021";

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

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


        this.setUser("");
        this.setComment("");
    }
}
