/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.UserBean;
import ict.bean.UserPriceBean;
import ict.db.UserPriceDB;
import ict.db.UserDB;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author hhch0
 */
@WebServlet(name = "HandleAccount", urlPatterns = {"/staff/handleAccount"})
@MultipartConfig(location = "d:\tmp",
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class HandleAccount extends HttpServlet {

    private UserDB db;
    private UserPriceDB upDB;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        init();
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        PrintWriter out = response.getWriter();
        if ("list".equalsIgnoreCase(action)) {
            ArrayList<UserBean> accounts = db.queryCust();
            request.setAttribute("accounts", accounts);
            RequestDispatcher rd;
            rd = getServletContext().getRequestDispatcher("/staff/list-account.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("add")) {
            UserBean account = new UserBean();
            account.setFirstName(request.getParameter("firstName"));
            account.setLastName(request.getParameter("lastName"));
            account.setPhone(Integer.parseInt(request.getParameter("phone")));
            account.setBirthday(request.getParameter("birthday"));
            account.setEmail(request.getParameter("email"));
            account.setGender(request.getParameter("gender"));
            account.setRole(request.getParameter("role"));
            account.setAddress(request.getParameter("address"));
            if (request.getParameter("active") != null) {
                account.setIsActive(true);
            } else {
                account.setIsActive(false);
            }
            InputStream inputStream = null; // input stream of the upload file
            // obtains the upload file part in this multipart request
            Part filePart = request.getPart("imgInputUser");
            if (filePart != null) {
                // prints out some information for debugging
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());

                if (filePart.getSize() > 0) {
                    // obtains input stream of the upload file
                    inputStream = filePart.getInputStream();
                }
            }
            if (db.addUser(account, inputStream)) {
                if (request.getParameter("role").equalsIgnoreCase("Personal Trainer")) {
                    String[] price = request.getParameterValues("price");
                    if (upDB.addUserPrice(2023, price[0])) {
                        if (upDB.addUserPrice(2022, price[1])) {
                            response.sendRedirect(request.getContextPath() + "/staff/handleAccount?action=list");
                        }
                        out.print("add center price[1] fail");
                    }
                    out.print("add center price[0] fail");
                } else {

                }
            } else {
                out.print("add user fail");
            }
//            out.print(account.toString());
        } else if (action.equalsIgnoreCase("edit")) {
            UserBean account = new UserBean();
            account.setId(request.getParameter("id"));
            account.setFirstName(request.getParameter("firstName"));
            account.setLastName(request.getParameter("lastName"));
            account.setPhone(Integer.parseInt(request.getParameter("phone")));
            account.setBirthday(request.getParameter("birthday"));
            account.setEmail(request.getParameter("email"));
            account.setGender(request.getParameter("gender"));
            account.setRole(request.getParameter("role"));
            account.setAddress(request.getParameter("address"));
            if (request.getParameter("active") != null) {
                account.setIsActive(true);
            } else {
                account.setIsActive(false);
            }
//            InputStream inputStream = null; // input stream of the upload file
//            // obtains the upload file part in this multipart request
//            Part filePart = request.getPart("imgInputUser");
//            if (filePart != null) {
//                // prints out some information for debugging
//                System.out.println(filePart.getName());
//                System.out.println(filePart.getSize());
//                System.out.println(filePart.getContentType());
//
//                if (filePart.getSize() > 0) {
//                    // obtains input stream of the upload file
//                    inputStream = filePart.getInputStream();
//                }
//            }
            
        }  else if (action.equalsIgnoreCase("getEditCustomer")) {
            String id = request.getParameter("id");
            String role = request.getParameter("role");
            if(role.equalsIgnoreCase("Personal Trainer")){
                UserBean ub = db.getUserInfoByID(id);
                request.setAttribute("user", ub);
                ArrayList<UserPriceBean> upList = upDB.queryUserPriceByID(request.getParameter("id"));
                request.setAttribute("userPrice", upList);
                RequestDispatcher rd;
                rd = this.getServletContext().getRequestDispatcher("/staff/edit-user.jsp");
                rd.forward(request, response);
            } else {
                
            }
        } else {
            out.print("No such action");
        }
    }

    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");

        upDB = new UserPriceDB(dbUrl, dbUser, dbPassword);
        db = new UserDB(dbUrl, dbUser, dbPassword);
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

}
