package controller.servlet;

import model.Managers;
import model.entity.Activity;
import model.entity.Society;
import model.entity.User;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Administrator on 2018/7/17.
 */
public class JSONServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String type=(String) request.getAttribute("type");
        String id=(String) request.getAttribute("id");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");
        PrintWriter out=response.getWriter();
        if(type.equals("user")){
            User user=Managers.UserManager.getUserById(id);
            JSONObject object=user.getJSONObject();
            out.append(object.toString());
        }
        else if(type.equals("society")){
            Society society=Managers.SocietyManager.getSocietyById(id);
            JSONObject object=society.getJSONObject();
            out.append(object.toString());
        }
        else if(type.equals("activity")){
            Activity activity=Managers.ActivityManager.getActivityById(id);
            JSONObject object=activity.getJSONObject();
            out.append(object.toString());
        }
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
