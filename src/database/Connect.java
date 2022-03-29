package database;

import java.sql.*;

public class Connect {
    private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String URL = "jdbc:sqlserver://localhost:1433;DatabaseName=recruit";
    private static final String USER="sa";
    private static final String PASSWORD="sam@2021";

    public static Connection connect() {
        try {
            Class.forName( DRIVER ) ;
            System.out.println( "数据库驱动[ " + DRIVER + "] 加载成功." );
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println( "数据库驱动[ " + DRIVER + "] 加载失败" );
        }

        Connection conn = null ;

        try {
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            return conn ;
        } catch (SQLException e) {
            throw new RuntimeException( "连接数据库失败" , e );
        }

    }

    //关闭连接
    public static void closeConnection(Connection con,PreparedStatement ps,ResultSet rs) throws SQLException{
        if(rs!=null){
            rs.close();
        }
        if(ps!=null){
            ps.close();
        }
        if(con!=null){
            con.close();
        }

    }
}
