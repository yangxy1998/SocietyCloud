package controller.servlet.user;

import controller.tools.user.ViewSocietyTool;
import model.Managers;
import model.entity.Society;
import model.entity.User;
import model.relation.UserJoinSociety;
import util.Log;
import util.function.Creator;
import util.function.Pages;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Administrator on 2018/7/13.
 * @author 杨晓宇
 * @author 林志宸
 */
public class JoinSocietyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession(false);
        if(session.getAttribute("joinStatus").equals("加入社团")){
            User user=(User)session.getAttribute("user");
            Society society=(Society)session.getAttribute("society");
            if(user.getUserName()==null||user.getUserName().equals("")){
                session.setAttribute("alert",Creator.getAlert("您还没有登录，请登录后再加入社团！"));
                response.sendRedirect(Pages.USER_LOGIN_PAGE);
            }
            else if(society.getStatus()==0){
                session.setAttribute("alert",Creator.getAlert("当前社团还没有被管理员审核通过，请等待审核通过后加入！"));
                response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
            }
            else if(society.getStatus()==-1){
                session.setAttribute("alert",Creator.getAlert("当前社团已被冻结，请等待管理员解冻后加入！"));
                response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
            }
            else if(user.getSchoolName()==null||user.getAcademicNum()==null||
                    user.getSchoolName().equals("")||user.getAcademicNum().equals("")){
                session.setAttribute("alert",Creator.getAlert("您还没有设置学校认证信息，为您跳转到个人中心页面进行设置。"));
                response.sendRedirect(Pages.USER_PERSONAL_CENTER_PAGE);
            }
            else{
                UserJoinSociety ujs=ViewSocietyTool.isJoinedIntoSociety(user,society);
                if(ujs!=null){
                    session.setAttribute("alert",Creator.getAlert("您已申请过该社团，不能重复申请！"));
                    response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
                }
                else{
                    Managers.JoinSocietyManager.applyToJoinSociety(user.getUserId(),society.getSocietyId(), Creator.getTime());
                    Log.addSocietyLog("用户 "+user.getNickName()+" 申请加入社团。",society.getSocietyName());
                    Log.addUserLog("你申请加入社团 "+society.getSocietyName()+" 。",user.getUserName());
                    session.setAttribute("society",Managers.SocietyManager.getSocietyById(society.getSocietyId()));
                    session.setAttribute("user",Managers.UserManager.getUserById(user.getUserId()));
                    response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
                }
            }
        }
    }
}
