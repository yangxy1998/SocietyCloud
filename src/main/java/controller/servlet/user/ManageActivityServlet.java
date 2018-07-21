package controller.servlet.user;

import controller.tools.user.OrganizeTool;
import controller.tools.user.ViewActivityTool;
import model.Managers;
import model.entity.Activity;
import model.entity.Society;
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
 * Created by Administrator on 2018/7/18.
 * @author 杨晓宇
 * @author 林志宸
 */
public class ManageActivityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Society society = (Society) session.getAttribute("society");
        Activity activity=(Activity) session.getAttribute("activity");
        if (society.getSocietyName() == null || society.getSocietyName().equals("")) {
            session.setAttribute("alert", Creator.getAlert("您还没有登录，请登录后再创建活动！"));
            response.sendRedirect(Pages.USER_LOGIN_PAGE);
        }
        Enumeration<String> parameters = request.getParameterNames();
        List<String> values = new ArrayList<>();
        while (parameters.hasMoreElements()) {
            String parameterN = parameters.nextElement();
            if (OrganizeTool.checkParameter(parameterN))
                values.add(Creator.getChineseBytes(request.getParameter(parameterN)));
        }
        if (values.get(0).length() >= 64) {
            session.setAttribute("alert", Creator.getAlert("活动名不能超过64字节！"));
            response.sendRedirect(Pages.ACTIVITY_MANAGE_PAGE);
        } else if (values.size() < 8) {
            session.setAttribute("alert", Creator.getAlert("您还有信息没有正确填写！"));
            response.sendRedirect(Pages.ACTIVITY_MANAGE_PAGE);
        } else if (values.get(3).compareTo(values.get(4)) > 0) {
            session.setAttribute("alert", Creator.getAlert("结束时间不能在开始时间之前！"));
            response.sendRedirect(Pages.ACTIVITY_MANAGE_PAGE);
        } else {
            Managers.ActivityManager.updateActivity(activity.getActivityId(), values.get(0), values.get(1),
                    values.get(2), values.get(3), values.get(4), values.get(5), values.get(6), values.get(7));
            Log.addSocietyLog("修改了活动：" + values.get(0) + "的信息。", society.getSocietyName());
            Log.addActivityLog("活动信息被 " + society.getSocietyName() + " 社团修改。", activity.getActivityId());
            session.setAttribute("society", Managers.SocietyManager.getSocietyById(society.getSocietyId()));
            session.setAttribute("activity", Managers.ActivityManager.getActivityById(activity.getActivityId()));
            session.setAttribute("alert", Creator.getAlert("活动信息已经成功修改。"));
            response.sendRedirect(Pages.ACTIVITY_MAIN_PAGE);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String activityId= ViewActivityTool.getActivityId(request);
        if(activityId!=null){
            Activity activity= Managers.ActivityManager.getActivityById(activityId);
            session.setAttribute("activity",activity);
            response.sendRedirect(Pages.ACTIVITY_MANAGE_PAGE);
        }
        else{
            session.setAttribute("alert", Creator.getAlert("加载失败，请重新选择！"));
            response.sendRedirect(Pages.ACTIVITY_CENTER_PAGE);
        }

    }
}
