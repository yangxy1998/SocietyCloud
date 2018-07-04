package controller;

import com.mysql.cj.jdbc.Driver;
import controller.functions.Creator;
import controller.functions.Loader;
import controller.functions.Managers;
import model.entity.User;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 * 测试是否可连接数据库
 *
 * Created by Administrator on 2018/7/4.
 */
public class Test {
    public String getDescription(){
        String resource = "mybatis.xml";
        //使用类加载器加载mybatis的配置文件（它也加载关联的映射文件）
        InputStream is = Test.class.getClassLoader().getResourceAsStream(resource);
        //构建sqlSession的工厂
        SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(is);

        SqlSession session = sessionFactory.openSession();
        Loader.LoadDAOs(session);
        Creator.createTables(session);
        Managers.UserManager.createUser("123","testuser","admin","12312345678");
        User user= Managers.UserManager.getUserById("123");
        String result = user.getUserName();
        session.close();
        return result;
    }

    public static void connectMySql()
    {
        Connection con = null;  //定义空的连接
        try {
            Class.forName(Driver.class.getName()); //注册驱动
            String url="jdbc:mysql://localhost:3306/root?useUnicode=true&characterEncoding=utf-8&useSSL=true&autoReconnect=true";
            String name="root";
            String pass="admin";
            con = DriverManager.getConnection(url,name,pass);  //获取连接，赋值给con
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String args[]){
        Test test = new Test();
        System.out.println(test.getDescription());
    }
}
