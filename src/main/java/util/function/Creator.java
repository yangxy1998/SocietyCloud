package util.function;

import org.apache.ibatis.session.SqlSession;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
        String uuid = UUID.randomUUID().toString().replace("-", "").replaceAll("[a-zA-Z]","").substring(0,17);
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
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
        String time=format.format(new Date());
        return time;
    }

    public static String getTime(Date date){
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
        String time=format.format(date);
        return time;
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
        return "<script language=\"javascript\"> alert(\""+content+"\"); </script>";
    }

    public static String getChineseBytes(String resource){
        String target="";
        try {
            target=new String(resource.getBytes("ISO-8859-1"),"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return target;
    }

    /**
     * 获取所有学校
     * @return 所有学校
     */
    public static List<String> getSchools(){
        List<String> schools=new ArrayList<>();
        schools.add("武汉大学");
        schools.add("武汉理工大学");
        schools.add("华中科技大学");
        schools.add("华中农业大学");
        schools.add("华中师范大学");
        schools.add("中国地质大学");
        schools.add("中南财经政法大学");
        return schools;
    }

    /**
     * 获取所有主要类型
     * @return 主要类型
     */
    public static List<String> getMainTypes(){
        List<String> mainTypes=new ArrayList<>();
        mainTypes.add("实践类");
        mainTypes.add("学术类");
        mainTypes.add("体育类");
        mainTypes.add("艺术类");
        return mainTypes;
    }

    /**
     * 通过主类型获取次级类型
     * @param mainType 主类型
     * @return 次级类型
     */
    public static List<String> getSubTypes(String mainType){
        List<String> subTypes=new ArrayList<>();
        if(mainType.equals("实践类")){
            subTypes.add("志愿者类");
            subTypes.add("创新类");
        }
        if(mainType.equals("学术类")){
            subTypes.add("数学类");
            subTypes.add("物理类");
            subTypes.add("化学类");
            subTypes.add("计算机类");
        }
        if(mainType.equals("体育类")){
            subTypes.add("足球类");
            subTypes.add("篮球类");
            subTypes.add("排球类");
        }
        if(mainType.equals("艺术类")){
            subTypes.add("戏曲类");
            subTypes.add("歌舞类");
            subTypes.add("乐器类");
            subTypes.add("美术类");
        }
        return subTypes;
    }
}
