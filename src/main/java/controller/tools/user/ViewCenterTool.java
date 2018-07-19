package controller.tools.user;

import model.Managers;
import model.entity.Activity;
import util.function.Creator;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created by Administrator on 2018/7/17.
 */
public class ViewCenterTool {

    public static String getActivityType(HttpServletRequest request){
        Enumeration<String> parameterNames=request.getParameterNames();
        if (parameterNames.hasMoreElements()) {
            String parameter=parameterNames.nextElement();
            for (String type: Creator.getActivityTypes()) {
                if(parameter.equals(type))
                    if(request.getParameter(parameter)!=null)
                        return parameter;
            }
        }
        return null;
    }

    public static String getKeyword(HttpServletRequest request){
        String keyword=request.getParameter("keyword");
        if(keyword!=null)return keyword;
        else return null;
    }

    public static String getPage(String type,HttpServletRequest request){
        Enumeration<String> parameterNames=request.getParameterNames();
        if (parameterNames.hasMoreElements()) {
            String parameter=parameterNames.nextElement();
            for (String page: getPages(type)) {
                if(parameter.equals(page))
                    if(request.getParameter(parameter)!=null)
                        return parameter;
            }
        }
        return ""+1;
    }

    public static List<String> getPages(String type){
        List<String> pages=new ArrayList<>();
        if(type==null){
            for(int i = 1; i<= Managers.ActivityManager.getTypeOfActivities(type).size()/9+1; i++){
                pages.add(""+i);
            }
        }
        else{
            for(int i=1;i<=Managers.ActivityManager.getTypeOfActivities(type).size()/9+1;i++){
                pages.add(""+i);
            }
        }
        return pages;
    }

    public static List<Activity> getShowActivities(String page, String type) throws InterruptedException {
        List<Activity> activities=new ArrayList<>();
        int p=Integer.parseInt(page);
        if(type==null){
            int i=0;
            for (Activity activity:Managers.ActivityManager.getAllActivities()) {
                if(i/9==p-1)activities.add(activity);
                i++;
            }
        }
        else{
            int i=0;
            for (Activity activity:Managers.ActivityManager.getTypeOfActivities(type)) {
                if(i/9==p-1)activities.add(activity);
                i++;
            }
        }
        ExecutorService executor= Executors.newCachedThreadPool();
        for (Activity activity:activities) {
            executor.submit(activity);
        }
        executor.shutdown();
        while (true){
            if(executor.isTerminated())return activities;
            Thread.sleep(50);
        }
    }

    public static String getPageWithKeyword(String keyword,HttpServletRequest request){
        Enumeration<String> parameterNames=request.getParameterNames();
        if (parameterNames.hasMoreElements()) {
            String parameter=parameterNames.nextElement();
            for (String page: getPagesWithKeyword(keyword)) {
                if(parameter.equals(page))
                    if(request.getParameter(parameter)!=null)
                        return parameter;
            }
        }
        return ""+1;
    }

    public static List<String> getPagesWithKeyword(String keyword){
        List<String> pages=new ArrayList<>();
        for(int i=1;i<=Managers.ActivityManager.getActivitiesByKeyword(keyword).size()/9+1;i++){
            pages.add(""+i);
        }
        return pages;
    }

    public static List<Activity> getShowActivitiesWithKeyword(String page, String keyword) throws InterruptedException {
        List<Activity> activities=new ArrayList<>();
        int p=Integer.parseInt(page);
        int i=0;
        for (Activity activity:Managers.ActivityManager.getActivitiesByKeyword(keyword)) {
            if(i/9==p-1)activities.add(activity);
            i++;
        }
        ExecutorService executor= Executors.newCachedThreadPool();
        for (Activity activity:activities) {
            executor.submit(activity);
        }
        executor.shutdown();
        while (true){
            if(executor.isTerminated())return activities;
            Thread.sleep(50);
        }
    }

}
