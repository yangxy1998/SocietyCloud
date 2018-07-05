package controller.implementation;

import model.Managers;
import model.entity.User;
import util.Attribute;
import view.receivers.LoginReceiver;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2018/7/4.
 * @author 杨晓宇
 *
 * 本类实现了登录请求接收者接口
 * @see LoginReceiver 登录请求接收者接口
 *
 */

public class LoginImpl implements LoginReceiver{


    @Override
    public int loginFromRequest(@Attribute(User = "user") HttpServletRequest request) {
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

    @Override
    public User getUserFromRequest(@Attribute(User = "user") HttpServletRequest request) {
        return (User)request.getAttribute("user");
    }
}
