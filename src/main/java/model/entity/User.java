package model.entity;

import model.Managers;
import model.relation.UserCommentSociety;
import model.relation.UserJoinActivity;
import model.relation.UserJoinSociety;
import model.relation.UserManageSociety;
import org.json.JSONObject;
import util.Entity;

import javax.servlet.http.HttpSessionBindingEvent;
import java.util.List;

/**
 *
 *
 * 用户类
 *
 * Created by Administrator on 2018/7/4.
 * @author 林志宸
 * @author 杨晓宇
 * @author 黄健勇
 * @author 万培林
 */

public class User extends Entity{

    //用户唯一id
    private String userId;

    //用户登录用的userName
    private String userName;

    //登录密码
    private String password;

    //电话号码
    private String phoneNum;

    //对外显示的昵称
    private String nickName;

    //真实姓名
    private String realName;

    //学校名
    private String schoolName;

    //学工号
    private String academicNum;

    //身份证号
    private String idCard;

    //用户状态，0为正常，1为冻结
    private int status;

    //用户描述
    private String description;

    //用户加入的社团关系
    private List<UserJoinSociety> joinSocieties;

    //用户管理的社团关系
    private List<UserManageSociety> manageSocieties;

    //用户评论的社团关系
    private List<UserCommentSociety> commentSocieties;

    //用户加入的活动关系
    private List<UserJoinActivity> joinActivities;

    public String getUserId() {
        return userId;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public String getNickName() {
        return nickName;
    }

    public String getRealName() {
        return realName;
    }

    public int getStatus() {
        return status;
    }

    public String getIdCard() {
        return idCard;
    }

    public String getAcademicNum() {
        return academicNum;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public String getDescription() {
        return description;
    }

    public List<UserJoinSociety> getJoinSocieties() {
        return joinSocieties;
    }

    public List<UserManageSociety> getManageSocieties() {
        return manageSocieties;
    }

    public List<UserCommentSociety> getCommentSocieties() {
        return commentSocieties;
    }

    public List<UserJoinActivity> getJoinActivities() {
        return joinActivities;
    }

    @Override
    public String getEntityLog() {
        return "用户 id："+this.userId+" 用户名："+this.userName;
    }

    @Override
    public void init() {
        if(userId==null)return;
        this.joinSocieties= Managers.JoinSocietyManager.getSocietiesByUserId(userId);
        this.manageSocieties=Managers.ManageManager.getSocietiesByUserId(userId);
        this.commentSocieties=Managers.CommentManager.getCommentsByUserId(userId);
        this.joinActivities=Managers.JoinActivityManager.getActivitiesByUserId(userId);
    }

    @Override
    public JSONObject getJSONObject() {
        JSONObject object=new JSONObject();
        object.put("userId",userId);
        object.put("userName",userName);
        object.put("password",password);
        object.put("phoneNum",phoneNum);
        object.put("nickName",nickName);
        object.put("realName",realName);
        object.put("schoolName",schoolName);
        object.put("academicNum",academicNum);
        object.put("idCard",idCard);
        object.put("description",description);
        object.put("status",status);
        return object;
    }

    private boolean login=false;

    public boolean isLogin(){
        return login;
    }

    @Override
    public void valueBound(HttpSessionBindingEvent event) {
        super.valueBound(event);
        login=true;
    }

    @Override
    public void valueUnbound(HttpSessionBindingEvent event) {
        super.valueUnbound(event);
        login=false;
    }
}
