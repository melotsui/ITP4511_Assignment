<%-- 
    Document   : index.jsp
    Created on : 29-Nov-2019, 10:59:01
    Author     : hhch0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ict.bean.UserBean"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Account</title>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">

    </head>
    <jsp:include page="../leftNavbar.jsp" />
    <jsp:include page="../topNavbar.jsp" />
    <body>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="page-header">
                    <h3 class="page-title"> Account </h3>
                    <!--                                  
                      <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                          <li class="breadcrumb-item"><a href="#">Forms</a></li>
                          <li class="breadcrumb-item active" aria-current="page">Form elements</li>
                        </ol>
                      </nav>
                    -->
                </div>
                <div class="row">
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Accounts</h4>
                                <div class="table-responsive">
                                    <table class="" id="tableGym">
                                        <thead>
                                            <tr>
                                                <th> # </th>
                                                <th> Name </th>
                                                <th> Email </th>
                                                <th> Role </th>
                                                <th> Fee </th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        <%
                                        ArrayList<UserBean> accounts = (ArrayList<UserBean>) request.getAttribute("accounts");
                                        if (accounts != null) {
                                            for (int i = 0; i < accounts.size(); i++) {
                                                UserBean c = accounts.get(i);
                                                out.println("<tr style='background-color: #191c24;'>");
                                                out.println("<td class='id'>" + c.getId() + "</td>");
                                                out.println("<td>" + c.getLastName() + " " + c.getFirstName()+ "</td>");
                                                out.println("<td>" + c.getEmail() + "</td>");
                                                out.println("<td>" + c.getRole() + "</td>");
                                                out.println("<td><a class=\"linkDelete\" href=\"handleCustomer?action=delete&id=" + c.getId() + "\">delete</a></td>");
                                                out.println("<td><a href=\"handleCustomer?action=getEditCustomer&id=" + c.getId() + "\">edit</a></td>");
                                                out.println("</tr>");

                                            }
                                        } else {
                                            out.println("No Customer");
                                        }
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->
            <!-- partial:partials/_footer.html -->
            <!-- main-panel ends -->
    </body>
    <jsp:include page="../footer.jsp" />
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $('#tableGym').DataTable();
    </script>
</html>