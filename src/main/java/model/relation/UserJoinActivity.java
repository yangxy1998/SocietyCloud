package model.relation;

import model.Managers;
import model.entity.Activity;
import model.entity.User;

/**
 * Created by Administrator on 2018/7/16.
 */
public class UserJoinActivity {

    String userId;

    String activityId;

    int status;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getActivityId() {
        return activityId;
    }

    public void setActivityId(String activityId) {
        this.activityId = activityId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    private User user;

    private Activity activity;

    public User getUser() {
        return Managers.UserManager.getUserById(userId);
    }

    public Activity getActivity() {
        return Managers.ActivityManager.getActivityById(activityId);
    }
}
