package util.function;

import java.util.ArrayList;
import java.util.List;

/**
 *
 *
 * 日志类
 *
 *
 *
 * @author 杨晓宇
 * Created by Administrator on 2018/7/6.
 */
public class Log {

    //日志时间
    private String time;

    //日志内容
    private String log;

    /**
     * 日志类型
     * event 普通事件日志
     * error 错误日志
     * user 用户日志
     * society 社团日志
     * admin 网站管理员日志
     */
    private String type;

    //日志属性
    private String attribute;

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getLog() {
        return log;
    }

    public void setLog(String log) {
        this.log = log;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAttribute() {
        return attribute;
    }

    public void setAttribute(String attribute) {
        this.attribute = attribute;
    }

    //当前日志
    private static Log currentLog=new Log();
    //日志列表
    private static List<Log> logs=new ArrayList<>();

    /**
     * 添加普通事件日志
     * @param log 普通事件日志
     */
    public static void addLog(String log){
        currentLog=new Log();
        currentLog.time= Creator.getTime();
        currentLog.log=log;
        currentLog.type=("event");
        logs.add(currentLog);
        showLog();
    }

    /**
     * 添加错误日志
     * @param errorLog 错误日志
     */
    public static void addErrorLog(String errorLog){
        currentLog=new Log();
        currentLog.time= Creator.getTime();
        currentLog.log=errorLog;
        currentLog.type=("error");
        logs.add(currentLog);
        showLog();
    }

    /**
     * 添加用户日志
     * @param userLog 用户日志
     */
    public static void addUserLog(String userLog,String userName){
        currentLog=new Log();
        currentLog.time= Creator.getTime();
        currentLog.log=userLog;
        currentLog.type=("user");
        currentLog.attribute=userName;
        logs.add(currentLog);
        showLog();
    }

    /**
     * 添加社团管理日志
     * @param societyLog 社团日志
     */
    public static void addSocietyLog(String societyLog,String societyName){
        currentLog=new Log();
        currentLog.time= Creator.getTime();
        currentLog.log=societyLog;
        currentLog.type=("society");
        currentLog.attribute=societyName;
        logs.add(currentLog);
        showLog();
    }

    /**
     * 添加管理员日志
     * @param adminLog 管理员日志
     * @param adminName 管理员名
     */
    public static void addAdminLog(String adminLog,String adminName){
        currentLog=new Log();
        currentLog.time= Creator.getTime();
        currentLog.log=adminLog;
        currentLog.type=("admin");
        currentLog.attribute=adminName;
        logs.add(currentLog);
        addLog("管理员："+adminName+" "+adminLog);
        showLog();
    }

    /**
     * 在控制台上显示当前日志
     */
    public static void showLog(){
        if(currentLog.type.equals("event"))
            System.out.println("时间："+currentLog.time+" 事件："+currentLog.log);
        else if(currentLog.type.equals("error"))
            System.err.println("时间："+currentLog.time+" 错误："+currentLog.log);
        else if(currentLog.type.equals("user"))
            System.out.println("时间："+currentLog.time+" 用户日志："+currentLog.attribute+currentLog.log);
        else if(currentLog.type.equals("society"))
            System.out.println("时间："+currentLog.time+" 社团日志："+currentLog.attribute+currentLog.log);
        else if(currentLog.type.equals("admin"))
            System.out.println("时间："+currentLog.time+" 管理员日志："+currentLog.log);
    }

    /**
     * 获取日志列表
     * @return 获取日志列表
     */
    public static List<Log> getLogs() {
        return logs;
    }
}
