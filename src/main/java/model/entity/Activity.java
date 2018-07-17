package model.entity;

import model.Managers;
import model.relation.SocietyOrganizeActivity;
import model.relation.UserJoinActivity;
import org.json.JSONObject;
import util.Entity;

import java.util.List;

/**
 * Created by Administrator on 2018/7/12.
 */
public class Activity extends Entity{

    //活动id
    private String activityId;

    //活动名
    private String activityName;

    //活动类型
    private String activityType;

    //主办方
    private String organizer;

    //开始时间
    private String beginTime;

    //结束时间
    private String endTime;

    //活动地址
    private String address;

    /**
     * 活动人物限定
     * 只限社团管理员：只限所有社团管理员
     * 只限社团成员：只限所有社团成员
     * 只限认证人员：只限有学校和学工号认证的人员
     * 不限：不限人员
     */
    private String limit;

    //活动描述
    private String description;

    private List<UserJoinActivity> joinUsers;

    private List<SocietyOrganizeActivity> organizeSocieties;

    public String getActivityId() {
        return activityId;
    }

    public void setActivityId(String activityId) {
        this.activityId = activityId;
    }

    public String getActivityName() {
        return activityName;
    }

    public void setActivityName(String activityName) {
        this.activityName = activityName;
    }

    public String getActivityType() {
        return activityType;
    }

    public void setActivityType(String activityType) {
        this.activityType = activityType;
    }

    public String getOrganizer() {
        return organizer;
    }

    public void setOrganizer(String organizer) {
        this.organizer = organizer;
    }

    public String getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getLimit() {
        return limit;
    }

    public void setLimit(String limit) {
        this.limit = limit;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<UserJoinActivity> getJoinUsers() {
        return joinUsers;
    }

    public List<SocietyOrganizeActivity> getOrganizeSocieties() {
        return organizeSocieties;
    }

    @Override
    public String getEntityLog() {
        return "活动 id："+this.activityId+" 活动名："+this.activityName;
    }


    @Override
    public void init() {
        this.joinUsers= Managers.JoinActivityManager.getUsersByActivityId(activityId);
        this.organizeSocieties=Managers.OrganizeManager.getSocietiesByActivityId(activityId);
    }

    @Override
    public JSONObject getJSONObject() {
        JSONObject object=new JSONObject();
        object.put("activityId",activityId);
        object.put("activityName",activityName);
        object.put("activityType",activityType);
        object.put("organizer",organizer);
        object.put("beginTime",beginTime);
        object.put("endTime",endTime);
        object.put("address",address);
        object.put("description",description);
        object.put("limit",limit);
        return object;
    }
}
