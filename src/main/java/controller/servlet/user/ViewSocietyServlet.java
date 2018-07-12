package controller.servlet.user;

import model.Managers;
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

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String societyName=request.getParameter("societyId");
        HttpSession session=request.getSession();
        if(societyName!=null){
            session.setAttribute("society", Managers.SocietyManager.getSocietyByName(societyName));
            response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
        }

    }
}
