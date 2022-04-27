
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.UserBean;
import ict.db.UserDB;
import ict.bean.CenterBean;
import ict.db.CenterDB;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Melo
 */
@WebServlet(name = "HandleUserDetail", urlPatterns = {"/HandleUserDetail"})
public class HandleUserDetail extends HttpServlet {

    private UserDB db;
    private CenterDB cDB;

    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        db = new UserDB(dbUrl, dbUser, dbPassword);
        cDB = new CenterDB(dbUrl, dbUser, dbPassword);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("Inquire")) {
            String id = request.getParameter("id");
            UserBean bean = db.getUserInfoByID(id);
            request.setAttribute("trainer", bean);
            RequestDispatcher rd;
            rd = this.getServletContext().getRequestDispatcher("/customer/personal-trainer-detail.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("edit-profile")) {
            String id = request.getParameter("id");
            UserBean bean = new UserBean();
            bean.setId(request.getParameter("id"));
            bean.setFirstName(request.getParameter("firstName"));
            bean.setLastName(request.getParameter("lastName"));
//            bean.setGender(request.getParameter("gender"));
            bean.setGender(request.getParameter("gender"));
            bean.setAddress(request.getParameter("address").toString());
            bean.setPhone(Integer.parseInt(request.getParameter("phone")));
            bean.setBirthday(request.getParameter("birthday"));
            if(db.editProfile(bean)){
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession(true);
            ArrayList<CenterBean> centerBean = cDB.queryActiveCenter();
            session.setAttribute("centers", centerBean);
            ArrayList<UserBean> trainers = db.queryActiveTrainersWithPrice();
            session.setAttribute("trainers", trainers);
            bean = db.getUserInfoByID(request.getParameter("id"));
            session.setAttribute("userInfo", bean);
            RequestDispatcher rd;
            if(request.getParameter("role").equalsIgnoreCase("customer")){
                rd = this.getServletContext().getRequestDispatcher("/customer/dashboard.jsp");
            } else if (request.getParameter("role").equalsIgnoreCase("staff")){
                rd = this.getServletContext().getRequestDispatcher("/staff/dashboard.jsp");
            } else {
                rd = this.getServletContext().getRequestDispatcher("/trainer/dashboard.jsp");
            }
            rd.forward(request, response);
            } else {
            PrintWriter out = response.getWriter();
            out.println("fail!!");
            out.println(request.getParameter("id"));
            out.println(request.getParameter("firstName"));
            out.println(request.getParameter("lastName"));
            out.println(request.getParameter("gender"));
            out.println(request.getParameter("address"));
            out.println(request.getParameter("birthday"));
            out.println(request.getParameter("phone"));
            }
        } else {
            PrintWriter out = response.getWriter();
            out.println("No such action!!");
        }
    }
}
