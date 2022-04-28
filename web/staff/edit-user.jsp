<%-- 
    Document   : index.jsp
    Created on : 29-Nov-2019, 10:59:01
    Author     : lcshum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ict.bean.UserPriceBean"%>
<%@page import="ict.bean.UserBean"%>
<jsp:useBean id="user" class="ict.bean.UserBean" scope="request" />
<jsp:useBean id="userPrice" class="java.util.ArrayList<ict.bean.UserPriceBean>" scope="request" />

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Edit Personal Trainer</title>
    </head>
    <jsp:include page="../leftNavbar.jsp" />
    <jsp:include page="../topNavbar.jsp" />
    <body>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="page-header">
                    <h3 class="page-title"> Edit User </h3>
                    <!--                                  
                      <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                          <li class="breadcrumb-item"><a href="#">Forms</a></li>
                          <li class="breadcrumb-item active" aria-current="page">Form elements</li>
                        </ol>
                      </nav>
                    -->
                </div><div class="col-12 grid-margin">
                    <div class="card">
                        <div class="card-body">
                            <form class="form-sample" enctype="multipart/form-data" action="handleAccount" method="post">
                                <p class="card-description"> Personal info </p>
                                <input type="hidden" class="form-control"  name="id" value="<jsp:getProperty name="user" property="id" />" />
                                <input type="hidden" name="action" class="form-control" value="edit" />
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">First Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" maxlength="64"  name="firstName" value="<jsp:getProperty name="user" property="firstName" />"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Last Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" maxlength="64"  name="lastName" value="<jsp:getProperty name="user" property="lastName" />"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Phone</label>
                                            <div class="col-sm-9">
                                                <input type="number" class="form-control" maxlength="8"  name="phone" value="<jsp:getProperty name="user" property="phone" />"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Birthday</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" placeholder="YYYY/MM/DD" name="birthday" value="<jsp:getProperty name="user" property="birthday" />"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Email</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control"  name="email" value="<jsp:getProperty name="user" property="email" />"/>
                                            </div>
                                        </div>
                                        <!--                                        <div class="form-group row">
                                                                                    <label class="col-sm-3 col-form-label">Center</label>
                                                                                    <div class="col-sm-9">
                                                                                        <select class="form-control" name="centerID">
                                                                                            <option value="">Tuen Mun Center</option>
                                                                                            <option>Sha Tin Center</option>
                                                                                            <option>Tsing Yi Center</option>
                                                                                            <option>Lee Wai Lee Center</option>
                                                                                            <option>Chai Wan Center</option>
                                                                                        </select>
                                                                                    </div>
                                                                                </div>-->
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Role</label>
                                            <div class="col-sm-9">
                                                <select id="txtRole" class="form-control" name="role">
                                                    <%
                                                        if(user.getRole().equalsIgnoreCase("Customer")){
                                                            out.println("<option value='Customer' selected>Customer</option>");
                                                            out.println("<option value='Staff'>Staff</option>");
                                                            out.println("<option value='Personal Trainer'>Personal Trainer</option>");
                                                        } else if(user.getRole().equalsIgnoreCase("Staff")){
                                                            out.println("<option value='Customer' >Customer</option>");
                                                            out.println("<option value='Staff' selected>Staff</option>");
                                                            out.println("<option value='Personal Trainer'>Personal Trainer</option>");
                                                        } else {
                                                            out.println("<option value='Customer' >Customer</option>");
                                                            out.println("<option value='Staff' >Staff</option>");
                                                            out.println("<option value='Personal Trainer' selected>Personal Trainer</option>");
                                                        }
                                                    %>


                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Gender</label>
                                            <div class="col-sm-4">
                                                <div class="form-check">
                                                    <label class="form-check-label">
                                                        <%
                                                            if(user.getGender().equals("Male")){
                                                                out.println("<input type='radio' class='form-check-input' name='gender' id='membershipRadios1' value='Male' checked> Male </label>");
                                                            } else {
                                                                out.println("<input type='radio' class='form-check-input' name='gender' id='membershipRadios1' value='Male' > Male </label>");
                                                            }
                                                        %>

                                                </div>
                                            </div>
                                            <div class="col-sm-5">
                                                <div class="form-check">
                                                    <label class="form-check-label">

                                                        <%
                                                            if(user.getGender().equals("Female")){
                                                                out.println("<input type='radio' class='form-check-input' name='gender' id='membershipRadios1' value='Female' checked> Female </label>");
                                                            } else {
                                                                out.println("<input type='radio' class='form-check-input' name='gender' id='membershipRadios1' value='Female' > Female </label>");
                                                            }
                                                        %>                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group ">
                                            <label for="address">Address</label>
                                            <textarea class="form-control" name="address" rows="4"><jsp:getProperty name="user" property="address" /></textarea>
                                        </div>
                                    </div>
                                </div>
                                <%
                                    if(!userPrice.get(0).getYear().equals("null")){
                                    out.println("<div class='row'><div class='col-12'><h4 class='card-title'>Price per Years</h4><div class='table-responsive'>");
                                    out.println("<table class='w-50' id='tableGym'><thead><tr><th><h4 class='card-title'>Year</h4>");
                                    out.println("</th><th><h4 class='card-title ml-3'>Price</h4></th></tr></thead><tbody>");
                                    for(int i=0; i<userPrice.size(); i++){
                                        out.println("<tr><td><input class='form-control' type='number' min='1900' max='2099' step='1' value='" + userPrice.get(i).getYear() + "' readonly /></td>");
                                        out.println("<td class='ml-3'><input type='number' step='0.01' name='price' class='form-control ml-3' value='" + userPrice.get(i).getPrice() + "' /></td></tr>");
                                    }
                                    out.println("</tbody></table></div></div></div>");
                                    }
                                %>    


                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="form-check form-check-success">
                                                <label class="form-check-label">
                                                    <%
                                                        if(user.isIsActive()){
                                                            out.println("<input type='checkbox' name='active' class='form-check-input' checked=''> Active <i class='input-helper'></i></label>");
                                                        } else {
                                                            out.println("<input type='checkbox' name='active' class='form-check-input' > Active <i class='input-helper'></i></label>");
                                                        }
                                                    %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-right mt-3">
                                        <input type='submit' value="Save" class="btn btn-primary mr-2">
                                        <input type='reset' value="Clear" class="btn btn-dark">
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->
            <!-- partial:partials/_footer.html -->
            <!-- main-panel ends -->
    </body>
    <style>
        .form-control[readonly] {
            background-color: #2A3038 !important;
        }
        select.form-control{
            color: #ffffff !important;
        }
    </style>
    <jsp:include page="../footer.jsp" />
</html>