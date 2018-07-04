package view.receivers;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author 杨晓宇
 *
 * 登录请求接收接口
 * 用于处理一个登录请求
 *
 * Created by Administrator on 2018/7/4.
 *
 */

public interface LoginReceiver {

    /**
     * 获取用户登录状态
     * @param request 一个登录请求
     * @return 状态码，0表示成功，1表示密码错误，2表示帐号不存在，3表示账号已被冻结
     */
    int loginFromRequest(HttpServletRequest request);

}
