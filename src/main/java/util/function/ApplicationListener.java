package util.function;

import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

/**
 *
 *
 * 全局事件监听者
 * 作用范围为整个应用。
 * Created by Administrator on 2018/7/6.
 * @author 杨晓宇
 */


public class ApplicationListener implements ServletRequestListener,
        ServletRequestAttributeListener, HttpSessionAttributeListener{

    private static String currentLog;

    @Override
    public void attributeAdded(HttpSessionBindingEvent event) {

        String name=event.getName();
        String sessionId=event.getSession().getId();
        currentLog="一个 "+name+" 属性添加到会话 ["+sessionId+"]。";
        Log.addLog(currentLog);

    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent event) {

        String name=event.getName();
        String sessionId=event.getSession().getId();

        currentLog="一个 "+name+" 属性从会话 ["+sessionId+"] 中移除。";
        Log.addLog(currentLog);

    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent event) {

        String name=event.getName();
        String sessionId=event.getSession().getId();

        currentLog="一个 "+name+" 属性在会话 ["+sessionId+"]中被替换。";
        Log.addLog(currentLog);

    }

    @Override
    public void attributeAdded(ServletRequestAttributeEvent event) {

        String name=event.getName();
        String addr=event.getServletRequest().getRemoteAddr();
        String host=event.getServletRequest().getRemoteHost();
        int port=event.getServletRequest().getRemotePort();

        currentLog="在地址：" +addr+"主机："+host+"端口："+port+
                " 发来的请求中 "+name+" 属性被添加。";
        Log.addLog(currentLog);

    }

    @Override
    public void attributeRemoved(ServletRequestAttributeEvent event) {

        String name=event.getName();
        String addr=event.getServletRequest().getRemoteAddr();
        String host=event.getServletRequest().getRemoteHost();
        int port=event.getServletRequest().getRemotePort();

        currentLog="在地址：[" +addr+"]主机：["+host+"]端口：["+port+
                "] 发来的请求中 "+name+" 属性被移除。";
        Log.addLog(currentLog);

    }

    @Override
    public void attributeReplaced(ServletRequestAttributeEvent event) {

        String name=event.getName();
        String addr=event.getServletRequest().getRemoteAddr();
        String host=event.getServletRequest().getRemoteHost();
        int port=event.getServletRequest().getRemotePort();

        currentLog="在地址：[" +addr+"]主机：["+host+"]端口：["+port+
                "] 发来的请求中 "+name+" 属性被替换。";
        Log.addLog(currentLog);

    }

    @Override
    public void requestDestroyed(ServletRequestEvent event) {

        String addr=event.getServletRequest().getRemoteAddr();
        String host=event.getServletRequest().getRemoteHost();
        int port=event.getServletRequest().getRemotePort();

        currentLog="来自地址：[" +addr+"]主机：["+host+"]端口：["+port+"]的请求被销毁。";
        Log.addLog(currentLog);

    }

    @Override
    public void requestInitialized(ServletRequestEvent event) {

        String addr=event.getServletRequest().getRemoteAddr();
        String host=event.getServletRequest().getRemoteHost();
        int port=event.getServletRequest().getRemotePort();

        currentLog="来自地址：[" +addr+"]主机：["+host+"]端口：["+port+"]的请求初始化。";
        Log.addLog(currentLog);

    }


}
