package controller.servlet.user;

import model.Managers;
import model.entity.User;
import util.annotation.Attribute;
import util.annotation.Parameter;
import util.function.Creator;
import util.Log;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 登录Servlet
 * Created by Administrator on 2018/7/4.
 * @see Parameter
 * @see Attribute
 * @author 杨晓宇
 * @author 林志宸
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
        HttpSession session=request.getSession();
        session.setAttribute("alert", "");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        //账号不存在
        if(user==null){
            Log.addErrorLog("不存在的用户名："+username);
            session.setAttribute("alert", Creator.getAlert("您输入的用户名不存在。"));
            response.sendRedirect("./login/login.jsp");
        }
        //密码不一致
        else if(!password.equals(user.getPassword())){
            Log.addErrorLog("用户 "+username+" 输入的密码不正确："+password);
            Log.addUserLog("从["+address+"]尝试登录，但密码错误。",username);
            session.setAttribute("alert", Creator.getAlert("您输入的密码错误"));
            response.sendRedirect("./login/login.jsp");
        }
        //账号已冻结
        else if(user.getStatus()!=0){
            Log.addErrorLog("用户 "+username+" 尝试登录，提示此账号已被冻结。");
            Log.addUserLog("从["+address+"]尝试登录，但账号已冻结。",username);
            session.setAttribute("alert", Creator.getAlert("您的帐号已被冻结，请联系管理员解冻。"));
            response.sendRedirect("./login/login.jsp");
        }
        else if(user.isLogin()){
            Log.addErrorLog("用户 "+username+" 尝试登录，此账号已有在其他地点登录。");
            Log.addUserLog("从["+address+"]尝试登录，但帐号已登录。",username);
            session.setAttribute("alert", Creator.getAlert("此账号已登录，不能重复登录。"));
            response.sendRedirect("./login/login.jsp");
        }
        //成功
        else {
            Log.addLog("用户 "+username+" 成功登录。用户Id为 "+user.getUserId());
            Log.addUserLog("从["+address+"]成功登录。",username);
            session.setAttribute("user",user);
            dispatcher=request.getRequestDispatcher("/welcome");
            dispatcher.forward(request,response);
        }

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("./login/login.jsp");
    }
}
