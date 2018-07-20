package model.relation;

import model.Managers;
import model.entity.Society;
import model.entity.User;
import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import util.Entity;
import util.Relation;

/**
 * 用户加入社团的联系类型
 * Created by Administrator on 2018/7/9.
 * @author 林志宸
 * @author 杨晓宇
 * @author 黄健勇
 * @author 万培林
 */
public class UserJoinSociety extends Relation{

    //用户id
    private String userId;

    //社团id
    private String societyId;

    //加入日期
    private String joinDate;

    /*
    申请状态
    0：未审批
    1：已通过
    -1：拒绝或被踢出
     */
    private int status;

    //操作人id，也是一个userId
    private String managerId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getSocietyId() {
        return societyId;
    }

    public void setSocietyId(String societyId) {
        this.societyId = societyId;
    }

    public String getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(String date) {
        this.joinDate = date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getManagerId() {
        return managerId;
    }

    public void setManagerId(String managerId) {
        this.managerId = managerId;
    }

    private User user;

    private Society society;

    private User manager;

    public User getUser() {
        return Managers.UserManager.getUserById(userId);
    }

    public Society getSociety() {
        return Managers.SocietyManager.getSocietyById(societyId);
    }

    public User getManager() {
        return Managers.UserManager.getUserById(managerId);
    }

    @Override
    public Entity get(@Param("entityType") String entityType) {
        if(entityType.equals("User"))return Managers.UserManager.getUserById(userId);
        if(entityType.equals("Society")) return Managers.SocietyManager.getSocietyById(societyId);
        if (entityType.equals("Manager"))return Managers.UserManager.getUserById(managerId);
        else return null;
    }

    @Override
    public JSONObject getJSONObject() {
        JSONObject object=new JSONObject();
        object.put("societyId",societyId);
        object.put("userId",userId);
        object.put("status",status);
        return object;
    }

}
