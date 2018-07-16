package model.DAO.relation;

import model.relation.UserJoinActivity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/7/16.
 */
public interface UserJoinActivityDAO {

    void joinActivity(@Param("userId") String userId,
                      @Param("activityId") String activityId);

    void inviteActivity(@Param("userId") String userId,
                        @Param("activityId") String activityId);

    void receiveInvitation(@Param("userId") String userId,
                           @Param("activityId") String activityId);

    void refuseInvitation(@Param("userId") String userId,
                          @Param("activityId") String activityId);

    List<UserJoinActivity> getUsersByActivityId(@Param("activityId") String activityId);

    List<UserJoinActivity> getActivitiesByUserId(@Param("userId") String userId);

}
