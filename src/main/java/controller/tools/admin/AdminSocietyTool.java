package controller.tools.admin;

/**
 * Created by Administrator on 2018/7/8.
 * @author 杨晓宇
 */
public class AdminSocietyTool {

    public static boolean checkParameter(String parameterName){
        if(parameterName.equals("societyId")||parameterName.equals("societyName")
                ||parameterName.equals("schoolName")||parameterName.equals("mainType")
                ||parameterName.equals("subType")||parameterName.equals("foundDate")
                ||parameterName.equals("founder")
                ||parameterName.equals("status")||parameterName.equals("description"))
            return true;
        else return false;
    }

}
