package controller.servlet.user;

import controller.tools.user.PersonalTool;
import model.Managers;
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
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

/**
 * Created by Administrator on 2018/7/10.
 */
public class PersonalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession(false);
        User user=(User) session.getAttribute("user");
        if(user.getUserName()==null||user.getUserName().equals("")){
            session.setAttribute("alert",Creator.getAlert("您还没有登录，请登录后再修改个人信息！"));
            response.sendRedirect(Pages.USER_LOGIN_PAGE);
        }
        Enumeration<String> parameters=request.getParameterNames();
        List<String> values=new ArrayList<>();
        while (parameters.hasMoreElements()){
            String parameterN=parameters.nextElement();
            if(PersonalTool.checkParameter(parameterN))
                values.add(Creator.getChineseBytes(request.getParameter(parameterN)));
        }
        boolean notAcademiced=user.getAcademicNum()==null||user.getSchoolName()==null;
        boolean notIdentified=user.getIdCard()==null||user.getRealName()==null;
        Managers.UserManager.updateUser(user.getUserId(),user.getUserName(),user.getPassword(),
                values.get(0),values.get(1),values.get(2),values.get(3),values.get(4),
                values.get(5),user.getStatus(),values.get(6));
        Log.addUserLog("修改了个人信息。",user.getUserName());
        user=Managers.UserManager.getUserById(user.getUserId());
        if(user.getSchoolName()!=null&&user.getAcademicNum()!=null&&notAcademiced) {
            Log.addUserLog("完成了学校信息认证。", user.getUserName());
            session.setAttribute("alert",Creator.getAlert("您完成了学校信息认证，可以申请加入社团了！"));
        }
        if(user.getIdCard()!=null&&user.getRealName()!=null&&notIdentified) {
            Log.addUserLog("完成了个人身份认证。", user.getUserName());
            session.setAttribute("alert",Creator.getAlert("您完成了身份信息认证，可以申请创建社团了！"));
        }
        session.setAttribute("user",user);
        response.sendRedirect(Pages.USER_PERSONAL_CENTER_PAGE);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
