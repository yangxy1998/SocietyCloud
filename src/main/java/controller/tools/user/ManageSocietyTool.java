package controller.tools.user;

import model.entity.Society;
import model.entity.User;
import model.relation.UserManageSociety;

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

    public static UserManageSociety isManager(User user, Society society){
        for (UserManageSociety ums:society.getManageUsers()) {
            if(ums.getUserId().equals(user.getUserId()))return ums;
        }
        return null;
    }
}
