package controller.servlet;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import util.exception.MapperNotFoundException;
import util.function.Log;
import util.function.Loader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;

/**
 *
 * 初始化所有整个应用程序，是最先运行的servlet
 *
 * @see Loader 加载者
 *
 *
 * Created by Administrator on 2018/7/4.
 * @author 杨晓宇
 * @author 林志宸
 */

public class InitServlet extends HttpServlet {

    public static SqlSession session;

    @Override
    public void init() throws ServletException {
        Log.addLog("Servlet初始化中...");
        String resource = "mybatis.xml";
        //使用类加载器加载mybatis的配置文件（它也加载关联的映射文件）
        InputStream is = InitServlet.class.getClassLoader().getResourceAsStream(resource);
        //构建sqlSession的工厂
        SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(is);
        session = sessionFactory.openSession();
        try {
            Loader.LoadDAOs(session);
            Log.addLog("数据访问对象库加载成功！");
        } catch (MapperNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public void destroy() {
        Log.addLog("关闭服务中...");
        session.commit();
        session.close();
        Log.addLog("servlet服务已关闭。");
    }
}
