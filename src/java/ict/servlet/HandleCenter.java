/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

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

/**
 *
 * @author hhch0
 */
@WebServlet(name = "HandleCenter", urlPatterns = {"/staff/handleCenter"})
public class HandleCenter extends HttpServlet {

    private CenterDB centerDB;

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
        init();
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("getAll")) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            ArrayList<CenterBean> centers = centerDB.queryAllCenters();
            request.setAttribute("centers", centers);
            RequestDispatcher rd;
            rd = getServletContext().getRequestDispatcher("/staff/list-gym-center.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("add")) {
            CenterBean cb = new CenterBean();
            cb.setName(request.getParameter("name"));
            cb.setAddress(request.getParameter("address"));
            cb.setPhone(Integer.parseInt(request.getParameter("phone")));
            if (request.getParameter("active") != null) {
                cb.setIsActive(true);
            } else {
                cb.setIsActive(false);
            }
            if (centerDB.addCenter(cb)) {
                response.sendRedirect(request.getContextPath() + "/staff/handleCenter?action=getAll");
            } else {
                PrintWriter out = response.getWriter();
                out.print("fail");
            }
        } else if (action.equalsIgnoreCase("edit")) {
            if (request.getParameter("name") == null) {
                CenterBean cb = centerDB.queryCenterByID(request.getParameter("id"));
                request.setAttribute("center", cb);
                RequestDispatcher rd;
                rd = this.getServletContext().getRequestDispatcher("/staff/edit-gym-center.jsp");
                rd.forward(request, response);
            } else {
                CenterBean cb = new CenterBean();
                cb.setId(request.getParameter("id"));
                cb.setName(request.getParameter("name"));
                cb.setAddress(request.getParameter("address"));
                cb.setPhone(Integer.parseInt(request.getParameter("phone")));
                if (request.getParameter("active") != null) {
                    cb.setIsActive(true);
                } else {
                    cb.setIsActive(false);
                }
                if (centerDB.editCenter(cb)) {
                    response.sendRedirect(request.getContextPath() + "/staff/handleCenter?action=getAll");
                } else {
                    PrintWriter out = response.getWriter();
                    out.print("fail");
                }
            }
        } else {
            PrintWriter out = response.getWriter();
            out.print("No such action");
        }
    }

    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");

        centerDB = new CenterDB(dbUrl, dbUser, dbPassword);
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
