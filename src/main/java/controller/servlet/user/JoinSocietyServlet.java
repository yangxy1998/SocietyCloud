package controller.servlet.user;

import model.Managers;
import model.entity.Society;
import model.entity.User;
import util.function.Creator;
import util.function.Pages;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Administrator on 2018/7/13.
 */
public class JoinSocietyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession(false);
        if(session.getAttribute("joinStatus").equals("加入社团")){
            User user=(User)session.getAttribute("user");
            Society society=(Society)session.getAttribute("society");
            Managers.JoinManager.applyToJoinSociety(user.getUserId(),society.getSocietyId(), Creator.getTime());
            session.setAttribute("user",user);
            session.setAttribute("society",society);
            response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
        }
    }
}
