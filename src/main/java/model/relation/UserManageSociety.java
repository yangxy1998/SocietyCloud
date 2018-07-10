package model.relation;

import model.Managers;
import model.entity.Society;
import model.entity.User;
import org.apache.ibatis.annotations.Param;
import util.Entity;
import util.Relation;

/**
 * Created by Administrator on 2018/7/9.
 * @author 林志宸
 * @author 杨晓宇
 * @author 黄健勇
 * @author 万培林
 */
public class UserManageSociety extends Relation{

    //用户id
    private String userId;

    //社团id
    private String societyId;

    /**
     * 权限等级
     * 0：无权限
     * 1：拥有管理社团评论的资格
     * 2：除1外还可以发布活动
     * 3：除2外还可以修改社团基本信息以及管理社团成员
     * 4：除3外还可以授予其他人权限
     * 5：每个社团只能有一个，权限同4
     */
    private int priority;

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

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

    private User user;

    private Society society;

    public User getUser() {
        return Managers.UserManager.getUserById(userId);
    }

    public Society getSociety() {
        return Managers.SocietyManager.getSocietyById(societyId);
    }

    @Override
    public Entity get(@Param("entityType") String entityType) {
        if(entityType.equals("User"))return Managers.UserManager.getUserById(userId);
        if(entityType.equals("Society"))return Managers.SocietyManager.getSocietyById(societyId);
        return null;
    }

}
