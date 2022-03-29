import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "Servlet", value = "/Servlet")
public class Servlet extends HttpServlet {
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
}
