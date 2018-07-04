package controller.servlets;

import view.Receivers;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Administrator on 2018/7/4.
 */
public class RegisterServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int status= Receivers.Register.registerFromRequest(request);

        RequestDispatcher dispatcher;
        switch (status){
            case 0:
                dispatcher=request.getRequestDispatcher("/welcome");
                dispatcher.forward(request,response);break;
            default:
                dispatcher=request.getRequestDispatcher("/register/register.html");
                dispatcher.forward(request,response);break;
        }

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
