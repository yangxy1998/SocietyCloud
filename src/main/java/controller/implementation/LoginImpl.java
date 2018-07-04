package controller.implementation;

import controller.functions.Managers;
import model.User;
import org.apache.ibatis.annotations.Param;
import view.tools.LoginTool;

/**
 * Created by Administrator on 2018/7/4.
 */
public class LoginImpl implements LoginTool{

    @Override
    public int login(@Param("userName") String userName, @Param("passWord") String password) {
        User user= Managers.UserManager.getUserByName("userName");
        if(user==null)return 3;
        else if(user.getStatus()==0)return 0;
        else if(user.getPassword().equals(password))return 1;
        else return 2;
    }

}
