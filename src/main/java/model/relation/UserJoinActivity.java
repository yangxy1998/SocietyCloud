package model.relation;

import model.Managers;
import model.entity.Activity;
import model.entity.User;
import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import util.Entity;
import util.Relation;

/**
 * Created by Administrator on 2018/7/16.
 * @author 林志宸
 * @author 杨晓宇
 * @author 黄健勇
 * @author 万培林
 */
public class UserJoinActivity extends Relation{

    String userId;

    String activityId;

    int status;

    public String getUserId() {
        return userId;
    }

    public String getActivityId() {
        return activityId;
    }

    public int getStatus() {
        return status;
    }

    public User getUser() {
        return Managers.UserManager.getUserById(userId);
    }

    public Activity getActivity() {
        return Managers.ActivityManager.getActivityById(activityId);
    }

    @Override
    public Entity get(@Param("entityType") String entityType) {
        return null;
    }

    @Override
    public JSONObject getJSONObject() {
        JSONObject object=new JSONObject();
        object.put("activityId",activityId);
        object.put("userId",userId);
        object.put("status",status);
        return object;
    }
}
