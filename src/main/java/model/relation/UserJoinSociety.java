package model.relation;

/**
 * 用户加入社团的联系类型
 * Created by Administrator on 2018/7/9.
 */
public class UserJoinSociety {

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
}
