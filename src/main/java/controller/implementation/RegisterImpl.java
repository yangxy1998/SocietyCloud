package controller.implementation;

import model.Managers;
import model.entity.User;
import util.Attribute;
import util.functions.Creator;
import view.receivers.RegisterReceiver;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2018/7/4.
 * @author 杨晓宇
 *
 * 实现了注册请求接收者接口
 * @see RegisterReceiver 注册请求接收者接口
 *
 */
public class RegisterImpl implements RegisterReceiver {


    @Override
    public int registerFromRequest(@Attribute(User = "user") HttpServletRequest request) {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String confirmPassword=request.getParameter("confirmPassword");
        String phoneNum=request.getParameter("phoneNum");
        User user= Managers.UserManager.getUserByName(username);
        //账号已存在
        if(user!=null){
            return 1;
        }
        //密码不一致
        if(!password.equals(confirmPassword)){
            return 2;
        }
        //成功
        else {
            Managers.UserManager.createUser(Creator.getUUID(),username,password,phoneNum);
            user=Managers.UserManager.getUserByName(username);
            if(user==null)return 3;
            request.setAttribute("user",user);
            return 0;
        }
    }
}
