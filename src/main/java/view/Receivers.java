package view;

import view.receivers.LoginReceiver;
import view.receivers.RegisterReceiver;
import view.receivers.WebAdministratorReceiver;

/**
 *
 * Created by Administrator on 2018/7/4.
 * @author 杨晓宇
 *
 * servlet所用的所有接收者集合
 *
 */

public class Receivers {

    //登录所用的信息接收者
    public static LoginReceiver Login;

    //注册所用的信息接收者
    public static RegisterReceiver Register;

    //网站管理员所用的接收者
    public static WebAdministratorReceiver WebAdministrator;

}
