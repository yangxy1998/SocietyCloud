package controller.tools.user;

import model.entity.Society;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.List;

/**
 * Created by Administrator on 2018/7/13.
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

}
