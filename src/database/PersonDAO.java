package database;

import java.sql.*;
import java.util.*;

public class PersonDAO {
    // 根据人名查询
    public static List<Person> loadPerson(String name) {
        List<Person> pList = new ArrayList<Person>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = Connect.connect();
            String sql = "select [name], [stuID], [age], [sex], [home], [grade], [school], [major] from [schema].student where [name]=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                Person p = new Person();
                p.setName(rs.getString("name"));
                p.setStuID(rs.getInt("stuID"));
                p.setAge(rs.getInt("age"));
                p.setSex(rs.getString("sex"));
                p.setHome(rs.getString("home"));
                p.setGrade(rs.getInt("grade"));
                p.setSchool(rs.getString("school"));
                p.setMajor(rs.getString("major"));

                pList.add(p);
            }
            // 关于rs.next()：https://blog.csdn.net/yejin191258966/article/details/19243013
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                Connect.closeConnection(con, ps, null);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return pList;
    }

    // 根据学号查询
    public static Person loadPersonByID(int stuID) {
        Person p = new Person();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = Connect.connect();
            String sql = "select [name], [stuID], [age], [sex], [home], [grade], [school], [major] from [schema].student where [stuID]=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, stuID);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setName(rs.getString("name"));
                p.setStuID(rs.getInt("stuID"));
                p.setAge(rs.getInt("age"));
                p.setSex(rs.getString("sex"));
                p.setHome(rs.getString("home"));
                p.setGrade(rs.getInt("grade"));
                p.setSchool(rs.getString("school"));
                p.setMajor(rs.getString("major"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                Connect.closeConnection(con, ps, null);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return p;
    }

    // 查询所有成员
    public static List<Person> loadAll() {
        List<Person> pList = new ArrayList<Person>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = Connect.connect();
            String sql = "select [name], [stuID], [age], [sex], [home], [grade], [school], [major] from [schema].student";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Person p = new Person();
                p.setName(rs.getString("name"));
                p.setStuID(rs.getInt("stuID"));
                p.setAge(rs.getInt("age"));
                p.setSex(rs.getString("sex"));
                p.setHome(rs.getString("home"));
                p.setGrade(rs.getInt("grade"));
                p.setSchool(rs.getString("school"));
                p.setMajor(rs.getString("major"));

                pList.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                Connect.closeConnection(con, ps, null);
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    Connect.closeConnection(con, ps, null);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return pList;
    }

    public static void deletePerson(int stuID) {
        Connection con = null;
        PreparedStatement ps = null;
        try{
            con = Connect.connect();
            String sql = "delete from [schema].student where stuID=?;";
            ps = con.prepareStatement(sql);
            ps.setInt(1, stuID);
            int flag = ps.executeUpdate();
            if (flag > 0){
                System.out.println("删除成功！Success!");
            } else{
                System.out.println("删除失败！Fail!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                Connect.closeConnection(con, ps, null);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    // execute、executeUpdate、executeQuery三者的区别（及返回值）：https://www.cnblogs.com/angelye/p/7855906.html

    public static void addPerson(Person p){
        Connection con = null;
        PreparedStatement ps = null;
        try{
            con = Connect.connect();
            String sql = "insert into [schema].student (name, stuID, age, sex, home, grade, school, major)\n" +
                    "values (?,?,?,?,?,?,?,?);";
            ps = con.prepareStatement(sql);
            ps.setString(1,p.getName());
            ps.setInt(2,p.getStuID());
            ps.setInt(3,p.getAge());
            ps.setString(4,p.getSex());
            ps.setString(5,p.getHome());
            ps.setInt(6,p.getGrade());
            ps.setString(7,p.getSchool());
            ps.setString(8,p.getMajor());

            int flag = ps.executeUpdate();
            if (flag > 0){
                System.out.println("添加成功！Success!");
            } else{
                System.out.println("添加失败！Fail!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                Connect.closeConnection(con, ps, null);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void updatePerson(Person p){
        Connection con = null;
        PreparedStatement ps = null;
        try{
            con = Connect.connect();
            String sql = "update [schema].student\n" +
                    "set [name]=?, [age]=?, [sex]=?, [home]=?, [grade]=?, [school]=?, [major]=?\n" +
                    "where [stuID]=?;";
            ps = con.prepareStatement(sql);
            ps.setString(1,p.getName());
            ps.setInt(2,p.getAge());
            ps.setString(3,p.getSex());
            ps.setString(4,p.getHome());
            ps.setInt(5,p.getGrade());
            ps.setString(6,p.getSchool());
            ps.setString(7,p.getMajor());
            ps.setInt(8,p.getStuID());

            int flag = ps.executeUpdate();
            if (flag > 0){
                System.out.println("修改成功！Success!");
            } else{
                System.out.println("修改失败！Fail!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                Connect.closeConnection(con, ps, null);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
