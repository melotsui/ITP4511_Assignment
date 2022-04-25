
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.UserBean;
import ict.db.UserDB;

import ict.db.UserDB;
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
 * @author Melo
 */
@WebServlet(name = "HandleChangePassword", urlPatterns = {"/HandleChangePassword"})
public class HandleChangePassword extends HttpServlet {

    private UserDB db;

    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        db = new UserDB(dbUrl, dbUser, dbPassword);
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
        String id = request.getParameter("id");
        String oldPw = request.getParameter("current-password");
        String newPw = request.getParameter("new-password");
        String confirmPw = request.getParameter("confirm-new-password");
        if (newPw.equals(confirmPw)) {
            if (db.changePassword(id, oldPw, newPw)) {
                PrintWriter out = response.getWriter();
                out.println("Success");
//            response.sendRedirect("handleCustomer?action=list");
            } else {
                PrintWriter out = response.getWriter();
                out.println("fail");
            }
        } else {
                PrintWriter out = response.getWriter();
                out.println("Confirm Password is not match!!");
            }
    }
}
