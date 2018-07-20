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
public class UserCommentSociety extends Relation{

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
        if (entityType.equals("Society"))return Managers.SocietyManager.getSocietyById(societyId);
        else return null;
    }

    @Override
    public JSONObject getJSONObject() {
        JSONObject object=new JSONObject();
        object.put("societyId",societyId);
        object.put("userId",userId);
        object.put("commentDate",commentDate);
        object.put("comment",comment);
        object.put("visible",visible);
        return object;
    }

}
