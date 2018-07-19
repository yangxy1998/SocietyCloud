package controller.tools.user;

import model.Managers;
import model.entity.Society;
import util.function.Creator;
import util.function.MainType;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created by Administrator on 2018/7/13.
 */
public class ViewMallTool {

    public static String getMainType(HttpServletRequest request){
        Enumeration<String> parameterNames=request.getParameterNames();
        if (parameterNames.hasMoreElements()) {
            String parameter=parameterNames.nextElement();
            for (MainType mainType: Creator.getMainTypes()) {
                if(parameter.equals(mainType.getMainType()))
                    if(request.getParameter(parameter)!=null)
                        return parameter;
            }
        }
        return null;
    }

    public static String getSubType(HttpServletRequest request){
        Enumeration<String> parameterNames=request.getParameterNames();
        if (parameterNames.hasMoreElements()) {
            String parameter=parameterNames.nextElement();
            for(MainType mainType:Creator.getMainTypes())
            for (String subType: Creator.getSubTypes(mainType.getMainType())) {
                if(parameter.equals(subType))
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

    public static String getPage(String mainType,String subType,HttpServletRequest request){
        Enumeration<String> parameterNames=request.getParameterNames();
        if (parameterNames.hasMoreElements()) {
            String parameter=parameterNames.nextElement();
            for (String page: getPages(mainType,subType)) {
                if(parameter.equals(page))
                    if(request.getParameter(parameter)!=null)
                        return parameter;
            }
        }
        return ""+1;
    }

    public static List<String> getPages(String mainType,String subType){
        List<String> pages=new ArrayList<>();
        if(mainType==null){
            for(int i=1;i<=Managers.SocietyManager.getAllSocieties().size()/9+1;i++){
                pages.add(""+i);
            }
        }
        else if(subType==null){
            for(int i=1;i<=Managers.SocietyManager.getMainTypeOfSocieties(mainType).size()/9+1;i++){
                pages.add(""+i);
            }
        }
        else{
            for(int i=1;i<=Managers.SocietyManager.getSubTypeOfSocieties(mainType, subType).size()/9+1;i++){
                pages.add(""+i);
            }
        }
        return pages;
    }

    public static List<Society> getShowSocieties(String page,String mainType,String subType) throws InterruptedException {
        List<Society> societies=new ArrayList<>();
        int p=Integer.parseInt(page);
        if(mainType==null){
            int i=0;
            for (Society society:Managers.SocietyManager.getAllSocieties()) {
                if(i/9==p-1)societies.add(society);
                i++;
            }
        }
        else if(subType==null){
            int i=0;
            for (Society society:Managers.SocietyManager.getMainTypeOfSocieties(mainType)) {
                if(i/9==p-1)societies.add(society);
                i++;
            }
        }
        else{
            int i=0;
            for (Society society:Managers.SocietyManager.getSubTypeOfSocieties(mainType,subType)) {
                if(i/9==p-1)societies.add(society);
                i++;
            }
        }
        ExecutorService executor= Executors.newCachedThreadPool();
        for (Society society:societies) {
            executor.submit(society);
        }
        executor.shutdown();
        while (true){
            if(executor.isTerminated())return societies;
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
        for(int i=1;i<=Managers.SocietyManager.getSocietiesByKeyword(keyword).size()/9+1;i++){
            pages.add(""+i);
        }
        return pages;
    }

    public static List<Society> getShowSocietiesWithKeyword(String page,String keyword) throws InterruptedException {
        List<Society> societies=new ArrayList<>();
        int p=Integer.parseInt(page);
        int i=0;
        for (Society society:Managers.SocietyManager.getSocietiesByKeyword(keyword)) {
            if(i/9==p-1)societies.add(society);
            i++;
        }
        ExecutorService executor= Executors.newCachedThreadPool();
        for (Society society:societies) {
            executor.submit(society);
        }
        executor.shutdown();
        while (true){
            if(executor.isTerminated())return societies;
            Thread.sleep(50);
        }
    }
}
