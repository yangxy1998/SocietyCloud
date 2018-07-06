package controller.servlet;

import controller.tools.RegisterTool;
import model.Managers;
import model.entity.User;
import util.function.Log;
import util.annotation.Attribute;
import util.annotation.Parameter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * Created by Administrator on 2018/7/4.
 * @see Parameter
 * @see Attribute
 *
 */

@Parameter({"username","password","confirmPassword","phoneNum"})
@Attribute(id="user",type = User.class)
public class RegisterServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String confirmPassword=request.getParameter("confirmPassword");
        String phoneNum=request.getParameter("phoneNum");
        String address=request.getRemoteAddr();
        User user= Managers.UserManager.getUserByName(username);
        RequestDispatcher dispatcher;
        //账号已存在
        if(user!=null){
            Log.addErrorLog("用户 "+username+" 尝试注册，提示此用户名已存在。");
            dispatcher=request.getRequestDispatcher("/register/register.html");
            dispatcher.forward(request,response);
        }
        //密码不一致
        if(!password.equals(confirmPassword)){
            Log.addErrorLog("用户 "+username+" 尝试注册，两次输入密码不一致。");
            dispatcher=request.getRequestDispatcher("/register/register.html");
            dispatcher.forward(request,response);
        }
        //成功
        else {
            Managers.UserManager.createUser(RegisterTool.getNewUserId(),username,password,phoneNum);
            user=Managers.UserManager.getUserByName(username);
            if(user==null){
                Log.addErrorLog("用户 "+username+" 尝试注册，但数据库没有及时更新数据。");
                dispatcher=request.getRequestDispatcher("/register/register.html");
                dispatcher.forward(request,response);
            }
            else {
                Log.addLog("用户 "+username+" 尝试注册，注册成功并跳转到初始页面。");
                Log.addUserLog("帐号注册成功，注册地ip："+address,username);
                Log.addUserLog("从["+address+"]成功登录。",username);
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                dispatcher = request.getRequestDispatcher("/welcome");
                dispatcher.forward(request, response);
            }
        }

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
