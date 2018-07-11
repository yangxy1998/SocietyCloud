package controller.servlet.admin;

import controller.tools.admin.AdminSocietyTool;
import controller.tools.admin.AdminTool;
import model.Managers;
import util.Log;
import util.function.Creator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

/**
 * 社团管理Servlet
 * Created by Administrator on 2018/7/8.
 * @author 杨晓宇
 * @author 林志宸
 */
public class AdminSocietyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher diapatcher=request.getRequestDispatcher("./admin/admin.jsp");
        Enumeration<String> parameterNames=request.getParameterNames();
        HttpSession session=request.getSession();
        String adminName=(String) session.getAttribute("adminName");
        while (parameterNames.hasMoreElements()){
            String parameterName=parameterNames.nextElement();
            String operation= AdminTool.getOperation(parameterName);
            if(operation!=null){
                String societyId=AdminTool.getId(parameterName);
                if(operation.equals("create")){
                    Log.addAdminLog("尝试添加一个社团。",adminName);
                    session.setAttribute("update",societyId);
                }
                else if(operation.equals("update")){
                    Log.addAdminLog("尝试修改社团"+societyId+"的信息。",adminName);
                    session.setAttribute("update",societyId);
                }
                else if(operation.equals("remove")){
                    Log.addAdminLog("尝试移除社团"+societyId+"的信息。",adminName);
                    session.setAttribute("update","");
                    String societyName=Managers.SocietyManager.getSocietyById(societyId).getSocietyName();
                    Managers.SocietyManager.deleteSociety(societyId);
                    Log.addAdminLog("移除社团"+societyId+"操作成功。",adminName);
                    Log.addSocietyLog("社团被管理员移除。",societyName);
                }
                else if(operation.equals("commit")){
                    request.setAttribute("update","");
                    if(societyId.equals("newSociety")){
                        String newSocietyId=request.getParameter("societyId");
                        String newSocietyName=request.getParameter("societyName");
                        String newSchoolName=request.getParameter("schoolName");
                        String newFoundDate=request.getParameter("foundDate");
                        String newFounder=request.getParameter("founder");
                        Managers.SocietyManager.createSociety(newSocietyId,newSocietyName,newSchoolName,null,null,newFoundDate,newFounder);
                        Log.addAdminLog("成功添加一个社团，其社团ID为："+societyId+"。",adminName);
                        Log.addSocietyLog("社团被管理员添加。",newSocietyName);
                    }
                    else {
                        Enumeration<String> parameters=request.getParameterNames();
                        List<String> values=new ArrayList<>();
                        while (parameters.hasMoreElements()){
                            String parameterN=parameters.nextElement();
                            if(AdminSocietyTool.checkParameter(parameterN))
                                values.add(Creator.getChineseBytes(request.getParameter(parameterN)));
                        }
                        Managers.SocietyManager.updateSociety(values.get(0),values.get(1),values.get(2)
                                ,values.get(3),values.get(4),values.get(5),values.get(6),
                                Integer.parseInt(values.get(7)),values.get(8));
                        Log.addAdminLog("更新社团"+societyId+"的信息，操作成功。",adminName);
                        Log.addSocietyLog("社团信息被管理员修改。",values.get(1));
                    }
                }
                else {
                    session.setAttribute("update","");
                    Log.addAdminLog("取消之前的操作。",adminName);
                }
            }
        }
        session.setAttribute("societies",Managers.SocietyManager.getAllSocieties());
        session.setAttribute("admin", "society");
        diapatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
