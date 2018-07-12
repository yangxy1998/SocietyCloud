package model.entity;

import util.Entity;

/**
 * Created by Administrator on 2018/7/12.
 */
public class Activity extends Entity{

    //活动id
    private String activityId;

    //活动名
    private String activityName;

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
     * 只限管理员：只限所有社团管理员
     * 只限社团成员：只限所有社团成员
     * 只限认证人员：只限有学校和学工号认证的人员
     * 不限：不限任何成员
     */
    private String limit;

    //活动描述
    private String description;


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

    @Override
    public String getEntityLog() {
        return "活动 id："+this.activityId+" 活动名："+this.activityName;
    }

    @Override
    protected void init() {

    }
}
