package controller.tools;

import model.Managers;
import model.entity.User;
import util.function.Creator;

/**
 *
 *
 * 注册工具
 * 用于提供注册操作所需要的工具
 *
 *
 * Created by Administrator on 2018/7/4.
 * @author 杨晓宇
 */
public class RegisterTool {

    /**
     * 获得一个全新的用户userId
     * @return userId
     */
    public static String getNewUserId(){
        String uuid;
        User user;
        do{
            uuid=Creator.createUUID();
            user=Managers.UserManager.getUserById(uuid);
        }while (user!=null);
        return uuid;
    }
    //TODO:更多接口请在这里定义
}
