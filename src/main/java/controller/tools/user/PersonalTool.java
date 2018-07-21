package controller.tools.user;

/**
 * Created by Administrator on 2018/7/10.
 * @author 杨晓宇
 */
public class PersonalTool {

    public static boolean checkParameter(String parameterName){
        if(parameterName.equals("phoneNum") ||parameterName.equals("nickName")
                ||parameterName.equals("realName") ||parameterName.equals("academicNum")
                ||parameterName.equals("schoolName")||parameterName.equals("idCard")
                ||parameterName.equals("description"))
            return true;
        else return false;
    }

}
