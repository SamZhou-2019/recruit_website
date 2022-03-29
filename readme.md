# recruit_website

<del>在2020年暑假做的一个招生页面，在帮助新生的同时用来学习html和css。现已完成历史使命。包含GitHub版和Gitee版。</del>

大四时为了完成商务网页设计实验，又把这个项目拿了起来😂。2020的旧版文件已存入`recruit_2020`文件夹中。



使用HTML、CSS、JAVASCRIPT、JSP等编程语言，进行一次网页开发的完整过程，包括前端开发、后端数据库开发等。

创建一个自制的西电招生网站，其中包含五个主要页面：对西电的主要介绍、联系方式（前两部分完全由前端部分完成）、留言板、录取查询、管理员设置页面（后三个部分由前端部分和后端部分共同完成）。

- IntelliJ IDEA 2021.2.3 (Ultimate Edition)
- DataGrip 2021.2.4
- Apache Tomcat 10.0.12

<img src="readme_pic\pic0.png" alt="pic0"/>



## 1.主要介绍和联系方式部分

### 1.1 页面设计

这两个部分主要由前端设计。页面由标题、导航栏、“快速链接”按钮、二维码、侧栏、主题内容、底栏等组成。

 <img src="readme_pic\pic1.png" alt="pic1"/>

 <img src="readme_pic\pic2.png" alt="pic2"/>

网站导航栏中的链接和侧边栏的链接以表格的形式展示出来，并通过调整css中对应表格的padding值进行对齐。如导航栏的css配置中有

```css
padding: 0 5% 0 5%;
margin: 0;
width: 90%;
```

即：左右的padding值均为5%，主体的宽度为90%，总宽度即为100%。

而侧边栏则为固定位置，与左侧相距5%，位于导航栏下方。

```css
position: fixed;
left: 5%;
```

“快速链接”按钮为固定位置（`position: fixed;`）并在整个页面置顶，一直显示；（`z-index: 1;`）鼠标悬浮在按钮上即出现下拉菜单，鼠标指针也变为“点击”状态（`cursor: pointer;`）。下拉菜单平时不显示（`display: none;`），只有鼠标悬浮在按钮上才会依次出现：

```css
div.menu:hover .menu_content {
    display: block;
    z-index: 1;
}
```

  <img src="readme_pic\pic3.png" alt="pic3" style="zoom:43%;" />

二维码部分也为固定位置，但被标题和导航栏覆盖住，只有当页面滚动至下方才会出现在侧栏上方。与快速链接中的`z-index=1`相反，`z-index:-1`则将该部分至于最底部。

  <img src="readme_pic\pic4.png" alt="pic4" style="zoom:50%;" />

```css
/*二维码*/
div.code {
   background-color: #AF2125;
   position: fixed;
   left: 5%;
   width: 15%;
   top: 3%;
   margin: 0;
   z-index: -1;
   box-shadow: 0px 8px 24px 0px rgba(0, 0, 0, 0.3);
 }
```

底栏利用`clear:both;`置于页面下方。

### 1.2 链接

首页为一个jsp文件（index.jsp），“学校简介”页面中的主体内容为另一个jsp文件（info.jsp），以jsp:include的方式嵌入首页。

```html
<div class="content" id="content">
    <jsp:include page="info.jsp"></jsp:include>
</div>
```

点击导航栏中的前两个链接和侧边栏的链接，首页将以JavaScript的方式对上述id为content的div中的内容进行直接修改。这些内容被存放在pages.js中。如侧边栏中的“报考指南”链接对应的代码为：

```html
<a href="javascript:void(0);" onclick="guidebook()">报考指南</a>
```

单击侧边栏中的“报考指南”，则会运行以下函数：

```javascript
function guidebook() {
    x = document.getElementById("content");
    x.innerHTML = "            <h2 class=\"big2\">报考指南</h2>\n" +
        "            <iframe src=\"https://flbook.com.cn/c/GVjlmMGfuT\" style=\"width: 80%;height: 600px;\"></iframe>" +
        "            <h2 class=\"big2\">历年数据</h2>\n" +
        "        <a href=\"https://zsdata.xidian.edu.cn/#/calendarscore\" target=_blank>各省各专业录取分数线查询</a><br>\n" +
        "        <a href=\"https://zsdata.xidian.edu.cn/#/\" target=_blank>各省各专业录取计划数查询</a>";
}
```

即：将`<div class="content" id="content">`中的内容改为上述代码中innerHTML中的内容。

### 1.3 “学院信息”部分

该部分页面包含一个表单，表单中含有一个下拉列表和一个提交按钮：

```javascript
function contactschool() {
    x = document.getElementById("content");
    x.innerHTML = "            <h2 class=\"big2\">学院信息</h2>\n" +
        "            <select name=\"school\" id=\"school\">\n" +
        "                <option value=\"ste\">通信工程学院</option>\n" +
        "                <option value=\"see\">电子工程学院</option>\n" +
      ...
        "            </select>\n" +
        "            <button type=\"button\" onclick=\"school()\">点此查询</button>\n" +
        "            <p id=\"result\">选择学院并点击查询按钮</p>\n";
}
```

  <img src="readme_pic\pic5.png" alt="pic5" style="zoom: 67%;" />

在下拉列表中选择某一学院并点击“点此查询”按钮后，该表单将选择的选项的值传递给school.js中的`school()`函数。该函数在接收表单值后，按照表单值将上述代码中的`<p id="result">`部分改为指定内容。在这里利用了JavaScript中的封装技术：

```javascript
function School(site, phone, info) {
    this.site = site;
    this.phone = phone;
    this.info = info
}
ste = new School('http://ste.xidian.edu.cn/', '029-81891675', 'http://mp\.weixin\.qq\.com/s\?__biz=MjM5MTAxMTUyMA==&amp;mid=2654973730&amp;idx=1&amp;sn=be8fc8f2bf7d88c80f0efdbe6856e21f&amp;')
```

## 2.留言板

### 2.1 留言列表

  ![pic6](readme_pic\pic6.png)

留言板页面主体部分由两部分组成，一个为留言列表，另一个为留言区。留言板页面为comment.jsp；留言列表页面为commentList.jsp，以`jsp:include`方式嵌入在留言板页面：

```html
<jsp:include page="commentList.jsp"></jsp:include>
```

commentList.jsp包含数据库查询和前端表格两部分。数据库查询部分是在连接数据库后，在数据库中运行以下语句：

```java
String sql = "select [name], [comment], [time] from [schema].comment order by [time];";
```

表格部分则以运行jsp代码的方式，展示了查询结果：

```html
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
```

### 2.2 留言区

留言区部分为comment.jsp中的一个表单，表单填写完成后点击“留言”按钮即传入commentBean文件中以执行数据库命令，在数据库中提交留言。

```html
<form name="bean" method="post" action="comment.jsp">
    输入用户名：<input type="text" name="user" style="width: 20%" maxlength="50"><br>
    输入留言：<input type="text" name="comment" style="width: 20%;height: 60%" maxlength="500"><br>
    </select> <input type="submit" value="留言">
</form>
```

JavaBean封装了两个对象：User和Comment，分别对应用户名和留言内容。同时定义了函数`databaseWriter()`，用于获取当前时间、向数据库提交填入的评论和当前时间：

```java
String sql = "insert into [schema].comment (name, comment, \"time\")\n" +
        "values ('"+user+"','"+comment+"','"+date+"');select *\n" +
        "from [schema].comment;";
```

使用JavaBean时需要在comment.jsp文件开头添加声明语句：

```html
<jsp:useBean id="commentA" class="beans.commentBean" scope="page"/>
<jsp:setProperty name="commentA" property="*"/>
```

## 3.管理员页面和查询页面

### 3.1 管理员登录页面

为了方便管理，将与管理员操作相关的页面放在admin文件夹内。点击页面底栏中的“管理员登录”即可进入管理员登录页面（login.jsp）。

  ![pic7](readme_pic\pic7.png)

登录页面由登录表单，“Cookie快速登录”链接、“返回首页”链接组成。在表单中输入用户名和密码后，表单将数据提交给Servlet.java。

```java
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String userName = request.getParameter("loginName");
    String passWord = request.getParameter("passWord");
    // 下面判断输入的用户名和密码是否正确，初始用户名设为admin,密码为1234
    if (userName.equals("admin") && passWord.equals("1234")) {// 此处假设已有的用户名和密码均为“admin”
        response.sendRedirect("admin/welcome.jsp");
    } else {
        response.sendRedirect("admin/loginfail.html");
    }
}

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
}
```

若用户名和密码正确，则重定向至welcome.jsp，该文件的内容是设置一个一小时的Cookie以保存登录状态，并转发至setting.jsp，即管理页面。

```html
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String status = "success";
    jakarta.servlet.http.Cookie c = new jakarta.servlet.http.Cookie("login",status);
    c.setMaxAge(3600);
    //Cookie 的持续时间为3600秒，即1小时
    response.addCookie(c);
    request.setAttribute("login",c.getValue());
%>
<jsp:forward page="settings.jsp" />
```

Cookie设置后，浏览器中的Cookie列表将存有“login success”的Cookie。此时若点击管理员登陆界面中的“Cookie快速登录”链接，可以无需登录即可进入管理界面。若无此条Cookie就点击，则会显示“非法操作，请登录后再试！”，这是防止未登录即进入设置界面，详见下面的代码：

```html
<%
    jakarta.servlet.http.Cookie[] cookies = request.getCookies();
    String status = "default";
    //out.println("目前的Cookies：<br>");
    for (jakarta.servlet.http.Cookie c : cookies){
        //out.println(c.getName()+' '+c.getValue()+"<br>");
        if (Objects.equals(c.getName(), "login")){
            status = c.getValue();
        }
    }
    //out.println(status);
    if (!Objects.equals(status, "success") && !Objects.equals(request.getAttribute("login"), "success")){
        out.println("非法操作，请登录后再试！");
    }
    else {

    %>
<p>恭喜您，登录成功！</p>
<iframe src="../list.do" name="stuDB" style="width: 80%;height: 80%;border:2px solid black;"></iframe>
        <%
    }
%>
```

即：若要登录，需要输入正确的用户名和密码，或在一小时内已进行过正确的登录操作。

【在这里出现了一个和网页无关的错误：`Address localhost:1099 is already in use`

经检查是Tomcat出错，表示是1099端口已经被占用。解决方案：修改端口再试】

### 3.2 管理界面

登录成功后会显示“恭喜您，登录成功！”字样，并在下方显示一个iframe框架，内容为管理界面（daoTest.jsp）。daoTest.jsp显示为一个表格，内容为所有登记学生信息的表格，以及“添加学生数据”“返回首页”两个按钮。

上面的代码显示该iframe框架中跳转到的应是list.do，这里包含了一系列过程：setting.jsp进入list.do→PersonServlet.java接受list.do→调用PersonDAO.java查询→调用Connect.java连接数据库→PersonDAO.java运行查询语句进行查询→PersonDAO.java向PersonServlet.java返回查询结果→daoTest.jsp显示查询结果。

除此之外，Person.java定义了Person类，对需要用到的变量和函数进行封装，以接收进行增删改查的数据。

  ![pic8](readme_pic\pic8.png)

该数据表的结构：

```sql
create table [schema].student
(
    no     int identity
        constraint student_pk
            primary key nonclustered,
    name   char(20) not null,
    stuID  bigint,
    age    int,
    sex    char(2),
    home   varchar(30),
    grade  int,
    school varchar(30),
    major  varchar(30)
)
go

create unique index student_no_uindex
    on [schema].student (no)
go

create unique index student_stuID_uindex
    on [schema].student (stuID)
go
```

no是数据库自动生成的序号，其他信息是主要的操作对象。

  ![pic9](readme_pic\pic9.png)

以下是PersonServlet.java中查询所有学生数据的函数代码：

```java
if (action.equals("list")){
    List<Person> pList = PersonDAO.loadAll();
    request.setAttribute("listPerson",pList);
request.getRequestDispatcher("admin/daoTest.jsp").forward(request,response);
}
```

以下是PersonDAO.java中查询所有学生数据的函数代码：

```java
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
```

 以下是Person.java中Person类封装的变量： 

```java
private String name;
private int stuID;
private int age;
private String sex;
private String home;
private int grade;
private String school;
private String major;
```




点击每一条数据右侧的“删除”“更新”链接可以进行单条数据的删除和修改；点击下方的“添加学生数据”按钮可以添加单条数据。过程与查询所有语句的过程类似。

 

> 删除：daoTest.jsp进入delete.do，并传入要删除的学生信息的“学号”值→PersonServlet.java接受delete.do→调用PersonDAO.java查询该“学号”对应的数据→调用Connect.java连接数据库→PersonDAO.java运行删除语句进行删除→进入list.do，以显示删除数据后的查询结果。
>
> 更新：daoTest.jsp进入loadByID.do，并传入要删除的学生信息的“学号”值→PersonServlet.java接受loadByID.do→调用PersonDAO.java查询该“学号”对应的数据→调用Connect.java连接数据库→PersonDAO.java运行查询语句进行查询→将数据传给updatePerson.jsp→管理员在updatePerson.jsp中修改数据并提交给update.do→PersonServlet.java接受update.do→调用PersonDAO.java修改该条数据→调用Connect.java连接数据库→PersonDAO.java运行更新语句进行修改→进入list.do，以显示修改数据后的查询结果。
>
> 添加：daoTest.jsp进入addPerson.jsp→管理员在addPerson.jsp中修改数据并提交给add.do→PersonServlet.java接受add.do→调用PersonDAO.java添加该条数据→调用Connect.java连接数据库→PersonDAO.java运行添加语句添加数据→进入list.do，以显示添加数据后的查询结果。

 <img src="readme_pic\pic10.png" alt="pic10" style="zoom:43%;" />

上图为添加学生数据的表单，其中包含了姓名、学号、年龄、性别、生源地、年级、学院和专业八个属性。其中学院和专业使用了二级列表，在选择学院后专业列表才会显示对应的内容。这个二级列表由JavaScript实现，代码如下：

```javascript
<%--二级下拉菜单参考了https://blog.csdn.net/qq_35542689/article/details/79112057 --%>
majors = new Object();
majors['经济学院'] = new Array('应用经济学', '金融', '会计', '财务管理');
majors['管理学院'] = new Array('工商管理', '公共管理', '人力资源管理', '电子商务', '旅游管理');
majors['信息学院'] = new Array('软件工程', '计算机科学与技术', '人工智能', '信息安全', '信息管理');
majors['工程学院'] = new Array('工程管理', '工业工程', '通信工程', '土木工程', '生物工程');
majors['理学院'] = new Array('数学', '理论物理', '理论化学', '地理学', '生物医学');
majors['文学院'] = new Array('汉语言文学', '英语', '法语', '哲学');

function set_major(school, major) {
    var sv, mv;
    var i, ii;

    sv = school.value;
    major.length = 1;

    if (sv == '0') return;
    if (typeof (majors[sv]) == 'undefined') return;

    for (i = 0; i < majors[sv].length; i++) {
        ii = i + 1;
        major.options[ii] = new Option();
        major.options[ii].text = majors[sv][i];
        major.options[ii].value = majors[sv][i];
    }
}
```

而在修改数据界面，则保留了原有数据。管理员只需修改应修改的某几个属性即可。

   <img src="readme_pic\pic11.png" alt="pic11" style="zoom:50%;" />

实现这一功能，输入框只需在表单的input标签加入value属性即可，如姓名输入框中加入：

```html
value="<%=p.getName()%>"
```

而下拉列表只需加入一条value为原有数据即可，如生源地：

```html
<option value="<%=p.getHome()%>">不修改（<%=p.getHome()%>）</option>
```

3.3 录取查询页面

  <img src="readme_pic\pic12.png" alt="pic12" style="zoom:67%;" />

查询功能使用的是“根据姓名进行查询”的功能，和上方提到的loadByID.do“根据学号进行查询”不同。这里包含的过程为：searchPerson.jsp进入load.do并传入要查询的学生信息的“姓名”值→PersonServlet.java接受load.do→调用PersonDAO.java查询该“姓名”对应的数据→调用Connect.java连接数据库→PersonDAO.java运行查询语句进行查询→PersonDAO.java向PersonServlet.java返回查询结果→searchResult.jsp显示查询结果。

   <img src="readme_pic\pic13.png" alt="pic13" style="zoom:50%;" />
