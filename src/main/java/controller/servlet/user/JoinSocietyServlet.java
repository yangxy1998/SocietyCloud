package controller.servlet.user;

import controller.tools.user.ViewSocietyTool;
import model.Managers;
import model.entity.Society;
import model.entity.User;
import model.relation.UserJoinSociety;
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
            UserJoinSociety ujs=ViewSocietyTool.isJoinedIntoSociety(user,society);
            if(ujs!=null){
                session.setAttribute("alert",Creator.getAlert("您已申请过该社团，不能重复申请！"));
                response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
            }
            else{
                Managers.JoinManager.applyToJoinSociety(user.getUserId(),society.getSocietyId(), Creator.getTime());
                Log.addSocietyLog("用户 "+user.getNickName()+" 申请加入社团。",society.getSocietyName());
                Log.addUserLog("你申请加入社团 "+society.getSocietyName()+" 。",user.getUserName());
                session.setAttribute("user",user);
                session.setAttribute("society",society);
                response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
            }
        }
    }
}
