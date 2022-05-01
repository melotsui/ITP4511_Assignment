<%-- 
    Document   : index.jsp
    Created on : 29-Nov-2019, 10:59:01
    Author     : lcshum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ict.bean.CenterBean"%>
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
                <div class="row">
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="page-title"> Gym Center List </h3>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th> # </th>
                                                <th> Gym Center Name </th>
                                                <th> Location </th>
                                                <th> Phone </th>
                                                <th> Price </th>
                                                <th> Active </th>
                                                <th>  </th>
                                                <th>  </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                ArrayList<CenterBean> centers = (ArrayList<CenterBean>) request.getAttribute("centers");
                                                for(int i=0; i< centers.size(); i++){
            //                                                    out.println(centers.get(i).getAddress());
                                                    out.println("<tr>");
                                                    out.println("<td> " + (i+1) + " </td>");
                                                    out.println("<td><span class='pl-2'>" + centers.get(i).getName() + "</span></td>");
                                                    out.println("<td>" + centers.get(i).getAddress() + "</td>");
                                                    out.println("<td>" + centers.get(i).getPhone() + "</td>");
                                                    out.println("<td>$" + centers.get(i).getPrice() + "/h</td>");
                                                    out.println("<td>" + centers.get(i).getIsActive() + "</td>");
                                                    out.println("<td><a class='mr-2' href='" + request.getContextPath() + "/HandleCenterDetail?action=Inquire&id=" + centers.get(i).getId() + "'><i class='mdi mdi-eye mdi-18px text-warning'></i></a>");
                                                    if(!userInfo.getRole().equals("Customer")){
                                                        out.println("<a class='mr-2' href='" + request.getContextPath() + "/staff/handleCenter?action=edit&id=" + centers.get(i).getId() + "&role="+ userInfo.getRole() +"'><i class='mdi mdi-pen mdi-18px'></i></a>");
                                                        out.println("<a class='mr-2' href='" + request.getContextPath() + "/staff/handleCenter?action=delete&id=" + centers.get(i).getId() + "&role="+ userInfo.getRole() +"'><i class='mdi mdi-delete mdi-18px text-danger'></i></a></td>");
                                                    }
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
    </body>
    <jsp:include page="../footer.jsp" />
</html>