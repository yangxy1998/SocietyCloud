package controller.servlet;

import model.Managers;
import model.entity.Activity;
import model.entity.Society;
import model.entity.User;
import org.json.JSONObject;
import util.Log;
import util.function.Creator;

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

        String type=request.getParameter("type");
        String id=request.getParameter("id");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");
        PrintWriter out=response.getWriter();
        if(("user").equals(type)){
            User user=Managers.UserManager.getUserById(id);
            JSONObject object=user.getJSONObject();
            out.append(object.toString());
        }
        else if(("society").equals(type)){
            Society society=Managers.SocietyManager.getSocietyById(id);
            JSONObject object=society.getJSONObject();
            out.append(object.toString());
        }
        else if(("activity").equals(type)){
            Activity activity=Managers.ActivityManager.getActivityById(id);
            JSONObject object=activity.getJSONObject();
            out.append(object.toString());
        }
        else if(("log").equals(type)){
            String logType=request.getParameter("logType");
            String attribute=request.getParameter("attribute");
            if(("user").equals(logType)){
                for (Log log:Managers.LogManager.getUserLogs(attribute)) {
                    out.append(log.getJSONObject().toString());
                }
            }
            else if(("society").equals(logType)){
                for (Log log:Managers.LogManager.getSocietyLogs(attribute)) {
                    out.append(log.getJSONObject().toString());
                }
            }
            else if(("activity").equals(logType)){
                for (Log log:Managers.LogManager.getActivityLogs(attribute)) {
                    out.append(log.getJSONObject().toString());
                }
            }
        }
        else if(("add").equals(type)){
            String logType=request.getParameter("logType");
            String attribute=request.getParameter("attribute");
            String log=request.getParameter("log");
            if(logType!=null&&attribute!=null&&log!=null){
                Managers.LogManager.addLog(Creator.getTime(),log,type,attribute);
            }
        }
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
