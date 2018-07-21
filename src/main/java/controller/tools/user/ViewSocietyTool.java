package controller.tools.user;

import model.entity.Society;
import model.entity.User;
import model.relation.UserJoinSociety;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.List;

/**
 * Created by Administrator on 2018/7/13.
 * @author 杨晓宇
 */
public class ViewSocietyTool {

    public static String getSocietyId(HttpServletRequest request){
        HttpSession session=request.getSession(false);
        Enumeration<String> parameters=request.getParameterNames();
        List<Society> societies=(List<Society>)session.getAttribute("societies");
        if(parameters.hasMoreElements()){
            String societyId=parameters.nextElement();
            for(Society society:societies){
                if(society.getSocietyId().equals(societyId))return societyId;
            }
        }
        return null;
    }

    public static UserJoinSociety isJoinedIntoSociety(User user,Society society){
        for (UserJoinSociety ujs:society.getJoinUsers()) {
            if(ujs.getUserId().equals(user.getUserId()))return ujs;
        }
        return null;
    }

}
