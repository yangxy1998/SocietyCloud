package controller.servlets;

import controller.functions.Creator;
import controller.functions.Loader;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

/**
 *
 * @author 杨晓宇
 *
 * 初始化所有需要的工具接口
 *
 * Created by Administrator on 2018/7/4.
 *
 */

public class InitServlet extends HttpServlet {

    public static SqlSession session;

    @Override
    public void init() throws ServletException {
        String resource = "mybatis.xml";
        //使用类加载器加载mybatis的配置文件（它也加载关联的映射文件）
        InputStream is = InitServlet.class.getClassLoader().getResourceAsStream(resource);
        //构建sqlSession的工厂
        SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(is);

        session = sessionFactory.openSession();

        Loader.LoadDAOs(session);
        Loader.LoadReceivers();
        Creator.createTables(session);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        out.print("init");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        out.print("init");
    }

    @Override
    public void destroy() {
        session.close();
    }
}
