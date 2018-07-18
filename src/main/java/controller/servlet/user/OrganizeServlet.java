package controller.servlet.user;

import controller.tools.user.OrganizeTool;
import model.Managers;
import model.entity.Activity;
import model.entity.Society;
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
 * Created by Administrator on 2018/7/17.
 */
public class OrganizeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession(false);
        Society society=(Society) session.getAttribute("society");
        if(society.getSocietyName()==null||society.getSocietyName().equals("")){
            session.setAttribute("alert", Creator.getAlert("您还没有登录，请登录后再创建活动！"));
            response.sendRedirect(Pages.USER_LOGIN_PAGE);
        }
        Enumeration<String> parameters=request.getParameterNames();
        List<String> values=new ArrayList<>();
        while (parameters.hasMoreElements()){
            String parameterN=parameters.nextElement();
            if(OrganizeTool.checkParameter(parameterN))
                values.add(Creator.getChineseBytes(request.getParameter(parameterN)));
        }
        if(values.get(0).length()>=64){
            session.setAttribute("alert",Creator.getAlert("活动名不能超过64字节！"));
            response.sendRedirect(Pages.ACTIVITY_ORGANIZE_PAGE);
        }
        else if(values.size()<8){
            session.setAttribute("alert",Creator.getAlert("您还有信息没有正确填写！"));
            response.sendRedirect(Pages.ACTIVITY_ORGANIZE_PAGE);
        }
        else if(values.get(4).compareTo(values.get(5))>0){
            session.setAttribute("alert",Creator.getAlert("结束时间不能在开始时间之前！"));
            response.sendRedirect(Pages.ACTIVITY_ORGANIZE_PAGE);
        }
        else{
            String activityId=OrganizeTool.getNewActivityId();
            Managers.ActivityManager.organizeActivity(activityId,values.get(0),values.get(1),
                    values.get(2),values.get(3),values.get(4),values.get(5),values.get(6),values.get(7));
            if(Managers.ActivityManager.getActivityById(activityId)==null){
                Log.addErrorLog(society.getSocietyName()+"尝试创建活动，但系统错误。");
                session.setAttribute("alert",Creator.getAlert("系统错误，请重试。"));
                response.sendRedirect(Pages.ACTIVITY_ORGANIZE_PAGE);
            }
            else{
                Managers.OrganizeManager.organizeActivity(society.getSocietyId(),activityId);
                Log.addSocietyLog("创建了活动："+values.get(0),society.getSocietyName());
                Log.addActivityLog("活动被 "+society.getSocietyName()+" 社团创建。",activityId);
                session.setAttribute("society",Managers.SocietyManager.getSocietyById(society.getSocietyId()));
                session.setAttribute("activity",Managers.ActivityManager.getActivityById(activityId));
                session.setAttribute("alert",Creator.getAlert("您已成功创建活动。"));
                response.sendRedirect(Pages.ACTIVITY_MAIN_PAGE);
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession(false);
        Activity activity=(Activity) session.getAttribute("activity");
        String userName=request.getParameter("inviteUser");
        String societyName=request.getParameter("inviteSociety");
        if(userName!=null&&!("").equals(userName)){
            User user=Managers.UserManager.getUserByName(userName);
            if(user!=null) {
                Managers.JoinActivityManager.inviteActivity(user.getUserId(), activity.getActivityId());
                Log.addActivityLog("向用户 "+userName+" 发出了邀请。",activity.getActivityId());
            }
            else{
                session.setAttribute("alert",Creator.getAlert("找不到名为"+userName+"的用户！"));
            }
        }
        if(societyName!=null&&!("").equals(societyName)){
            Society society=Managers.SocietyManager.getSocietyByName(societyName);
            if(society!=null){
                Managers.OrganizeManager.inviteSocietyToActivity(society.getSocietyId(),activity.getActivityId());
                Log.addActivityLog("向社团 "+societyName+" 发出了邀请。",activity.getActivityId());
            }
            else{
                session.setAttribute("alert",Creator.getAlert("找不到名为"+societyName+"的社团！"));
            }
        }
        Society society=(Society) session.getAttribute("society");
        String activityId=request.getParameter("activityId");
        if(activityId!=null){
            if(request.getParameter("receive")!=null){
                Managers.OrganizeManager.receiveInvitation(society.getSocietyId(),activityId);
                Log.addActivityLog("社团 "+society.getSocietyName()+" 接受了邀请。",activityId);
            }
            else if(request.getParameter("refuse")!=null){
                Managers.OrganizeManager.refuseInvitation(society.getSocietyId(),activityId);
                Log.addActivityLog("社团 "+society.getSocietyName()+" 拒绝了邀请。",activityId);
            }
        }
        response.sendRedirect(Pages.ACTIVITY_MAIN_PAGE);
    }
}
