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

    private static boolean isChinese(char c) {
        Character.UnicodeBlock ub = Character.UnicodeBlock.of(c);
        if (ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS
                || ub == Character.UnicodeBlock.CJK_COMPATIBILITY_IDEOGRAPHS
                || ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A
                || ub == Character.UnicodeBlock.GENERAL_PUNCTUATION
                || ub == Character.UnicodeBlock.CJK_SYMBOLS_AND_PUNCTUATION
                || ub == Character.UnicodeBlock.HALFWIDTH_AND_FULLWIDTH_FORMS) {
            return true;
        }
        return false;
    }

    /**
     * 判断一个字符串是否有中文
     * @param str 字符串
     * @return 是否有中文
     */
    public static boolean isChinese(String str) {
        char[] ch = str.toCharArray();
        for (int i = 0; i < ch.length; i++) {
            char c = ch[i];
            if (isChinese(c)) {
                return true;
            }
        }
        return false;
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
    public static List<MainType> getMainTypes(){
        List<MainType> mainTypes=new ArrayList<>();
        mainTypes.add(new MainType("实践类"));
        mainTypes.add(new MainType("学术类"));
        mainTypes.add(new MainType("体育类"));
        mainTypes.add(new MainType("艺术类"));
        mainTypes.add(new MainType("其他类"));
        return mainTypes;
    }

    /**
     * 通过主类型获取次级类型
     * @param mainType 主类型
     * @return 次级类型
     */
    public static List<String> getSubTypes(String mainType){
        List<String> subTypes=new ArrayList<>();
        if(("实践类").equals(mainType)){
            subTypes.add("志愿者");
            subTypes.add("创新类");
            subTypes.add("学生会");
        }
        if(("学术类").equals(mainType)){
            subTypes.add("数学类");
            subTypes.add("物理类");
            subTypes.add("化学类");
            subTypes.add("文学类");
            subTypes.add("计算机类");
        }
        if(("体育类").equals(mainType)){
            subTypes.add("足球类");
            subTypes.add("篮球类");
            subTypes.add("排球类");
        }
        if(("艺术类").equals(mainType)){
            subTypes.add("美术类");
            subTypes.add("影视类");
            subTypes.add("歌舞类");
        }
        if(("其他类").equals(mainType)){
            subTypes.add("无");
        }
        return subTypes;
    }

    public static List<String> getActivityTypes(){
        List<String> types=new ArrayList<>();
        types.add("在线类");
        types.add("观赏类");
        types.add("游戏类");
        types.add("竞赛类");
        types.add("其他类");
        return types;
    }

    public static List<String> getActivityLimits(){
        List<String> types=new ArrayList<>();
        types.add("不限");
        types.add("只限认证人员");
        types.add("只限社团人员");
        types.add("只限社团管理员");
        return types;
    }

    public static String getMainTypeFromSubType(String subType){
        for (MainType mainType:getMainTypes()) {
            for(String s:mainType.getSubTypes()){
                if(s.equals(subType))return mainType.getMainType();
            }
        }
        return null;
    }

    public int createRandomNumber(int seed){
        return (int)(Math.random()*seed);
    }
}
