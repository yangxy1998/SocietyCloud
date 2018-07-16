package model.entity;

import model.Managers;
import model.relation.UserCommentSociety;
import model.relation.UserJoinSociety;
import model.relation.UserManageSociety;
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

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getAcademicNum() {
        return academicNum;
    }

    public void setAcademicNum(String academicNum) {
        this.academicNum = academicNum;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    @Override
    public String getEntityLog() {
        return "用户 id："+this.userId+" 用户名："+this.userName;
    }

    @Override
    public void init() {
        if(userId==null)return;
        this.joinSocieties= Managers.JoinManager.getSocietiesByUserId(userId);
        this.manageSocieties=Managers.ManageManager.getSocietiesByUserId(userId);
        this.commentSocieties=Managers.CommentManager.getCommentsByUserId(userId);
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
