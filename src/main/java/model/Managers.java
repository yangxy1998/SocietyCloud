package model;

import model.DAO.LogDAO;
import model.DAO.entity.ActivityDAO;
import model.DAO.entity.SocietyDAO;
import model.DAO.entity.UserDAO;
import model.DAO.relation.*;


/**
 *
 *
 * 用于装配所有DAO的管理集合
 *
 * Created by Administrator on 2018/7/4.
 * @author 杨晓宇
 */


public class Managers {

    //用户实体 管理接口
    public static UserDAO UserManager;

    //社团实体 管理接口
    public static SocietyDAO SocietyManager;

    //活动实体 管理接口
    public static ActivityDAO ActivityManager;

    //日志管理接口
    public static LogDAO LogManager;

    //社团加入联系 管理接口
    public static UserJoinSocietyDAO JoinSocietyManager;

    //社团管理联系 管理接口
    public static UserManageSocietyDAO ManageManager;

    //社团评论联系 管理接口
    public static UserCommentSocietyDAO CommentManager;

    //活动加入联系 管理接口
    public static UserJoinActivityDAO JoinActivityManager;

    //活动举办联系 管理接口
    public static SocietyOrganizeActivityDAO OrganizeManager;
}
