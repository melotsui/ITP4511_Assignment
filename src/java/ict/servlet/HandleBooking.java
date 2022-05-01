/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.CenterBean;
import ict.bean.CenterBookingBean;
import ict.bean.TrainerBookingBean;
import ict.bean.UserBean;
import ict.db.BookingDB;
import ict.db.CenterDB;
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
@WebServlet(name = "HandleBooking", urlPatterns = {"/HandleBooking"})
public class HandleBooking extends HttpServlet {

    BookingDB bookingDB;
    CenterDB centerDB;
    UserDB userDB;

    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        bookingDB = new BookingDB(dbUrl, dbUser, dbPassword);
        centerDB = new CenterDB(dbUrl, dbUser, dbPassword);
        userDB = new UserDB(dbUrl, dbUser, dbPassword);
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
        String id = request.getParameter("id");
        String role = request.getParameter("role");
        String action = request.getParameter("action");
        PrintWriter out = response.getWriter();
        switch (action) {
            case "listing":
                ArrayList<CenterBookingBean> bookingList = bookingDB.queryBookings();
                request.setAttribute("bookingList", bookingList);
                System.out.println(bookingList);
                RequestDispatcher rdd;
                rdd = this.getServletContext().getRequestDispatcher("/list-booking.jsp");
                rdd.forward(request, response);
                break;
            case "getBookingInfo":
                ArrayList<UserBean> trainersWithPrice = userDB.queryActiveTrainersWithPrice();
                ArrayList<CenterBean> centersWithPrice = centerDB.queryActiveCenter();
                request.setAttribute("centersWithPrice", centersWithPrice);
                request.setAttribute("trainersWithPrice", trainersWithPrice);
                RequestDispatcher rd;
                rd = this.getServletContext().getRequestDispatcher("/customer/add-booking.jsp");
                rd.forward(request, response);
                break;
            case "add":
                String[] centers = request.getParameterValues("center");
                String[] dates = request.getParameterValues("date");
                String[] times = request.getParameterValues("time");
                String[] trainers = request.getParameterValues("trainer");
                for (int i = 0; i < centers.length; i++) {
                    System.out.println(centers[i] + " " + dates[i] + " " + times[i] + " " + trainers[i]);
                    CenterBookingBean centerBean = new CenterBookingBean();
                    centerBean.setCenterID(centers[i]);
                    centerBean.setStartDate(dates[i]);
                    centerBean.setStartTime(times[i]);
                    if (!trainers[i].equalsIgnoreCase("") && trainers[i] != null) {
                        TrainerBookingBean trainerBean = new TrainerBookingBean();
                        trainerBean.setTrainerID(trainers[i]);
                        centerBean.setTrainerBooking(trainerBean);
                    }
                    if (bookingDB.addBooking(centerBean, userBean.getId())) {
                        response.sendRedirect(request.getContextPath() + "/HandleBooking?action=listing&role=" + role + "&id=" + userBean.getId());
                    } else {
                        out.println("booking fail");
                    }
                }
                break;
            case "Edit":
                trainersWithPrice = userDB.queryActiveTrainersWithPrice();
                centersWithPrice = centerDB.queryActiveCenter();
                request.setAttribute("centersWithPrice", centersWithPrice);
                request.setAttribute("trainersWithPrice", trainersWithPrice);
                CenterBookingBean centerBookingBean = new CenterBookingBean();
                centerBookingBean = bookingDB.queryBookingById(id);
                TrainerBookingBean trainerBookingBean = new TrainerBookingBean();
                trainerBookingBean = centerBookingBean.getTrainerBooking();
                System.out.println(trainerBookingBean);
                request.setAttribute("centerBookingBean", centerBookingBean);
                request.setAttribute("trainerBookingBean", trainerBookingBean);
                rd = this.getServletContext().getRequestDispatcher("/customer/update-booking.jsp");
                rd.forward(request, response);
                break;
            case "Detail":
                centerBookingBean = new CenterBookingBean();
                centerBookingBean = bookingDB.queryBookingById(id);
                trainerBookingBean = new TrainerBookingBean();
                trainerBookingBean = centerBookingBean.getTrainerBooking();
                System.out.println(trainerBookingBean);
                request.setAttribute("centerBookingBean", centerBookingBean);
                request.setAttribute("trainerBookingBean", trainerBookingBean);
                rd = this.getServletContext().getRequestDispatcher("/customer/view-booking.jsp");
                rd.forward(request, response);

                break;
            case "Cancel":
                if (bookingDB.cancelBooking(id)) {
                    response.sendRedirect(request.getContextPath() + "/HandleBooking?action=listing&role=" + role + "&id=" + userBean.getId());
                } else {
                    out.println("Cancel fail");
                }
                break;
            case "Update":
                String status = request.getParameter("status");
                if (status.equalsIgnoreCase("Waiting")) {
                    centerBookingBean = new CenterBookingBean();
                    trainerBookingBean = new TrainerBookingBean();
                    centerBookingBean.setId(request.getParameter("centerBookingID"));
                    centerBookingBean.setCenterID(request.getParameter("centerID"));
                    centerBookingBean.setStartDate(request.getParameter("date"));
                    centerBookingBean.setStartTime(request.getParameter("time"));
                    centerBookingBean.setHandledBy(request.getParameter("handledBy"));
                    trainerBookingBean.setTrainerID(request.getParameter("trainerID"));
//                    trainerBookingBean.setId(request.getParameter("trainerBookingID"));
                    if (bookingDB.updateBooking(centerBookingBean, trainerBookingBean)) {
                        if (bookingDB.updateTrainerBooking(centerBookingBean, trainerBookingBean)) {
                            response.sendRedirect(request.getContextPath() + "/HandleBooking?action=listing&role=" + role + "&id=" + userBean.getId());
                        } else {
                            out.println("Edit trainerBookingBean fail");
                        }
                    } else {
                        out.println("Edit centerBookingBean fail");
                    }
                } else {
                    out.println("Booking is already " + status);
                }
                break;
            default:
                break;
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
