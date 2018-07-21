package controller.servlet.admin;

import controller.servlet.InitServlet;
import model.Managers;
import model.entity.Society;
import model.entity.User;
import util.Log;
import util.function.Pages;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * 管理专用Servlet
 * Created by Administrator on 2018/7/8.
 * @author 杨晓宇
 * @author 林志宸
 */
public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String adminName=(String) session.getAttribute("adminName");
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
        String society=request.getParameter("society");
        if(society!=null){
            Log.addAdminLog("访问了社团列表。",adminName);
            session.setAttribute("admin","society");
        }
        InitServlet.session.commit();
        response.sendRedirect(Pages.ADMIN_MAIN_PAGE);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String adminName=request.getParameter("adminname");
        String adminPassword=request.getParameter("adminpassword");
        if(adminName.equals("admin")&& adminPassword.equals("admin")){
            Log.addAdminLog("登录了管理员页面。",adminName);
            HttpSession session=request.getSession();
            List<User> users=Managers.UserManager.getAllUsers();
            List<Society> societies=Managers.SocietyManager.getAllSocieties();
            session.setAttribute("adminName",adminName);
            session.setAttribute("users", users);
            session.setAttribute("societies",societies);
            session.setAttribute("admin", "log");
            session.setAttribute("update","");
            response.sendRedirect(Pages.ADMIN_MAIN_PAGE);
        }
        else
        {
            Log.addAdminLog("尝试访问管理员页面。",adminName);
            response.sendRedirect(Pages.ADMIN_LOGIN_PAGE);
        }
    }
}
