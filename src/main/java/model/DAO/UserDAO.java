package model.DAO;

import model.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *
 *
 * 用户类的数据访问对象
 * Created by Administrator on 2018/7/4.
 * @see User 用户类
 *
 * @author 杨晓宇
 */

public interface UserDAO {

    /**
     * 从数据库通过唯一Id获取对象（此时未初始化对象）
     * @param userId
     * @return User对象
     */
    User getUserById(@Param("userId") String userId);

    /**
     * 从数据库通过唯一Id获取对象（此时未初始化对象）
     * @param userName
     * @return User对象
     */
    User getUserByName(@Param("userName") String userName);

    /**
     * 在数据库中增加一个项目
     * @param userId
     * @param userName
     * @param password
     * @param phoneNum
     */
    void createUser(@Param("userId") String userId,
                    @Param("userName") String userName,
                    @Param("password") String password,
                    @Param("phoneNum") String phoneNum);

    /**
     * 在数据库中更新一个用户
     * @param userId
     * @param userName
     * @param password
     * @param phoneNum
     * @param nickName
     * @param realName
     * @param academicNum
     * @param idCard
     * @param status
     * @param description
     */
    void updateUser(@Param("userId") String userId,
                    @Param("userName") String userName,
                    @Param("password") String password,
                    @Param("phoneNum") String phoneNum,
                    @Param("nickName") String nickName,
                    @Param("realName") String realName,
                    @Param("academicNum") String academicNum,
                    @Param("idCard") String idCard,
                    @Param("status") int status,
                    @Param("description") String description);

    /**
     * 得到所有用户
     * @return 所有User对象
     */
    List<User> getAllUsers();

    /**
     * 删除一个用户
     * @param userId 要删除的用户Id
     */
    void deleteUser(@Param("userId") String userId);


}
