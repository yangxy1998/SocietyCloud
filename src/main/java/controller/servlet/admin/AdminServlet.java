package controller.servlet.admin;

import model.Managers;
import model.entity.User;
import util.function.Log;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/7/8.
 */
public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String adminName=(String) request.getAttribute("adminName");
        String user=request.getParameter("user");
        if(user!=null){
            Log.addAdminLog("访问了用户列表。",adminName);
            session.setAttribute("admin","user");
        }
        String log=request.getParameter("log");
        if(log!=null){
            Log.addAdminLog("访问了日志列表。",adminName);
            session.setAttribute("admin","log");
        }
        RequestDispatcher dispatcher=request.getRequestDispatcher("./admin/admin.jsp");
        dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher dispatcher;
        String adminName=request.getParameter("adminname");
        String adminPassword=request.getParameter("adminpassword");
        if(adminName.equals("admin")&& adminPassword.equals("admin")){
            Log.addAdminLog("登录了管理员页面。",adminName);
            HttpSession session=request.getSession();
            List<User> users=Managers.UserManager.getAllUsers();
            session.setAttribute("adminName",adminName);
            session.setAttribute("users", users);
            session.setAttribute("logs", Log.getLogs());
            session.setAttribute("admin", "log");
            session.setAttribute("update","");
            dispatcher=request.getRequestDispatcher("./admin/admin.jsp");
        }
        else
        {
            Log.addAdminLog("尝试访问管理员页面。",adminName);
            dispatcher=request.getRequestDispatcher("./admin.html");
        }
        dispatcher.forward(request,response);
    }
}
