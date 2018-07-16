package controller.tools.user;

/**
 * Created by Administrator on 2018/7/13.
 */
public class ManageSocietyTool {

    public static String getCommentDate(String id){
        String depart[]=id.split("<-");
        return depart[1];
    }

    public static String getCommentUserId(String id){
        String depart[]=id.split("<-");
        return depart[0];
    }

}
