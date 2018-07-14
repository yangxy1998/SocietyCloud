package controller.servlet.user;

import controller.tools.admin.AdminTool;
import controller.tools.user.FoundTool;
import controller.tools.user.ManageSocietyTool;
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
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

/**
 * Created by Administrator on 2018/7/13.
 */
public class ManageSocietyServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Enumeration<String> parameterNames=request.getParameterNames();
        HttpSession session=request.getSession(false);
        Society society=(Society) session.getAttribute("society");
        User user=(User) session.getAttribute("user");
        while(parameterNames.hasMoreElements()){
            String parameterName=parameterNames.nextElement();
            if(request.getParameter(parameterName)!=null){
                String operation= AdminTool.getOperation(parameterName);
                String id=AdminTool.getId(parameterName);
                if(("changePriority").equals(operation)){
                    int priority=Integer.parseInt(request.getParameter("priority"));
                    Managers.ManageManager.removePriority(id,society.getSocietyId());
                    Managers.ManageManager.givePriority(id,society.getSocietyId(),priority);
                }
                else if(("givePriority").equals(operation)){
                    int priority=Integer.parseInt(request.getParameter("priority"));
                    Managers.ManageManager.givePriority(id,society.getSocietyId(),priority);
                }
                else if(("changeInformation").equals(operation)){
                    Enumeration<String> parameters=request.getParameterNames();
                    List<String> values=new ArrayList<>();
                    while (parameters.hasMoreElements()){
                        String parameterN=parameters.nextElement();
                        if(FoundTool.checkParameter(parameterN))
                            values.add(Creator.getChineseBytes(request.getParameter(parameterN)));
                    }
                    Managers.SocietyManager.updateSociety(society.getSocietyId(),values.get(0),values.get(1),
                            values.get(2),values.get(3),values.get(4),values.get(5),society.getStatus(),values.get(6));
                }
                else if(("pass").equals(operation)){
                    Managers.JoinManager.passApplication(id,society.getSocietyId(),user.getUserId());
                }
                else if(("deny").equals(operation)){
                    Managers.JoinManager.denyApplication(id,society.getSocietyId(),user.getUserId());
                }
                else if(("summit").equals(operation)){
                    String userId= ManageSocietyTool.getCommentUserId(id);
                    String commentDate=ManageSocietyTool.getCommentDate(id);
                    Managers.CommentManager.summitComment(userId,society.getSocietyId(),commentDate);
                }
                else if(("show").equals(operation)){
                    String userId= ManageSocietyTool.getCommentUserId(id);
                    String commentDate=ManageSocietyTool.getCommentDate(id);
                    Managers.CommentManager.showComment(userId,society.getSocietyId(),commentDate);
                }
                else if(("hide").equals(operation)){
                    String userId= ManageSocietyTool.getCommentUserId(id);
                    String commentDate=ManageSocietyTool.getCommentDate(id);
                    Managers.CommentManager.hideComment(userId,society.getSocietyId(),commentDate);
                }
            }
        }
        response.sendRedirect(Pages.SOCIETY_MANAGE_PAGE);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession(false);
        String societyName=request.getParameter("societyName");
        if(societyName!=null)session.setAttribute("society",Managers.SocietyManager.getSocietyByName(societyName));
        response.sendRedirect(Pages.SOCIETY_MANAGE_PAGE);
    }
}
