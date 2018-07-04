package controller.functions;

import controller.implementation.LoginImpl;
import controller.implementation.RegisterImpl;
import model.DAO.UserDAO;
import org.apache.ibatis.session.SqlSession;
import view.Tool;

/**
 *
 * @autuor 杨晓宇
 *
 * 加载所有接口类
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
    public static void LoadTools(){
        Tool.Login=new LoginImpl();
        Tool.Register=new RegisterImpl();
    }
}
