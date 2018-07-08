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

}
