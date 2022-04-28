
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
@WebServlet(name = "HandleCenterDetail", urlPatterns = {"/HandleCenterDetail"})
public class HandleCenterDetail extends HttpServlet {

    private CenterDB db;
    private UserDB uDB;

    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        db = new CenterDB(dbUrl, dbUser, dbPassword);
        uDB = new UserDB(dbUrl, dbUser, dbPassword);
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
            CenterBean bean = db.queryCenterByID(id);
            request.setAttribute("center", bean);
            RequestDispatcher rd;
            rd = this.getServletContext().getRequestDispatcher("/customer/personal-trainer-detail.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("Delete")) {
            String id = request.getParameter("id");
            if (db.deleteCenterByID(id)) {

                HttpSession session = request.getSession(true);
                ArrayList<CenterBean> centerBean = db.queryActiveCenter();
                session.setAttribute("centers", centerBean);
                ArrayList<UserBean> trainers = uDB.queryActiveTrainersWithPrice();
                session.setAttribute("trainers", trainers);
                UserBean bean = (UserBean) session.getAttribute("userInfo");
                bean = uDB.getUserInfoByID(bean.getId());
                session.setAttribute("userInfo", bean);
                RequestDispatcher rd;
                if (request.getParameter("role").equalsIgnoreCase("customer")) {
                    response.sendRedirect(request.getContextPath() + "/customer/dashboard.jsp");
//                rd = this.getServletContext().getRequestDispatcher("/customer/dashboard.jsp");
                } else if (request.getParameter("role").equalsIgnoreCase("staff")) {
                    response.sendRedirect(request.getContextPath() + "/staff/dashboard.jsp");
//                rd = this.getServletContext().getRequestDispatcher("/staff/dashboard.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/trainer/dashboard.jsp");
//                rd = this.getServletContext().getRequestDispatcher("/trainer/dashboard.jsp");
                }
//            rd.forward(request, response);
            } else {

            }
        } else {
            PrintWriter out = response.getWriter();
            out.println("No such action!!");
        }
    }
}
