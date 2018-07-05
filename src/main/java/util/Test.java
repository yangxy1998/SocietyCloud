package util;

import util.functions.Creator;
import util.functions.Loader;
import model.Managers;
import model.entity.User;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

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
        Creator.findTables(session);
        Managers.UserManager.createUser("000000000000000000","DBConnectSuccess","admin","10000000001");
        User user= Managers.UserManager.getUserById("000000000000000000");
        String result = user.getUserName();
        session.close();
        return result;
    }

    public static void main(String args[]){
        Test test = new Test();
        System.out.println(test.getDescription());
    }
}
