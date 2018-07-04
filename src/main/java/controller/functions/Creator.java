package controller.functions;

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
    public static void createTables(SqlSession session){
        try {
            Connection connection=session.getConnection();
            Statement stmt=connection.createStatement();
            stmt.execute(createTableUser());
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
    public static String createTableUser()
    {
        String sql="";
        sql="CREATE TABLE User(" +
                "userId VARCHAR(18) NOT NULL ," +
                "userName VARCHAR(18) NOT NULL ," +
                "password VARCHAR(18) NOT NULL ," +
                "phoneNum VARCHAR(11) NOT NULL ," +
                "nickName VARCHAR(32) ," +
                "realName VARCHAR(32) ," +
                "academicNum VARCHAR(20) ," +
                "idCard VARCHAR(18) ," +
                "status INTEGER(1) DEFAULT 1 ," +
                "description VARCHAR(128) DEFAULT '这个人很懒，什么也没写。'" +
                ");";
        return sql;
    }
}
