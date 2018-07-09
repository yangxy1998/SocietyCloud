package model.DAO.relation;

import model.relation.UserManageSociety;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/7/9.
 * @author 杨晓宇
 * @author 程乐
 */
public interface UserManageSocietyDAO {

    /**
     * 得到一个用户管理的所有社团关联
     * @param userId 用户id
     * @return 所有联系
     */
    List<UserManageSociety> getSocietiesByUserId(@Param("userId") String userId);

    /**
     * 得到一个社团所有管理者的关联
     * @param societyId 社团id
     * @return 所有联系
     */
    List<UserManageSociety> getUsersBySocietyId(@Param("societyId") String societyId);

    /**
     * 给一个用户授权
     * @param userId 用户ID
     * @param societyId 社团ID
     * @param priority 权限等级
     */
    void givePriority(@Param("userId") String userId,
                      @Param("societyId") String societyId,
                      @Param("priority") int priority);

    /**
     * 撤销对一个用户的授权
     * @param userId 用户ID
     * @param societyId 社团ID
     */
    void removePriority(@Param("userId") String userId,
                        @Param("societyId") String societyId);

}
