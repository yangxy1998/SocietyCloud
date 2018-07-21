package model.DAO.entity;

import model.entity.Activity;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * Created by Administrator on 2018/7/16.
 *
 * @author 杨晓宇
 * @author 程乐
 */
public interface ActivityDAO {

    List<Activity> getAllActivities();

    void organizeActivity(@Param("activityId") String activityId,
                          @Param("activityName") String activityName,
                          @Param("activityType") String activityType,
                          @Param("organizer") String organizer,
                          @Param("beginTime") String beginTime,
                          @Param("endTime") String endTime,
                          @Param("address") String address,
                          @Param("limit") String limit,
                          @Param("description") String description);

    void updateActivity(@Param("activityId") String activityId,
                        @Param("activityName") String activityName,
                        @Param("activityType") String activityType,
                        @Param("organizer") String organizer,
                        @Param("beginTime") String beginTime,
                        @Param("endTime") String endTime,
                        @Param("address") String address,
                        @Param("limit") String limit,
                        @Param("description") String description);

    Activity getActivityById(@Param("activityId") String activityId);

    List<Activity> getTypeOfActivities(@Param("activityType") String activityType);

    List<Activity> getActivitiesByKeyword(@Param("keyword") String keyword);

}
