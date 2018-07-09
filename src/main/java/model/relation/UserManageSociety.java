package model.relation;

/**
 * Created by Administrator on 2018/7/9.
 * @author 林志宸
 * @author 杨晓宇
 * @author 黄健勇
 * @author 万培林
 */
public class UserManageSociety {

    //用户id
    private String userId;

    //社团id
    private String societyId;

    /**
     * 权限等级
     * 0：无权限
     * 1：拥有管理社团评论的资格
     * 2：除1外还可以管理社团普通成员
     * 3：除2外还可以修改社团基本信息
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
}
