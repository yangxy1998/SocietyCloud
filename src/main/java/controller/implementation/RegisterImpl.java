package controller.implementation;

import controller.functions.Creator;
import controller.functions.Managers;
import model.User;
import org.apache.ibatis.annotations.Param;
import view.tools.RegisterTool;

/**
 * Created by Administrator on 2018/7/4.
 */
public class RegisterImpl implements RegisterTool {

    @Override
    public User register(@Param("userName") String userName, @Param("password") String password, @Param("phoneNum") String phoneNum) {
        String uuid="";
        do{
            uuid=Creator.getUUID();
        }while(Managers.UserManager.getUserById(uuid)!=null);
        Managers.UserManager.createUser(uuid,userName,password,phoneNum);
        User user=Managers.UserManager.getUserById(uuid);
        return user;
    }

}
