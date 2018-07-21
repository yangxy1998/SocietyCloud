package controller.servlet.user;

import model.entity.Activity;
import model.entity.Society;
import model.entity.User;
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
 * Created by Administrator on 2018/7/18.
 * @author 杨晓宇
 * @author 林志宸
 */
public class NoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String note;
        HttpSession session=request.getSession(false);
        if(request.getParameter("userNote")!=null){
            note=request.getParameter("userNote");
            User user=(User) session.getAttribute("user");
            Log.addUserLog("记下："+Creator.getChineseBytes(note),user.getUserName());
            response.sendRedirect(Pages.USER_LOG_PAGE);
        }
        else if(request.getParameter("societyNote")!=null){
            note=request.getParameter("societyNote");
            Society society=(Society) session.getAttribute("society");
            User user=(User) session.getAttribute("user");
            Log.addSocietyLog("用户 "+user.getNickName()+" 记载："+Creator.getChineseBytes(note),society.getSocietyName());
            response.sendRedirect(Pages.SOCIETY_LOG_PAGE);
        }
        else if(request.getParameter("activityNote")!=null){
            note=request.getParameter("activityNote");
            Activity activity=(Activity) session.getAttribute("activity");
            User user=(User) session.getAttribute("user");
            Log.addActivityLog("用户 "+user.getNickName()+" 记载："+ Creator.getChineseBytes(note),activity.getActivityId());
            response.sendRedirect(Pages.ACTIVITY_MAIN_PAGE);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
