package model;

/**
 *
 * @author 杨晓宇
 *
 * 用户类
 *
 * Created by Administrator on 2018/7/4.
 */

public class User {

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

    //学工号
    private String academicNum;

    //身份证号
    private String idCard;

    //用户状态，0为冻结，1为正常
    private int status;

    //用户描述
    private String description;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
