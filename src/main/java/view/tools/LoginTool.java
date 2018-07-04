package view.tools;

import org.apache.ibatis.annotations.Param;

/**
 *
 * @author 杨晓宇
 *
 * 登录工具接口
 *
 * Created by Administrator on 2018/7/4.
 *
 */

public interface LoginTool {

    /**
     * 登录操作
     * @param userName 用户输入的用户名
     * @param password 用户输入的密码
     * @return 返回状态码，帐号以被冻结返回0，成功返回1，密码错误返回2，账号不存在返回3
     */
    int login(@Param("userName") String userName,
              @Param("passWord") String password);

}
