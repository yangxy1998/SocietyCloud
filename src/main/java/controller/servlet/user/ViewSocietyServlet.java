package controller.servlet.user;

import controller.tools.user.ViewSocietyTool;
import model.Managers;
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

/**
 * Created by Administrator on 2018/7/10.
 * @author 杨晓宇
 * @author 林志宸
 */
public class ViewSocietyServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession(false);
        String societyId= ViewSocietyTool.getSocietyId(request);
        if(societyId!=null){
            Society society=Managers.SocietyManager.getSocietyById(societyId);
            session.setAttribute("society",society );
            Log.addSocietyLog("有用户查看了社团信息。",society.getSocietyName());
            session.setAttribute("society",Managers.SocietyManager.getSocietyById(society.getSocietyId()));
            response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
        }
        else{
            session.setAttribute("alert", Creator.getAlert("加载失败，请重新选择！"));
            response.sendRedirect(Pages.SOCIETY_MALL_PAGE);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String societyName=request.getParameter("societyName");
        HttpSession session=request.getSession(false);
        if(societyName!=null){
            Society society=Managers.SocietyManager.getSocietyByName(societyName);
            session.setAttribute("society",society);
            Log.addSocietyLog("有用户查看了社团信息。",society.getSocietyName());
            response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
        }
        else{
            session.setAttribute("alert", Creator.getAlert("加载失败，请重新选择！"));
            response.sendRedirect(Pages.SOCIETY_MALL_PAGE);
        }
    }
}
