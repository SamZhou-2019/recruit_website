package database;

public class Person {
    private String name;
    private int stuID;
    private int age;
    private String sex;
    private String home;
    private int grade;
    private String school;
    private String major;
    public String getName() { return name; }
    public void setName(String name) {
        this.name = name;
    }
    public int getStuID() {
        return stuID;
    }
    public void setStuID(int stuID) { this.stuID = stuID; }
    public int getAge() {
        return age;
    }
    public void setAge(int age) {
        this.age = age;
    }
    public String getSex() {
        return sex;
    }
    public void setSex(String sex) {
        this.sex = sex;
    }
    public String getHome() { return home; }
    public void setHome(String home) {
        this.home = home;
    }
    public int getGrade() {
        return grade;
    }
    public void setGrade(int grade) {
        this.grade = grade;
    }
    public String getSchool() {
        return school;
    }
    public void setSchool(String school) {
        this.school = school;
    }
    public String getMajor() {
        return major;
    }
    public void setMajor(String major) {
        this.major = major;
    }
}