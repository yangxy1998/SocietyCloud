package util;

import util.function.Log;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

/**
 * 实体类
 * 所有实体类的父类，对所有实体类添加一个会话绑定监听者
 * Created by Administrator on 2018/7/6.
 * @author 杨晓宇
 */
public abstract class Entity implements HttpSessionBindingListener{

    private static String currentLog;

    public abstract String getEntityLog();

    @Override
    public void valueBound(HttpSessionBindingEvent event) {

        String sessionId=event.getSession().getId();

        currentLog=this.getEntityLog()+
                " 绑定至会话:"+sessionId+"。";

        Log.addLog(currentLog);

    }

    @Override
    public void valueUnbound(HttpSessionBindingEvent event) {

        String sessionId=event.getSession().getId();

        currentLog=this.getEntityLog()+
                " 绑定至会话"+sessionId+"。";

        Log.addLog(currentLog);

    }
}
