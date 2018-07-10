package controller.servlet.admin;

import controller.tools.admin.AdminTool;
import controller.tools.admin.AdminUserTool;
import model.Managers;
import util.Log;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

/**
 * 用户管理Servlet
 * Created by Administrator on 2018/7/8.
 * @author 杨晓宇
 * @author 林志宸
 */
@WebServlet(name = "AdminUserServlet")
public class AdminUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher diapatcher=request.getRequestDispatcher("./admin/admin.jsp");
        Enumeration<String> parameterNames=request.getParameterNames();
        HttpSession session=request.getSession();
        String adminName=(String) request.getAttribute("adminName");
        while (parameterNames.hasMoreElements()){
            String parameterName=parameterNames.nextElement();
            String operation= AdminTool.getOperation(parameterName);
            if(operation!=null){
                String userId=AdminTool.getId(parameterName);
                if(operation.equals("create")){
                    Log.addAdminLog("尝试建立一个用户。",adminName);
                    session.setAttribute("update",userId);
                }
                else if(operation.equals("update")){
                    Log.addAdminLog("尝试修改用户"+userId+"的信息。",adminName);
                    session.setAttribute("update",userId);
                }
                else if(operation.equals("remove")){
                    Log.addAdminLog("尝试移除用户"+userId+"的信息。",adminName);
                    session.setAttribute("update","");
                    Managers.UserManager.deleteUser(userId);
                    Log.addAdminLog("移除用户"+userId+"操作成功。",adminName);
                }
                else if(operation.equals("commit")){
                    request.setAttribute("update","");
                    if(userId.equals("newUser")){
                        String newUserId=request.getParameter("userId");
                        String newUserName=request.getParameter("userName");
                        String newPassword=request.getParameter("password");
                        String newPhoneNum=request.getParameter("phoneNum");
                        Managers.UserManager.createUser(newUserId,newUserName,newPassword,newPhoneNum);
                        Log.addAdminLog("成功添加一个用户，其用户ID为："+userId+"。",adminName);
                    }
                    else {
                        Enumeration<String> parameters=request.getParameterNames();
                        List<String> values=new ArrayList<>();
                        while (parameters.hasMoreElements()){
                            String parameterN=parameters.nextElement();
                            if(AdminUserTool.checkParameter(parameterN))
                                values.add(request.getParameter(parameterN));
                        }
                        Managers.UserManager.updateUser(values.get(0),values.get(1),values.get(2)
                                ,values.get(3),values.get(4),values.get(5),values.get(6),values.get(7)
                                ,values.get(8),Integer.parseInt(values.get(9)),values.get(10));
                        Log.addAdminLog("更新用户"+userId+"的信息，操作成功。",adminName);
                    }
                }
                else {
                    session.setAttribute("update","");
                    Log.addAdminLog("取消之前的操作。",adminName);
                }
            }
        }
        session.setAttribute("users",Managers.UserManager.getAllUsers());
        session.setAttribute("admin", "user");
        diapatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
