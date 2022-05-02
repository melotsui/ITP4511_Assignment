<%-- 
    Document   : index.jsp
    Created on : 29-Nov-2019, 10:59:01
    Author     : lcshum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ict.bean.UserBean"%>
<jsp:useBean id="userInfo" scope="session" class="ict.bean.UserBean" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                if (userInfo.getRole().equalsIgnoreCase("Customer")){
                    response.sendRedirect("./customer/dashboard.jsp");
                } else if (userInfo.getRole().equalsIgnoreCase("Staff")){
                    response.sendRedirect("./staff/dashboard.jsp");
                } else if (userInfo.getRole().equalsIgnoreCase("Personal Trainer")){
                    response.sendRedirect("HandleBooking?action=listing&id="+userInfo.getId()+"&role="+userInfo.getRole());
                }
            } catch (Exception ex) {
                response.sendRedirect("./login.jsp");
            }
        %>
    </body>
</html>