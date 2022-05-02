/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.CenterBean;
import ict.bean.CenterBookingBean;
import ict.bean.ReportBean;
import ict.bean.TrainerBookingBean;
import ict.bean.UserBean;
import ict.db.BookingDB;
import ict.db.CenterDB;
import ict.db.ReportDB;
import ict.db.UserDB;
import ict.db.UserPriceDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hhch0
 */
@WebServlet(name = "HandleReport", urlPatterns = {"/HandleReport"})
public class HandleReport extends HttpServlet {

    BookingDB bookingDB;
    CenterDB centerDB;
    UserDB userDB;
    ReportDB reportDB;

    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        bookingDB = new BookingDB(dbUrl, dbUser, dbPassword);
        centerDB = new CenterDB(dbUrl, dbUser, dbPassword);
        userDB = new UserDB(dbUrl, dbUser, dbPassword);
        reportDB = new ReportDB(dbUrl, dbUser, dbPassword);
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UserBean userBean = (UserBean) request.getSession().getAttribute("userInfo");
        String action = request.getParameter("action");
        PrintWriter out = response.getWriter();
        if (action.equalsIgnoreCase("getBooingReportInfo")) {
            ArrayList<UserBean> trainersWithPrice = userDB.queryActiveTrainersWithPrice();
            ArrayList<CenterBean> centersWithPrice = centerDB.queryActiveCenter();
            request.setAttribute("centersWithPrice", centersWithPrice);
            request.setAttribute("trainersWithPrice", trainersWithPrice);
            
            ArrayList<ReportBean> cetnerBookingRate = reportDB.queryAllCenterBookingRate();
            ArrayList<ReportBean> trainerBookingRate = reportDB.queryAllTrainerBookingRate();
            request.setAttribute("cetnerBookingRate", cetnerBookingRate);
            request.setAttribute("trainerBookingRate", trainerBookingRate);
            
            RequestDispatcher rd;
            rd = this.getServletContext().getRequestDispatcher("/staff/report-booking-overview.jsp");
            rd.forward(request, response);

        } else if (action.equalsIgnoreCase("getIncomeReportInfo")) {

        } else {
            out.println("No such action");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
