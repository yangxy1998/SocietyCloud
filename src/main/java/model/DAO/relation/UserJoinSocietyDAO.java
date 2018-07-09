package model.DAO.relation;

import model.relation.UserJoinSociety;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/7/9.
 * @author 杨晓宇
 * @author 程乐
 */
public interface UserJoinSocietyDAO {

    /**
     * 找到与一个用户关联所有社团
     * @param userId 用户id
     * @return 所有关联
     */
    List<UserJoinSociety> getSocietiesByUserId(@Param("userId") String userId);

    /**
     * 找到与一个社团有关的所有用户
     * @param societyId 社团id
     * @return 所有关联
     */
    List<UserJoinSociety> getUsersBySocietyId(@Param("societyId") String societyId);

    /**
     * 用户申请加入一个社团
     * @param userId 用户ID
     * @param societyId 社团ID
     * @param joinDate 加入时间
     */
    void applyToJoinSociety(@Param("userId") String userId,
                            @Param("society") String societyId,
                            @Param("joinDate") String joinDate);

    /**
     * 通过一个用户的申请
     * @param userId 用户id
     * @param society 社团id
     * @param managerId 处理人id
     */
    void passApplication(@Param("userId") String userId,
                         @Param("societyId") String society,
                         @Param("managerId") String managerId);

    /**
     * 拒绝一个用户的申请，或踢出一个用户
     * @param userId 用户id
     * @param society 社团id
     * @param managerId 处理人id
     */
    void denyApplication(@Param("userId") String userId,
                         @Param("societyId") String society,
                         @Param("managerId") String managerId);


}
