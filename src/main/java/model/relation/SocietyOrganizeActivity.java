package model.relation;

import model.Managers;
import model.entity.Activity;
import model.entity.Society;

/**
 * Created by Administrator on 2018/7/16.
 */
public class SocietyOrganizeActivity {

    private String societyId;

    private String activityId;

    /**
     * 邀请状态
     * 1接受
     * 0等待接受
     * -1拒绝
     */
    private int status;

    public String getSocietyId() {
        return societyId;
    }

    public void setSocietyId(String societyId) {
        this.societyId = societyId;
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

    private Society society;

    private Activity activity;

    public Society getSociety() {
        return Managers.SocietyManager.getSocietyById(societyId);
    }

    public Activity getActivity() {
        return Managers.ActivityManager.getActivityById(activityId);
    }
}
