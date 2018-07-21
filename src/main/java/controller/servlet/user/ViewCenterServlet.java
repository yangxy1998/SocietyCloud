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
 * @author 杨晓宇
 * @author 林志宸
 */
public class ViewCenterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession(false);
        String keyword= ViewCenterTool.getKeyword(request);
        List<Activity> activities;
        String page;
        List<String> pages;
        try {
            if(keyword!=null){
                page=ViewCenterTool.getPageWithKeyword(keyword,request);
                activities=ViewCenterTool.getShowActivitiesWithKeyword(page,keyword);
                pages=ViewCenterTool.getPagesWithKeyword(keyword);
            }
            else{
                String activityType= ViewCenterTool.getActivityType(request);
                page= ViewCenterTool.getPage(activityType,request);
                activities=ViewCenterTool.getShowActivities(page,activityType);
                pages=ViewCenterTool.getPages(activityType);
            }
            session.setAttribute("activities",activities);
            session.setAttribute("currentPages",pages);
            session.setAttribute("currentPage",page);
            session.setAttribute("types", Creator.getActivityTypes());
        }catch (InterruptedException e){
            e.printStackTrace();
        }

        response.sendRedirect("../societies/center.jsp");
    }
}
