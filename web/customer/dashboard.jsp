<%-- 
    Document   : index.jsp
    Created on : 29-Nov-2019, 10:59:01
    Author     : lcshum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ict.bean.CenterBean"%>
<%@page import="ict.bean.UserBean"%>
<jsp:useBean id="centers" scope="session" class="java.util.ArrayList<ict.bean.CenterBean>" />
<jsp:useBean id="trainers" scope="session" class="java.util.ArrayList<ict.bean.UserBean>" />
<jsp:useBean id="userInfo" scope="session" class="ict.bean.UserBean" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Dashboard</title>
    </head>
    <jsp:include page="../leftNavbar.jsp" />
    <jsp:include page="../topNavbar.jsp" />
    <body>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="page-header">
                    <h3 class="page-title"> Dashboard </h3>
                    <!--                                  
                      <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                          <li class="breadcrumb-item"><a href="#">Forms</a></li>
                          <li class="breadcrumb-item active" aria-current="page">Form elements</li>
                        </ol>
                      </nav>
                    -->
                </div>
                <div class="row ">
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Personal Trainer</h4>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
<!--                                                <th>
                                                    <div class="form-check form-check-muted m-0">
                                                        <label class="form-check-label">
                                                            <input type="checkbox" class="form-check-input">
                                                        </label>
                                                    </div>
                                                </th>-->
                                                <th> # </th>
                                                <th> Personal Trainer Name </th>
                                                <th> Gender </th>
                                                <th> Email </th>
                                                <th> Phone </th>
                                                <th> Price </th>
                                                <th>  </th>
                                                <th>  </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                for(int i=0; i<trainers.size(); i++){
//                                                    out.println(centers.get(i).getAddress());
                                                    out.println("<tr>");
                                                    out.println("<td> " + (i+1) + " </td>");
                                                    out.println("<td><span class='pl-2'>" + trainers.get(i).getFirstName() + " " + trainers.get(i).getLastName() + "</span></td>");
                                                    out.println("<td>" + trainers.get(i).getGender() + "</td>");
                                                    out.println("<td>" + trainers.get(i).getEmail() + "</td>");
                                                    out.println("<td>" + trainers.get(i).getPhone() + "</td>");
                                                    out.println("<td>$" + trainers.get(i).getPrice() + "/h</td>");
                                                    out.println("<td><a href='" + request.getContextPath() + "/staff/handleAccount?action=Inquire&id=" + trainers.get(i).getId() + "&role="+ trainers.get(i).getRole() +"'><div class='badge badge-outline-success'>Detail</div></a></td>");
                                                    //out.println("<td><a href='" + request.getContextPath() + "/HandleUserDetail?action=Delete&id=" + trainers.get(i).getId() + "&role="+ userInfo.getRole() +"'><div class='badge badge-outline-success'>Delete</div></a></td>");
                                                    out.println("</tr>");
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Gym Center</h4>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
<!--                                                <th>
                                                    <div class="form-check form-check-muted m-0">
                                                        <label class="form-check-label">
                                                            <input type="checkbox" class="form-check-input">
                                                        </label>
                                                    </div>
                                                </th>-->
                                                <th> # </th>
                                                <th> Gym Center Name </th>
                                                <th> Location </th>
                                                <th> Phone </th>
                                                <th> Price </th>
                                                <th>  </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                for(int i=0; i<centers.size(); i++){
//                                                    out.println(centers.get(i).getAddress());
                                                    out.println("<tr>");
                                                    out.println("<td> " + (i+1) + " </td>");
                                                    out.println("<td><span class='pl-2'>" + centers.get(i).getName() + "</span></td>");
                                                    out.println("<td>" + centers.get(i).getAddress() + "</td>");
                                                    out.println("<td>" + centers.get(i).getPhone() + "</td>");
                                                    out.println("<td>$" + centers.get(i).getPrice() + "/h</td>");
                                                    out.println("<td><a href='" + request.getContextPath() + "/HandleCenterDetail?action=Inquire&id=" + centers.get(i).getId() + "'><div class='badge badge-outline-success'>Detail</div></a></td>");
                                                    //out.println("<td><a href='" + request.getContextPath() + "/HandleCenterDetail?action=Delete&id=" + centers.get(i).getId() + "&role="+ userInfo.getRole() +"'><div class='badge badge-outline-success'>Delete</div></a></td>");                                                    
                                                    out.println("</tr>");
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
</html>