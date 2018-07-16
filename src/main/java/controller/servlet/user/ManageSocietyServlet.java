package controller.servlet.user;

import controller.tools.admin.AdminTool;
import controller.tools.user.FoundTool;
import controller.tools.user.ManageSocietyTool;
import model.Managers;
import model.entity.Society;
import model.entity.User;
import model.relation.UserManageSociety;
import util.Log;
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
        if(user.getUserName()==null||user.getUserName().equals("")){
            session.setAttribute("alert",Creator.getAlert("您还没有登录，请登录后再管理社团！"));
            response.sendRedirect(Pages.USER_LOGIN_PAGE);
        }
        else if(society.getStatus()==0){
            session.setAttribute("alert",Creator.getAlert("当前社团还没有被管理员审核通过，审核通过后才可使用社团管理功能！"));
            response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
        }
        else if(society.getStatus()==-1){
            session.setAttribute("alert",Creator.getAlert("当前社团已被冻结，请等待管理员解冻后管理社团！"));
            response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
        }
        else{
            while(parameterNames.hasMoreElements()){
                String parameterName=parameterNames.nextElement();
                if(request.getParameter(parameterName)!=null){
                    String operation= AdminTool.getOperation(parameterName);
                    String id=AdminTool.getId(parameterName);
                    if(("changePriority").equals(operation)){
                        int priority=Integer.parseInt(request.getParameter("priority"));
                        Managers.ManageManager.removePriority(id,society.getSocietyId());
                        Managers.ManageManager.givePriority(id,society.getSocietyId(),priority);
                        Log.addUserLog(user.getNickName()+" 将你在社团 "+society.getSocietyName()+" 的权限修改为 "
                                + UserManageSociety.getPriority(priority)+"。",Managers.UserManager.getUserById(id).getUserName());
                        Log.addUserLog("将 "+user.getNickName()+" 在社团 "+society.getSocietyName()+" 的权限修改为 "
                                + UserManageSociety.getPriority(priority)+"。",user.getUserName());
                        Log.addSocietyLog(user.getNickName()+" 将用户 "+Managers.UserManager.getUserById(id).getNickName()
                                +" 的权限修改为 "+ UserManageSociety.getPriority(priority)+"。",society.getSocietyName());
                    }
                    else if(("givePriority").equals(operation)){
                        int priority=Integer.parseInt(request.getParameter("priority"));
                        Managers.ManageManager.givePriority(id,society.getSocietyId(),priority);
                        Log.addUserLog(user.getNickName()+" 将你在社团"+society.getSocietyName()+"的权限授予为 "
                                + UserManageSociety.getPriority(priority)+"。",Managers.UserManager.getUserById(id).getUserName());
                        Log.addUserLog("为用户 "+user.getNickName()+" 在社团 "+society.getSocietyName()+" 授予权限 "
                                + UserManageSociety.getPriority(priority)+"。",user.getUserName());
                        Log.addSocietyLog(user.getNickName()+" 将用户 "+Managers.UserManager.getUserById(id).getNickName()
                                +" 的权限授予为 "+ UserManageSociety.getPriority(priority)+"。",society.getSocietyName());
                    }
                    else if(("changeInformation").equals(operation)){
                        Enumeration<String> parameters=request.getParameterNames();
                        List<String> values=new ArrayList<>();
                        while (parameters.hasMoreElements()){
                            String parameterN=parameters.nextElement();
                            if(FoundTool.checkParameter(parameterN))
                                values.add(Creator.getChineseBytes(request.getParameter(parameterN)));
                        }
                        if(Managers.SocietyManager.getSocietyByName(values.get(0))!=null){
                            session.setAttribute("alert",Creator.getAlert("社团名已被注册，请尝试使用其他社团名。"));
                            Log.addErrorLog(user.getUserName()+"尝试创建社团，但此社团名已被注册。");
                            response.sendRedirect(Pages.USER_FOUND_SOCIETY_PAGE);
                        }
                        else if(values.get(0).length()>=64){
                            session.setAttribute("alert",Creator.getAlert("社团名不能超过64字节！"));
                            response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
                        }
                        else if(values.size()<6){
                            session.setAttribute("alert",Creator.getAlert("您还有信息没有正确填写！"));
                            response.sendRedirect(Pages.SOCIETY_MAIN_PAGE);
                        }
                        Managers.SocietyManager.updateSociety(society.getSocietyId(),values.get(0),values.get(1),
                                values.get(2),values.get(3),values.get(4),values.get(5),society.getStatus(),values.get(6));
                        Log.addUserLog("修改了社团 "+society.getSocietyName()+"的信息",user.getUserId());
                        Log.addSocietyLog("用户 "+user.getNickName()+" 修改了社团基本信息。",society.getSocietyName());
                    }
                    else if(("pass").equals(operation)){
                        Managers.JoinManager.passApplication(id,society.getSocietyId(),user.getUserId());
                        Log.addSocietyLog("管理员 "+user.getNickName()+" 通过了用户 " +Managers.UserManager.getUserById(id).getNickName()
                                +" 的社团申请。",society.getSocietyName());
                        Log.addUserLog("你通过了用户 " +Managers.UserManager.getUserById(id).getNickName()+" 在社团 "+society.getSocietyName()
                                +" 的社团申请。",user.getUserName());
                        Log.addUserLog("你对社团 "+society.getSocietyName()+" 的申请被通过。",Managers.UserManager.getUserById(id).getUserName());
                    }
                    else if(("deny").equals(operation)){
                        Managers.JoinManager.denyApplication(id,society.getSocietyId(),user.getUserId());
                        Log.addSocietyLog("管理员 "+user.getNickName()+" 拒绝或踢出了用户 " +Managers.UserManager.getUserById(id).getNickName()
                                +"。",society.getSocietyName());
                        Log.addUserLog("你拒绝或踢出了用户 " +Managers.UserManager.getUserById(id).getNickName()+" 在社团 "+society.getSocietyName()
                                +" 的社团申请。",user.getUserName());
                        Log.addUserLog("你对社团 "+society.getSocietyName()+" 的申请被拒绝或您被该社团踢出。",Managers.UserManager.getUserById(id).getUserName());
                    }
                    else if(("summit").equals(operation)){
                        String userId= ManageSocietyTool.getCommentUserId(id);
                        String commentDate=ManageSocietyTool.getCommentDate(id);
                        Managers.CommentManager.summitComment(userId,society.getSocietyId(),commentDate);
                        Log.addSocietyLog("管理员 "+user.getNickName()+" 将用户 " +Managers.UserManager.getUserById(id).getNickName()
                                +" 于 "+commentDate+" 发表的评论置顶。",society.getSocietyName());
                        Log.addUserLog("你将用户 " +Managers.UserManager.getUserById(id).getNickName()+" 于 "+commentDate
                                +" 在社团 "+society.getSocietyName() +" 发表的评论置顶。",user.getUserName());
                        Log.addUserLog("你对社团 "+society.getSocietyName()+" 于 "+commentDate+"发表的评论被置顶。",Managers.UserManager.getUserById(id).getUserName());
                    }
                    else if(("show").equals(operation)){
                        String userId= ManageSocietyTool.getCommentUserId(id);
                        String commentDate=ManageSocietyTool.getCommentDate(id);
                        Managers.CommentManager.showComment(userId,society.getSocietyId(),commentDate);
                        Log.addSocietyLog("管理员 "+user.getNickName()+" 将用户 " +Managers.UserManager.getUserById(id).getNickName()
                                +" 于 "+commentDate+" 发表的评论正常显示。",society.getSocietyName());
                        Log.addUserLog("你将用户 " +Managers.UserManager.getUserById(id).getNickName()+" 于 "+commentDate
                                +" 在社团 "+society.getSocietyName() +" 发表的评论正常显示。",user.getUserName());
                        Log.addUserLog("你对社团 "+society.getSocietyName()+" 于 "+commentDate+"发表的评论正常显示。",Managers.UserManager.getUserById(id).getUserName());
                    }
                    else if(("hide").equals(operation)){
                        String userId= ManageSocietyTool.getCommentUserId(id);
                        String commentDate=ManageSocietyTool.getCommentDate(id);
                        Managers.CommentManager.hideComment(userId,society.getSocietyId(),commentDate);
                        Log.addSocietyLog("管理员 "+user.getNickName()+" 将用户 " +Managers.UserManager.getUserById(id).getNickName()
                                +" 于 "+commentDate+" 发表的评论隐藏。",society.getSocietyName());
                        Log.addUserLog("你将用户 " +Managers.UserManager.getUserById(id).getNickName()+" 于 "+commentDate
                                +" 在社团 "+society.getSocietyName() +" 发表的评论隐藏。",user.getUserName());
                        Log.addUserLog("你对社团 "+society.getSocietyName()+" 于 "+commentDate+"发表的评论被隐藏。",Managers.UserManager.getUserById(id).getUserName());
                    }
                }
            }
            session.setAttribute("society",Managers.SocietyManager.getSocietyById(society.getSocietyId()));
            session.setAttribute("user",Managers.UserManager.getUserById(user.getUserId()));
            response.sendRedirect(Pages.SOCIETY_MANAGE_PAGE);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession(false);
        String societyName=request.getParameter("societyName");
        if(societyName!=null)session.setAttribute("society",Managers.SocietyManager.getSocietyByName(societyName));
        response.sendRedirect(Pages.SOCIETY_MANAGE_PAGE);
    }
}
