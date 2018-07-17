package controller.tools.user;

import model.entity.Activity;
import model.entity.Society;
import model.entity.User;
import model.relation.SocietyOrganizeActivity;
import model.relation.UserJoinActivity;
import model.relation.UserJoinSociety;
import model.relation.UserManageSociety;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.List;

/**
 * Created by Administrator on 2018/7/17.
 */
public class ViewActivityTool {

    public static String getActivityId(HttpServletRequest request){
        HttpSession session=request.getSession(false);
        Enumeration<String> parameters=request.getParameterNames();
        List<Activity> activities=(List<Activity>)session.getAttribute("activities");
        if(parameters.hasMoreElements()){
            String activityId=parameters.nextElement();
            for(Activity activity:activities){
                if(activity.getActivityId().equals(activityId))return activityId;
            }
        }
        return null;
    }

    public static UserJoinActivity isJoinedIntoActivity(User user, Activity activity){
        for (UserJoinActivity uja:activity.getJoinUsers()) {
            if(uja.getUserId().equals(user.getUserId()))return uja;
        }
        return null;
    }

    public static UserManageSociety isManager(User user, Activity activity){
        for(SocietyOrganizeActivity soa:activity.getOrganizeSocieties()){
            Society society=soa.getSociety();
            society.init();
            for (UserManageSociety ums:society.getManageUsers()) {
                if(ums.getUserId().equals(user.getUserId()))return ums;
            }
        }
        return null;
    }

    public static UserJoinSociety isMember(User user, Activity activity){
        for(SocietyOrganizeActivity soa:activity.getOrganizeSocieties()){
            for (UserJoinSociety ujs:soa.getSociety().getJoinUsers()) {
                if(ujs.getUserId().equals(user.getUserId()))return ujs;
            }
        }
        return null;
    }
}
