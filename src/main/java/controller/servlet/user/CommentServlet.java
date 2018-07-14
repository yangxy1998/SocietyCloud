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
public class CommentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession(false);
        User user=(User)session.getAttribute("user");
        Society society=(Society)session.getAttribute("society");
        String comment=request.getParameter("comment");
        if(comment!=null||!comment.equals("")){
            Managers.CommentManager.commentToSociety(user.getUserId(),society.getSocietyId(), Creator.getTime(),comment);
            session.setAttribute("user",user);
            session.setAttribute("society",society);
            response.sendRedirect(Pages.SOCIETY_COMMENT_PAGE);
        }
        else{
            session.setAttribute("alert",Creator.getAlert("评论不可以为空！"));
            response.sendRedirect(Pages.SOCIETY_COMMENT_PAGE);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
