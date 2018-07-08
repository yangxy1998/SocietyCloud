package controller.servlet.user;

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
 * Created by Administrator on 2018/7/4.
 * @see Parameter
 * @see Attribute
 *
 */

@Parameter({"username","password"})
@Attribute(id="user",type = User.class)
public class LoginServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String address=request.getRemoteAddr();
        User user= Managers.UserManager.getUserByName(username);
        RequestDispatcher dispatcher;
        //账号不存在
        if(user==null){
            Log.addErrorLog("不存在的用户名："+username);
            response.sendRedirect("/login/login.html");
        }
        //密码不一致
        else if(!password.equals(user.getPassword())){
            Log.addErrorLog("用户 "+username+" 输入的密码不正确："+password);
            Log.addUserLog("从["+address+"]尝试登录，但密码错误。",username);
            response.sendRedirect("/login/login.html");
        }
        //账号已冻结
        else if(user.getStatus()!=0){
            Log.addErrorLog("用户 "+username+" 尝试登录，提示此账号已被冻结。");
            Log.addUserLog("从["+address+"]尝试登录，但账号已冻结。",username);
            response.sendRedirect("/login/login.html");
        }
        else if(user.isLogin()){
            Log.addErrorLog("用户 "+username+" 尝试登录，此账号已有在其他地点登录。");
            Log.addUserLog("从["+address+"]尝试登录，但帐号已登录。",username);
            response.sendRedirect("/login/login.html");
        }
        //成功
        else {
            Log.addLog("用户 "+username+" 成功登录。用户Id为 "+user.getUserId());
            Log.addUserLog("从["+address+"]成功登录。",username);
            HttpSession session=request.getSession();
            session.setAttribute("user",user);
            dispatcher=request.getRequestDispatcher("/welcome");
            dispatcher.forward(request,response);
        }

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
