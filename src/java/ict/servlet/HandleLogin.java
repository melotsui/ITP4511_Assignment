
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.UserBean;
import ict.bean.CenterBean;

import ict.db.UserDB;
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
@WebServlet(name = "HandleLogin", urlPatterns = {"/HandleLogin"})
public class HandleLogin extends HttpServlet {

    private UserDB db;
    private CenterDB centerDb;

    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        db = new UserDB(dbUrl, dbUser, dbPassword);
        centerDb = new CenterDB(dbUrl, dbUser, dbPassword);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (!isAuthenticated(request)
                && !("authenticate".equals(action))) {
            doLogin(request, response);
            return;
        }
        if ("authenticate".equals(action)) {
            doAuthenticate(request, response);
        } else if ("logout".equals(action)) {
            doLogout(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_IMPLEMENTED);
        }
    }

    public void doAuthenticate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String targetURL;
        boolean isValid = db.isValidUser(email, password);
        if (isValid) {
            HttpSession session = request.getSession(true);
            UserBean bean = db.getUserInfoByEmail(email);
            ArrayList<CenterBean> centerBean = centerDb.queryActiveCenter();
            ArrayList<UserBean> trainers = db.queryActiveTrainersWithPrice();
            session.setAttribute("centers", centerBean);
            session.setAttribute("trainers", trainers);
            session.setAttribute("userInfo", bean);
            targetURL = "index.jsp";
        } else {
            targetURL = "login.jsp";
        }
        RequestDispatcher rd;
        rd = getServletContext().getRequestDispatcher("/" + targetURL);
        rd.forward(request, response);

    }

    private boolean isAuthenticated(HttpServletRequest request) {
        boolean result = false;
        HttpSession session = request.getSession();
        if (session.getAttribute("userInfo") != null) {
            result = true;
        }
        return result;
    }

    private void doLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String targetURL = "login.jsp";
        RequestDispatcher rd;
        rd = getServletContext().getRequestDispatcher("/" + targetURL);
        rd.forward(request, response);
    }

    private void doLogout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute("userInfo");
            session.removeAttribute("centers");
            session.removeAttribute("trainers");
            session.invalidate();
        }

        doLogin(request, response);
    }
}
