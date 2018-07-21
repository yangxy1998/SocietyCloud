package controller.servlet;

import model.Managers;
import model.entity.Activity;
import model.entity.Society;
import model.entity.User;
import model.relation.UserJoinActivity;
import model.relation.UserJoinSociety;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import org.json.JSONObject;
import util.Log;
import util.function.Creator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

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
            JSONObject object=new JSONObject();
            object.put("userdetail",user.getJSONObject());
            List<Log> logList = new ArrayList<Log>();
            for (Log log:Managers.LogManager.getUserLogs(user.getUserName())) {
                logList.add(log);
            }
            //用户加入的社团信息
            /*List<Society> societyList=new ArrayList<>();*/
            JSONArray societyArray = new JSONArray();
            for(UserJoinSociety ujs:Managers.JoinSocietyManager.getSocietiesByUserId(id)){
                if(ujs.getStatus()==1){
                    JSONObject object1=ujs.getSociety().getJSONObject();
                    societyArray.add(object1.toString());
                }
            }
            //用户参加的活动信息
            JSONArray activityArray = new JSONArray();
            /*List<Activity> activityList=new ArrayList<>();*/
            for(UserJoinActivity uja:Managers.JoinActivityManager.getActivitiesByUserId(id)){
                if(uja.getStatus()==1)activityArray.add(uja.getActivity().getJSONObject().toString());

            }

            JsonConfig config=new JsonConfig();
            config.setExcludes(new String[]{"JSONObject"});
            JSONArray logArray = JSONArray.fromObject(logList,config);
            /*JSONArray societyArray=JSONArray.fromObject(societyList,config);
            JSONArray activityArray=JSONArray.fromObject(activityList,config);*/
            /*String params = jsonArray.toString();*/
            object.put("logList",logArray);
            object.put("societyList",societyArray);
            object.put("activityList",activityArray);
            out.append(object.toString());
        }
        else if(("society").equals(entity)){
            Society society=Managers.SocietyManager.getSocietyById(id);
            JSONObject object=new JSONObject();
            object.put("society",society.getJSONObject());
            out.append(object.toString());
        }
        else if(("activity").equals(entity)){
            Activity activity=Managers.ActivityManager.getActivityById(id);
            JSONObject object=new JSONObject();
            object.put("activity",activity.getJSONObject());
            /*List<Log> logList = new ArrayList<Log>();
            for (Log log:Managers.LogManager.getUserLogs(id)) {
                logList.add(log);
            }*/
            //活动日志
            /*JsonConfig config=new JsonConfig();
            config.setExcludes(new String[]{"JSONObject"});
            JSONArray logArray = JSONArray.fromObject(logList,config);
            object.put("logList",logArray);*/

            out.append(object.toString());
        }
        else if(("add").equals(entity)){
            String logType=request.getParameter("logType");
            String log=request.getParameter("log");
            if(logType!=null&&id!=null&&log!=null){
                Managers.LogManager.addLog(Creator.getTime(),"记下："+Creator.getChineseBytes(log),logType,Managers.UserManager.getUserById(id).getUserName());
            }
        }else if (("login").equals(entity)){
            String username = request.getParameter("username");
            String passward = request.getParameter("passward");
            User user=Managers.UserManager.getUserByName(username);
            if(user.getPassword().equals(passward)){
                JSONObject object=user.getJSONObject();
                out.append(object.toString());
            }else {

            }

        }
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
