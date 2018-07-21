package model.DAO.relation;

import model.relation.SocietyOrganizeActivity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/7/16.
 *
 * @author 杨晓宇
 * @author 程乐
 */
public interface SocietyOrganizeActivityDAO {

    void organizeActivity(@Param("societyId") String societyId,
                          @Param("activityId") String activityId);

    void inviteSocietyToActivity(@Param("societyId") String societyId,
                                 @Param("activityId") String activityId);

    void receiveInvitation(@Param("societyId") String societyId,
                           @Param("activityId") String activityId);

    void refuseInvitation(@Param("societyId") String societyId,
                          @Param("activityId") String activityId);

    List<SocietyOrganizeActivity> getActivitiesBySocietyId(@Param("societyId") String societyId);

    List<SocietyOrganizeActivity> getSocietiesByActivityId(@Param("activityId") String activityId);

}
