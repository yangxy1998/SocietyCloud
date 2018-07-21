package controller.tools.user;

import model.Managers;
import model.entity.Activity;
import util.function.Creator;

/**
 * Created by Administrator on 2018/7/17.
 * @author 杨晓宇
 */
public class OrganizeTool {

    /**
     * 获得一个全新的活动activityId
     * @return activityId
     */
    public static String getNewActivityId(){
        String uuid;
        Activity activity;
        do{
            uuid= Creator.createUUID();
            activity= Managers.ActivityManager.getActivityById(uuid);
        }while (activity!=null);
        return uuid;
    }

    public static boolean checkParameter(String parameterName){
        if(parameterName.equals("activityName") ||parameterName.equals("activityType")
                ||parameterName.equals("beginTime") ||parameterName.equals("endTime")
                ||parameterName.equals("organizer")||parameterName.equals("address")
                ||parameterName.equals("description")||parameterName.equals("limit"))
            return true;
        else return false;
    }

}
