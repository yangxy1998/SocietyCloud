package controller.servlet.user;

import controller.tools.user.ViewCenterTool;
import model.entity.Activity;
import util.function.Creator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/7/17.
 */
public class ViewCenterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String activityType= ViewCenterTool.getActivityType(request);
        String page= ViewCenterTool.getPage(activityType,request);
        HttpSession session=request.getSession(false);
        List<Activity> activities=ViewCenterTool.getShowActivities(page,activityType);
        session.setAttribute("activities",activities);
        session.setAttribute("currentPages",ViewCenterTool.getPages(activityType));
        session.setAttribute("currentPage",page);
        session.setAttribute("types", Creator.getActivityTypes());
        response.sendRedirect("../societies/center.jsp");
    }
}
