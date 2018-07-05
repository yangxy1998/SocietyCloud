package util.functions;

import org.apache.ibatis.session.SqlSession;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.UUID;

/**
 *
 * @author 杨晓宇
 *
 * 初始化所有项目表以及随机生成一些对象
 *
 * Created by Administrator on 2018/7/4.
 *
 */
public class Creator {

    /**
     * 获得一个UUID
     * @return 新的UUID
     */
    public static String getUUID(){
        String uuid = UUID.randomUUID().toString().replace("-", "").replaceAll("[a-zA-Z]","").substring(0,18);
        return uuid;
    }

    /**
     * 创建所有需要的表结构
     * @param session
     */
    public static void findTables(SqlSession session){
        try {
            Connection connection=session.getConnection();
            Statement stmt=connection.createStatement();
            stmt.execute(testTableUser());
        } catch (SQLException e) {
            System.out.println("SQLException: " + e.getMessage());
            System.out.println("SQLState: " + e.getSQLState());
            System.out.println("Error: " + e.getErrorCode());
            System.out.println("StackTrace: " + e.getStackTrace());
            e.printStackTrace();
        }
    }

    /**
     * 创建User表
     * @return User表的建表语句
     */
    public static String testTableUser()
    {
        String sql="";
        sql="SELECT * FROM User";
        return sql;
    }
}
