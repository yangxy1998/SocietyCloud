package model.entity;

import controller.servlet.InitServlet;
import model.Managers;
import model.relation.*;
import org.json.JSONObject;
import util.Entity;

import java.io.File;
import java.util.List;

/**
 * 社团类
 *
 * Created by Administrator on 2018/7/5.
 *
 * @author 林志宸
 * @author 杨晓宇
 * @author 黄健勇
 * @author 万培林
 */
public class Society extends Entity{

    //社团ID
    String societyId;

    //社团名
    String societyName;

    //社团学校
    String schoolName;

    //社团主要类型
    String mainType;

    //社团次要类型
    String subType;

    //创建时间
    String foundDate;

    //创建人
    String founder;

    /**
     * 社团状态
     * -1：冻结
     * 0：正在审批
     * 1：正常
     */
    int status;

    //社团介绍
    String description;

    //加入社团的用户关系
    List<UserJoinSociety> joinUsers;

    //管理社团的用户关系
    List<UserManageSociety> manageUsers;

    //评论社团的用户关系
    List<UserCommentSociety> commentUsers;

    //社团举办的活动关系
    List<SocietyOrganizeActivity> organizeActivities;

    public String getSocietyId() {
        return societyId;
    }

    public String getSocietyName() {
        return societyName;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public String getMainType() {
        return mainType;
    }

    public String getSubType() {
        return subType;
    }

    public String getFounder() {
        return founder;
    }

    public int getStatus() {
        return status;
    }

    public String getDescription() {
        return description;
    }

    public String getFoundDate() {
        return foundDate;
    }

    public List<UserJoinSociety> getJoinUsers() {
        return joinUsers;
    }

    public List<UserManageSociety> getManageUsers() {
        return manageUsers;
    }

    public List<UserCommentSociety> getCommentUsers() {
        return commentUsers;
    }

    public List<SocietyOrganizeActivity> getOrganizeActivities() {
        return organizeActivities;
    }

    public boolean getIsPictureExist(){
        File file=new File(InitServlet.outerPath+File.separator+"SocietyFiles"+File.separator
                +societyId+File.separator+societyId+".jpg");
        boolean exist=file.exists();
        return exist;
    }

    @Override
    public String getEntityLog() {
        return "社团 id："+this.societyId+" 社团名："+this.societyName;
    }

    @Override
    public void init() {
        if (societyId==null)return;
        this.joinUsers= Managers.JoinSocietyManager.getUsersBySocietyId(societyId);
        this.manageUsers=Managers.ManageManager.getUsersBySocietyId(societyId);
        this.commentUsers=Managers.CommentManager.getCommentsBySocietyId(societyId);
        this.organizeActivities=Managers.OrganizeManager.getActivitiesBySocietyId(societyId);
    }

    @Override
    public JSONObject getJSONObject() {
        JSONObject object=new JSONObject();
        object.put("societyId",societyId);
        object.put("societyName",societyName);
        object.put("schoolName",schoolName);
        object.put("mainType",mainType);
        object.put("subType",subType);
        object.put("foundDate",foundDate);
        object.put("founder",founder);
        object.put("description",description);
        object.put("status",status);
        return object;
    }
}
