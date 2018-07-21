package controller.servlet.user;

import controller.tools.user.ViewActivityTool;
import model.Managers;
import model.entity.Activity;
import model.entity.User;
import model.relation.UserJoinActivity;
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
 * Created by Administrator on 2018/7/17.
 * @author 杨晓宇
 * @author 林志宸
 */
public class JoinActivityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession(false);
        User user=(User)session.getAttribute("user");
        Activity activity=(Activity) session.getAttribute("activity");
        if(session.getAttribute("joinStatus").equals("参加活动")){
            if(user.getUserName()==null||user.getUserName().equals("")){
                session.setAttribute("alert", Creator.getAlert("您还没有登录，请登录后再加入社团！"));
                response.sendRedirect(Pages.USER_LOGIN_PAGE);
            }
            else if(activity.getLimit().equals("只限社团管理员")&& ViewActivityTool.isManager(user,activity)==null){
                session.setAttribute("alert",Creator.getAlert("当前活动只限管理员参与！"));
                response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
            }
            else if(activity.getLimit().equals("只限社团成员")&&ViewActivityTool.isMember(user,activity)==null){
                session.setAttribute("alert",Creator.getAlert("该活动只限社团成员参与，请确认自己已加入其中一个社团！"));
                response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
            }
            else if(activity.getLimit().equals("只限认证人员")&&(user.getSchoolName()==null||user.getAcademicNum()==null||
                    user.getSchoolName().equals("")||user.getAcademicNum().equals(""))){
                session.setAttribute("alert",Creator.getAlert("该活动只限有学校认证的人员参与，您还没有设置，即将为您跳转到个人中心页面进行设置。"));
                response.sendRedirect(Pages.USER_PERSONAL_CENTER_PAGE);
            }
            else{
                UserJoinActivity uja= ViewActivityTool.isJoinedIntoActivity(user,activity);
                if(uja!=null){
                    session.setAttribute("alert",Creator.getAlert("您已参加了该活动，不能重复申请！"));
                    response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
                }
                else{
                    Managers.JoinActivityManager.joinActivity(user.getUserId(),activity.getActivityId());
                    Log.addActivityLog("用户 "+user.getNickName()+" 参加了活动。",activity.getActivityId());
                    Log.addUserLog("你参加了活动 "+activity.getActivityName()+" 。",user.getUserName());
                    session.setAttribute("activity",Managers.ActivityManager.getActivityById(activity.getActivityId()));
                    session.setAttribute("user",Managers.UserManager.getUserById(user.getUserId()));
                    response.sendRedirect(Pages.ACTIVITY_MAIN_PAGE);
                }
            }
        }
        else if(session.getAttribute("joinStatus").equals("接受邀请")){
            String stat=request.getParameter("stat");
            if(stat.equals("receive")){
                Managers.JoinActivityManager.receiveInvitation(user.getUserId(),activity.getActivityId());
                Log.addActivityLog("用户 "+user.getNickName()+" 接受了活动邀请。",activity.getActivityId());
                Log.addUserLog("你接受了活动 "+activity.getActivityName()+" 的邀请。",user.getUserName());
                session.setAttribute("activity",Managers.ActivityManager.getActivityById(activity.getActivityId()));
                session.setAttribute("user",Managers.UserManager.getUserById(user.getUserId()));
                response.sendRedirect(Pages.ACTIVITY_MAIN_PAGE);
            }
            else if(stat.equals("refuse")){
                Managers.JoinActivityManager.refuseInvitation(user.getUserId(),activity.getActivityId());
                Log.addActivityLog("用户 "+user.getNickName()+" 拒绝了活动邀请。",activity.getActivityId());
                Log.addUserLog("你拒绝了活动 "+activity.getActivityName()+" 的邀请。",user.getUserName());
                session.setAttribute("activity",Managers.ActivityManager.getActivityById(activity.getActivityId()));
                session.setAttribute("user",Managers.UserManager.getUserById(user.getUserId()));
                response.sendRedirect(Pages.ACTIVITY_MAIN_PAGE);
            }
        }
    }
}
