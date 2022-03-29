package database;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "/PersonServlet", urlPatterns = {"/list.do", "/add.do", "/delete.do", "/load.do", "/update.do","/loadByID.do"})
public class PersonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public PersonServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        String action = request.getRequestURI().substring(url.lastIndexOf('/') + 1, url.lastIndexOf('.'));

        if (action.equals("list")){
            List<Person> pList = PersonDAO.loadAll();
            request.setAttribute("listPerson",pList);
            request.getRequestDispatcher("admin/daoTest.jsp").forward(request,response);
        }
        else if (action.equals("load")){
            List<Person> pList = PersonDAO.loadPerson(String.valueOf(request.getParameter("name")));
            // 为了防止格式问题（这里必须传入字符串），使用了String.valueOf()
            // 这里参考了：https://www.cnblogs.com/wuyun-blog/p/5768843.html
            request.setAttribute("listPerson",pList);
            request.getRequestDispatcher("searchResult.jsp").forward(request,response);
        }
        else if (action.equals("loadByID")){
            Person p = PersonDAO.loadPersonByID(Integer.parseInt(request.getParameter("stuID")));
            request.setAttribute("targetPerson",p);
            request.getRequestDispatcher("admin/updatePerson.jsp").forward(request,response);
        }
        else if (action.equals("delete")) {
            int stuID = Integer.parseInt(request.getParameter("stuID"));
            PersonDAO.deletePerson(stuID);
            response.sendRedirect("list.do");
        }
        else if (action.equals("add")) {
            Person p = new Person();
            try {
                p.setName(request.getParameter("name"));
                p.setStuID(Integer.parseInt(request.getParameter("stuID")));
                p.setAge(Integer.parseInt(request.getParameter("age")));
                p.setSex(request.getParameter("sex"));
                p.setHome(request.getParameter("home"));
                p.setGrade(Integer.parseInt(request.getParameter("grade")));
                p.setSchool(request.getParameter("school"));
                p.setMajor(request.getParameter("major"));
                PersonDAO.addPerson(p);
                response.sendRedirect("list.do");
            }catch (NumberFormatException e) {
                response.sendRedirect("admin/error.jsp");
            }
        }else if (action.equals("update")){
            Person p = new Person();
            try {
                p.setName(request.getParameter("name"));
                p.setStuID(Integer.parseInt(request.getParameter("stuID")));
                p.setAge(Integer.parseInt(request.getParameter("age")));
                p.setSex(request.getParameter("sex"));
                p.setHome(request.getParameter("home"));
                p.setGrade(Integer.parseInt(request.getParameter("grade")));
                p.setSchool(request.getParameter("school"));
                p.setMajor(request.getParameter("major"));
                PersonDAO.updatePerson(p);
                response.sendRedirect("list.do");
            }catch (NumberFormatException e) {
                response.sendRedirect("admin/error.jsp");
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
