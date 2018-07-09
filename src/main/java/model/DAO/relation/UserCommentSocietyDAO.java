package model.DAO.relation;

import model.relation.UserCommentSociety;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/7/9.
 * @author 杨晓宇
 * @author 程乐
 */
public interface UserCommentSocietyDAO {

    /**
     * 获得一个用户的所有评论
     * @param userId 用户id
     * @return 评论列表
     */
    List<UserCommentSociety> getCommentsByUserId(@Param("userId") String userId);

    /**
     * 获得一个社团的所有评论
     * @param societyId 社团id
     * @return 评论列表
     */
    List<UserCommentSociety> getCommentsBySocieyId(@Param("societyId") String societyId);

    /**
     * 给一个社团留评论
     * @param userId 用户id
     * @param societyId 社团id
     * @param commentDate 评论日期
     * @param comment 评论内容
     */
    void commentToSociety(@Param("userId") String userId,
                          @Param("societyId") String societyId,
                          @Param("commentDate") String commentDate,
                          @Param("comment") String comment);

    /**
     * 显示一个评论
     * @param userId 用户id
     * @param societyId 社团id
     * @param commentDate 评论日期
     */
    void showComment(@Param("userId") String userId,
                     @Param("societyId") String societyId,
                     @Param("commentDate") String commentDate);

    /**
     * 隐藏一个评论
     * @param userId 用户id
     * @param societyId 社团id
     * @param commentDate 评论日期
     */
    void hideComment(@Param("userId") String userId,
                     @Param("societyId") String societyId,
                     @Param("commentDate") String commentDate);

    /**
     * 置顶一个评论
     * @param userId 用户id
     * @param societyId 社团id
     * @param commentDate 评论日期
     */
    void summitComment(@Param("userId") String userId,
                       @Param("societyId") String societyId,
                       @Param("commentDate") String commentDate);

}
