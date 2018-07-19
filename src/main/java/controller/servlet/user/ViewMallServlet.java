package controller.servlet.user;

import controller.tools.user.ViewMallTool;
import model.Managers;
import model.entity.Society;
import util.function.Creator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/7/13.
 */
public class ViewMallServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Society> societies=new ArrayList<>();
        HttpSession session=request.getSession(false);
        //TODO:获取社团列表
        List<Society> allSocieties=Managers.SocietyManager.getAllSocieties();
        societies= Managers.SocietyManager.getAllSocieties();
        session.setAttribute("societies",societies);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession(false);
        String keyword=ViewMallTool.getKeyword(request);
        List<Society> societies;
        String page;
        List<String> pages;
        try {
            if(keyword!=null){
                page=ViewMallTool.getPageWithKeyword(keyword,request);
                societies=ViewMallTool.getShowSocietiesWithKeyword(page,keyword);
                pages=ViewMallTool.getPagesWithKeyword(keyword);
            }
            else{
                String mainType= ViewMallTool.getMainType(request);
                String subType=ViewMallTool.getSubType(request);
                if(mainType==null&&subType!=null)mainType=Creator.getMainTypeFromSubType(subType);
                page=ViewMallTool.getPage(mainType,subType,request);
                pages=ViewMallTool.getPages(mainType,subType);
                societies=ViewMallTool.getShowSocieties(page,mainType,subType);
            }
            session.setAttribute("societies",societies);
            session.setAttribute("currentPages",pages);
            session.setAttribute("currentPage",page);
            session.setAttribute("mainTypes", Creator.getMainTypes());
        } catch (InterruptedException e){
            e.printStackTrace();
        }
        response.sendRedirect("../societies/view.jsp");
    }
}
