package controller.tools.admin;

/**
 * Created by Administrator on 2018/7/8.
 */
public interface AdminUserTool extends AdminTool{

    static boolean checkParameter(String parameterName){
        if(parameterName.equals("userId")||parameterName.equals("userName")
                ||parameterName.equals("password")||parameterName.equals("phoneNum")
                ||parameterName.equals("nickName")||parameterName.equals("realName")
                ||parameterName.equals("academicNum")||parameterName.equals("idCard")
                ||parameterName.equals("status")||parameterName.equals("description"))
            return true;
        else return false;
    }

}
