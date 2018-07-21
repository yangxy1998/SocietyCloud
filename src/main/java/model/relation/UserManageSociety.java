package model.relation;

import model.Managers;
import model.entity.Society;
import model.entity.User;
import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
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
     * 1：社团委员，拥有管理社团评论的资格
     * 2：社团秘书，除1外还可以管理社团成员
     * 3：社团发言人，除2外还可以修改社团基本信息以及发布活动
     * 4：社团总管理，除3外还可以授予其他人权限
     * 5：社团所有者，每个社团只能有一个，权限同4
     */
    private int priority;

    public String getUserId() {
        return userId;
    }

    public String getSocietyId() {
        return societyId;
    }

    public int getPriority() {
        return priority;
    }

    public User getUser() {
        return Managers.UserManager.getUserById(userId);
    }

    public Society getSociety() {
        return Managers.SocietyManager.getSocietyById(societyId);
    }

    public static String getPriority(int priority){
        if(priority==0)return "无权限";
        else if(priority==1)return "社团委员";
        else if(priority==2)return "社团秘书";
        else if(priority==3)return "社团发言人";
        else if(priority==4)return "社团总管理";
        else if(priority==5)return "社团拥有者";
        else return null;
    }

    @Override
    public Entity get(@Param("entityType") String entityType) {
        if(entityType.equals("User"))return Managers.UserManager.getUserById(userId);
        if(entityType.equals("Society"))return Managers.SocietyManager.getSocietyById(societyId);
        return null;
    }

    @Override
    public JSONObject getJSONObject() {
        JSONObject object=new JSONObject();
        object.put("societyId",societyId);
        object.put("userId",userId);
        object.put("priority",priority);
        return object;
    }
}
