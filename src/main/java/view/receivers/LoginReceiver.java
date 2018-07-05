package view.receivers;

import model.entity.User;
import util.Attribute;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * Created by Administrator on 2018/7/4.
 * @author 杨晓宇
 *
 * 登录请求接收接口
 * 用于处理一个登录请求
 *
 */

public interface LoginReceiver {

    /**
     * 获取用户登录状态
     * @param request 一个登录请求
     * @return 状态码，0表示成功，1表示密码错误，2表示帐号不存在，3表示账号已被冻结
     * @Attribute User 得到的请求中User属性名
     */

    int loginFromRequest(@Attribute(User="user") HttpServletRequest request);

    /**
     * 从请求属性中提取用户对象
     * @param request 一个含有用户对象的请求
     * @return 从请求中提取出来的用户对象
     */
    User getUserFromRequest(@Attribute(User = "user") HttpServletRequest request);

    //TODO:更多接口请在这里定义

}
