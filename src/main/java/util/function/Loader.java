package util.function;

import model.DAO.LogDAO;
import model.DAO.entity.ActivityDAO;
import model.DAO.entity.SocietyDAO;
import model.DAO.entity.UserDAO;
import model.DAO.relation.*;
import model.Managers;
import org.apache.ibatis.session.SqlSession;
import util.exception.MapperNotFoundException;

/**
 *
 *
 * 加载所有接口类
 * @see Managers 数据库管理者集
 *
 * Created by Administrator on 2018/7/4.
 * @author 杨晓宇
 */
public class Loader {

    /**
     * 加载所有后台管理接口
     * @throws MapperNotFoundException 如果找不到对应Mapper则会抛出异常
     * @param session
     */
    public static void LoadDAOs(SqlSession session) throws MapperNotFoundException {
        Managers.UserManager=session.getMapper(UserDAO.class);
        if(Managers.UserManager==null)throw new MapperNotFoundException();
        Managers.SocietyManager=session.getMapper(SocietyDAO.class);
        if(Managers.SocietyManager==null)throw new MapperNotFoundException();
        Managers.LogManager=session.getMapper(LogDAO.class);
        if(Managers.LogManager==null)throw new MapperNotFoundException();
        Managers.JoinSocietyManager =session.getMapper(UserJoinSocietyDAO.class);
        if(Managers.JoinSocietyManager ==null)throw new MapperNotFoundException();
        Managers.ManageManager=session.getMapper(UserManageSocietyDAO.class);
        if(Managers.ManageManager==null)throw new MapperNotFoundException();
        Managers.CommentManager=session.getMapper(UserCommentSocietyDAO.class);
        if(Managers.CommentManager==null)throw new MapperNotFoundException();
        Managers.ActivityManager=session.getMapper(ActivityDAO.class);
        if(Managers.ActivityManager==null)throw new MapperNotFoundException();
        Managers.JoinActivityManager=session.getMapper(UserJoinActivityDAO.class);
        if(Managers.JoinActivityManager==null)throw new MapperNotFoundException();
        Managers.OrganizeManager=session.getMapper(SocietyOrganizeActivityDAO.class);
        if(Managers.OrganizeManager==null)throw new MapperNotFoundException();
    }

}
