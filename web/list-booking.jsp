<%-- 
    Document   : index.jsp
    Created on : 29-Nov-2019, 10:59:01
    Author     : hhch0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ict.bean.UserBean"%>
<%@page import="ict.bean.CenterBookingBean"%>
<%@page import="ict.bean.TrainerBookingBean"%>
<jsp:useBean id="userInfo" scope="session" class="ict.bean.UserBean" />
<jsp:useBean id="bookingList" scope="request" class="java.util.ArrayList<ict.bean.CenterBookingBean>" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Account</title>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
        <style>
            .dataTables_wrapper .dataTables_length, .dataTables_wrapper .dataTables_filter,
            .dataTables_wrapper .dataTables_info, .dataTables_wrapper .dataTables_processing,
            .dataTables_wrapper .dataTables_paginate {
                color: #ffffff;
            }
        </style>
    </head>
    <jsp:include page="./leftNavbar.jsp" />
    <jsp:include page="./topNavbar.jsp" />
    <body>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="page-header">
                    <h3 class="page-title"> Booking </h3>
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
                                <h4 class="card-title">Bookings</h4>
                                <div class="table-responsive">
                                    <table class="" id="tableGym">
                                        <thead>
                                            <tr>
                                                <th> # </th>
                                                <th> Start Time </th>
                                                <th> Location </th>
                                                <th> Trainer </th>
                                                <th> Book User </th>
                                                <th> Price </th>
                                                <th> Status </th>
                                                <th> Action  </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                            ArrayList<CenterBookingBean> booking = (ArrayList<CenterBookingBean>) request.getAttribute("bookingList");
                                            if (booking != null) {
                                                for (int i = 0; i < booking.size(); i++) {
                                                    CenterBookingBean c = booking.get(i);
                                                    TrainerBookingBean t = booking.get(i).getTrainerBooking();
                                                    out.println("<tr style='background-color: #191c24;'>");
                                                    out.println("<td class='id'>" + i + "</td>");
                                                    out.println("<td>" + c.getStartDate() +" "+ c.getStartTime() + "</td>");
                                                    out.println("<td>" + c.getCenterName() + "</td>");
                                                    out.println("<td>" + t.getTrainerName() + "</td>");
                                                    out.println("<td>" + c.getBookingUserName() + "</td>");
                                                    out.println("<td>$" + (c.getPrice()+t.getPrice()) + "</td>");
                                                    out.println("<td>" + c.getStatus() + "</td>");
                                                    out.println("<td><a class='mr-2' href='" + request.getContextPath() + "/staff/handleBooking?action=Detail&id=" + c.getId() + "&role="+ userInfo.getRole() +"''><i class='mdi mdi-eye mdi-18px text-warning'></i></a>");
                                                    out.println("<a class='mr-2' href='" + request.getContextPath() + "/staff/handleBooking?action=Edit&id=" + c.getId() + "&role="+ userInfo.getRole() +"'><i class='mdi mdi-pen mdi-18px'></i></a>");
                                                    out.println("<a class='mr-2' href='" + request.getContextPath() + "/staff/handleBooking?action=Delete&id=" + c.getId() + "&role="+ userInfo.getRole() +"'><i class='mdi mdi-delete mdi-18px text-danger'></i></a></td>");
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
    <jsp:include page="./footer.jsp" />
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $('#tableGym').DataTable();
    </script>
</html>