package util.functions;

import controller.implementation.LoginImpl;
import controller.implementation.RegisterImpl;
import model.DAO.UserDAO;
import model.Managers;
import org.apache.ibatis.session.SqlSession;
import view.Receivers;

/**
 *
 * @author 杨晓宇
 *
 * 加载所有接口类
 * @see Managers 这里装配了所有数据库管理者
 * @see Receivers 这里装配了所有请求接收者
 *
 * Created by Administrator on 2018/7/4.
 *
 */
public class Loader {

    /**
     * 加载所有后台管理接口
     * @param session
     */
    public static void LoadDAOs(SqlSession session){
        Managers.UserManager=session.getMapper(UserDAO.class);
    }

    /**
     * 加载所有前端工具接口
     */
    public static void LoadReceivers(){
        Receivers.Login=new LoginImpl();
        Receivers.Register=new RegisterImpl();
    }
}
