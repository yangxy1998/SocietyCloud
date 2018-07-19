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

        String entity=request.getParameter("entity");
        String id=request.getParameter("id");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");
        PrintWriter out=response.getWriter();
        if(("user").equals(entity)){
            User user=Managers.UserManager.getUserById(id);
            JSONObject object=user.getJSONObject();
            out.append(object.toString());
        }
        else if(("society").equals(entity)){
            Society society=Managers.SocietyManager.getSocietyById(id);
            JSONObject object=society.getJSONObject();
            out.append(object.toString());
        }
        else if(("activity").equals(entity)){
            Activity activity=Managers.ActivityManager.getActivityById(id);
            JSONObject object=activity.getJSONObject();
            out.append(object.toString());
        }
        else if(("log").equals(entity)){
            String logType=request.getParameter("logType");
            if(("user").equals(logType)){
                //这里的id是用户名
                for (Log log:Managers.LogManager.getUserLogs(id)) {
                    out.append(log.getJSONObject().toString());
                }
            }
            else if(("society").equals(logType)){
                //这里的id是社团名
                for (Log log:Managers.LogManager.getSocietyLogs(id)) {
                    out.append(log.getJSONObject().toString());
                }
            }
            else if(("activity").equals(logType)){
                for (Log log:Managers.LogManager.getActivityLogs(id)) {
                    out.append(log.getJSONObject().toString());
                }
            }
        }
        else if(("add").equals(entity)){
            String logType=request.getParameter("logType");
            String log=request.getParameter("log");
            if(logType!=null&&id!=null&&log!=null){
                Managers.LogManager.addLog(Creator.getTime(),log,entity,id);
            }
        }
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
