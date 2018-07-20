package model.relation;

import model.Managers;
import model.entity.Activity;
import model.entity.Society;
import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import util.Entity;
import util.Relation;

/**
 * Created by Administrator on 2018/7/16.
 */
public class SocietyOrganizeActivity extends Relation{

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

    @Override
    public Entity get(@Param("entityType") String entityType) {
        return null;
    }

    @Override
    public JSONObject getJSONObject() {
        JSONObject object=new JSONObject();
        object.put("societyId",societyId);
        object.put("activityId",activityId);
        object.put("status",status);
        return object;
    }
}
