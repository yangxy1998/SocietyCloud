package controller.tools.admin;

/**
 * Created by Administrator on 2018/7/8.
 * @author 杨晓宇
 */
public class AdminTool {

    public static String getOperation(String parameterName){
        String[] s=parameterName.split("->");
        if(s.length>1)return s[0];
        else return null;
    }

    public static String getId(String parameterName) {
        String[] s=parameterName.split("->");
        if(s.length>1)return s[1];
        else return null;
    }
}
