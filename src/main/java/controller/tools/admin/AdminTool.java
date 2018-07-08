package controller.tools.admin;

/**
 * Created by Administrator on 2018/7/8.
 */
public interface AdminTool {

    static String getOperation(String parameterName){
        String[] s=parameterName.split("->");
        if(s.length>1)return s[0];
        else return null;
    }

    static String getId(String parameterName) {
        String[] s=parameterName.split("->");
        if(s.length>1)return s[1];
        else return null;
    }
}
