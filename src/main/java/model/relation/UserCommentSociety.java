package model.relation;

/**
 * Created by Administrator on 2018/7/9.
 * @author 林志宸
 * @author 杨晓宇
 * @author 黄健勇
 * @author 万培林
 */
public class UserCommentSociety {

    //用户id
    private String userId;

    //社团id
    private String societyId;

    //评论时间
    private String commentDate;

    //评论内容
    private String comment;

    /**
     * 评论可见性
     * -1:不可见
     * 0:可见
     * 1:置顶
     */
    private int visible;

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

    public String getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(String commentDate) {
        this.commentDate = commentDate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getVisible() {
        return visible;
    }

    public void setVisible(int visible) {
        this.visible = visible;
    }
}
