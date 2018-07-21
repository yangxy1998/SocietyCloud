package controller.servlet.user;

import controller.tools.user.ViewActivityTool;
import model.Managers;
import model.entity.Activity;
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
public class ViewActivityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession(false);
        String activityId= ViewActivityTool.getActivityId(request);
        if(activityId!=null){
            Activity activity= Managers.ActivityManager.getActivityById(activityId);
            session.setAttribute("activity",activity );
            Log.addActivityLog("有用户查看了活动信息。",activityId);
            session.setAttribute("activity",activity);
            response.sendRedirect(Pages.ACTIVITY_MAIN_PAGE);
        }
        else{
            session.setAttribute("alert", Creator.getAlert("加载失败，请重新选择！"));
            response.sendRedirect(Pages.ACTIVITY_CENTER_PAGE);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession(false);
        String activityId=request.getParameter("activityId");
        if(activityId!=null){
            Activity activity= Managers.ActivityManager.getActivityById(activityId);
            session.setAttribute("activity",activity );
            Log.addActivityLog("有用户查看了活动信息。",activityId);
            session.setAttribute("activity",activity);
            response.sendRedirect(Pages.ACTIVITY_MAIN_PAGE);
        }
        else{
            session.setAttribute("alert", Creator.getAlert("加载失败，请重新选择！"));
            response.sendRedirect(Pages.ACTIVITY_CENTER_PAGE);
        }
    }
}
