package controller.implementation;

import controller.functions.Managers;
import model.entity.User;
import view.receivers.LoginReceiver;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @see LoginReceiver 本类实现了登录请求接收者接口
 *
 * Created by Administrator on 2018/7/4.
 */

public class LoginImpl implements LoginReceiver{

    @Override
    public int loginFromRequest(HttpServletRequest request){

        String username=request.getParameter("username");
        String password=request.getParameter("password");
        User user= Managers.UserManager.getUserByName(username);
        //账号不存在
        if(user==null){
            return 2;
        }
        //密码不一致
        if(!password.equals(user.getPassword())){
            return 1;
        }
        //账号已冻结
        if(user.getStatus()!=0){
            return 3;
        }
        //成功
        else {
            request.setAttribute("user",user);
            return 0;
        }
    }

}
