package controller.servlet.user;

import controller.tools.user.FoundTool;
import model.Managers;
import model.entity.User;
import util.Log;
import util.function.Creator;
import util.function.Pages;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

/**
 * 成立社团Servlet
 * Created by Administrator on 2018/7/8.
 * @author 杨晓宇
 * @author 林志宸
 */
public class FoundServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession(false);
        User user=(User) session.getAttribute("user");
        Enumeration<String> parameters=request.getParameterNames();
        List<String> values=new ArrayList<>();
        while (parameters.hasMoreElements()){
            String parameterN=parameters.nextElement();
            if(FoundTool.checkParameter(parameterN))
                values.add(Creator.getChineseBytes(request.getParameter(parameterN)));
        }
        if(Managers.SocietyManager.getSocietyByName(values.get(0))!=null){
            session.setAttribute("alert",Creator.getAlert("社团名已被注册，请尝试使用其他社团名。"));
            Log.addErrorLog(user.getUserName()+"尝试创建社团，但此社团名已被注册。");
            response.sendRedirect(Pages.USER_FOUND_SOCIETY_PAGE);
        }
        else if(values.get(0).length()>=64){
            session.setAttribute("alert",Creator.getAlert("社团名不能超过64字节！"));
            response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
        }
        else if(values.size()<6){
            session.setAttribute("alert",Creator.getAlert("您还有信息没有正确填写！"));
            response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
        }
        else{
            String societyId=FoundTool.getNewSocietyId();
            Managers.SocietyManager.createSociety(societyId,values.get(0),
                    values.get(1),values.get(2),values.get(3),values.get(4),values.get(5));
            if(Managers.SocietyManager.getSocietyById(societyId)==null){
                Log.addErrorLog(user.getUserName()+"尝试创建社团，但系统错误。");
                session.setAttribute("alert",Creator.getAlert("系统错误，请重试。"));
                response.sendRedirect(Pages.USER_FOUND_SOCIETY_PAGE);
            }
            else{
                Managers.JoinManager.applyToJoinSociety(user.getUserId(),societyId,Creator.getTime());
                Managers.JoinManager.passApplication(user.getUserId(),societyId,user.getUserId());
                Managers.ManageManager.givePriority(user.getUserId(),societyId,5);
                Log.addUserLog("创建了社团，社团名为："+values.get(0),user.getUserName());
                Log.addUserLog("加入了社团 "+values.get(0),user.getUserName());
                Log.addUserLog("成为社团 "+values.get(0)+" 的社长。",user.getUserName());
                Log.addSocietyLog("社团被 "+user.getNickName()+" 创建。",values.get(0));
                Log.addSocietyLog(user.getNickName()+" 加入了社团。",values.get(0));
                Log.addSocietyLog(user.getNickName()+" 成为社团拥有者。",values.get(0));
                session.setAttribute("society",Managers.SocietyManager.getSocietyById(societyId));
                session.setAttribute("user",Managers.UserManager.getUserById(user.getUserId()));
                session.setAttribute("alert",Creator.getAlert("您已创建社团，现在可以修改社团的信息。在管理员审核通过后即可使用全部的社团功能了。"));
                response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession(false);
        User user=(User) session.getAttribute("user");
        if(user.getIdCard()==null||user.getRealName()==null||user.getIdCard().equals("")||user.getRealName().equals("")){
            session.setAttribute("alert", Creator.getAlert("您还没有完成身份认证！请前往个人中心填写真实姓名以及身份证号！"));
            response.sendRedirect(Pages.USER_PERSONAL_CENTER_PAGE);
        }
        else{
            response.sendRedirect(Pages.USER_FOUND_SOCIETY_PAGE);
        }

    }
}
