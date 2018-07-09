package util.function;

import org.apache.ibatis.session.SqlSession;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 *
 *
 *
 * 初始化所有项目表以及随机生成一些对象
 *
 * Created by Administrator on 2018/7/4.
 * @author 杨晓宇
 *
 */
public class Creator {

    /**
     * 获得一个18位纯数字UUID
     * @return 新的UUID
     */
    public static String createUUID(){
        String uuid = UUID.randomUUID().toString().replace("-", "").replaceAll("[a-zA-Z]","").substring(0,18);
        return uuid;
    }

    /**
     * 获得一个指定长度的字母数字混合UUID
     * @param length UUID长度
     * @return 新的UUID
     */
    public static String createUUID(int length){
        String uuid = UUID.randomUUID().toString().replace("-", "").substring(0,length);
        return uuid;
    }

    public static String getTime(){
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=format.format(new Date());
        return time;
    }

    public static String getTime(Date date){
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=format.format(date);
        return time;
    }

    public static Date getDate(){
        return new Date();
    }

    public static Date getDate(String time){
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        ParsePosition pos = new ParsePosition(0);
        Date date=format.parse(time,pos);
        return date;
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

    /**
     * 获取一个响应当中的js alert事件
     * @param content alert内容
     * @return js alert事件
     */
    public static String getAlert(String content){
        return "<script> alert(\""+content+"\"); </script>";
    }
}
