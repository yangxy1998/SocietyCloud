package controller.servlet.user;

import controller.tools.user.ViewSocietyTool;
import model.Managers;
import model.entity.Society;
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
 */
public class ViewSocietyServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession(false);
        String societyId= ViewSocietyTool.getSocietyId(request);
        if(societyId!=null){
            Society society=Managers.SocietyManager.getSocietyById(societyId);
            session.setAttribute("society",society );
            response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
        }
        else{
            session.setAttribute("alert", Creator.getAlert("加载失败，请重新选择！"));
            response.sendRedirect(Pages.SOCIETY_MALL_PAGE);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
