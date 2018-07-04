package view.tools;

import model.User;
import org.apache.ibatis.annotations.Param;

/**
 *
 * @author 杨晓宇
 *
 * 注册工具接口
 *
 * Created by Administrator on 2018/7/4.
 */
public interface RegisterTool {


    /**
     * 注册接口
     * @param userName 用户名
     * @param password 密码
     * @param phoneNum 电话号码
     * @return 注册完成的账号，如果注册失败返回NULL
     */
    User register(@Param("userName") String userName,
                  @Param("password") String password,
                  @Param("phoneNum") String phoneNum);

}
