<%-- 
    Document   : handle-exception
    Created on : 2022年4月20日, 下午12:55:56
    Author     : Melo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (exception instanceof NumberFormatException) {
                out.println("You are required to input an integer value <br/>");
            } else {
                out.println("Please select a operator<br/>");
            }

        %>
        <a href="calculateInput.jsp">Try again !!!</a>
    </body>
</html>
