package controller.tools.user;

import model.Managers;
import model.entity.Society;
import util.function.Creator;

/**
 * Created by Administrator on 2018/7/8.
 */
public class FoundTool {

    /**
     * 获得一个全新的用户societyId
     * @return societyId
     */
    public static String getNewSocietyId(){
        String uuid;
        Society society;
        do{
            uuid= Creator.createUUID();
            society= Managers.SocietyManager.getSocietyById(uuid);
        }while (society!=null);
        return uuid;
    }

    public static boolean checkParameter(String parameterName){
        if(parameterName.equals("societyName") ||parameterName.equals("schoolName")
                ||parameterName.equals("mainType") ||parameterName.equals("subType")
                ||parameterName.equals("foundTime")||parameterName.equals("founder")
                ||parameterName.equals("description"))
            return true;
        else return false;
    }

}
