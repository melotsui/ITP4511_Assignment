<%-- 
    Document   : index.jsp
    Created on : 29-Nov-2019, 10:59:01
    Author     : lcshum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ict.bean.CenterBookingBean"%>
<%@page import="ict.bean.TrainerBookingBean"%>
<jsp:useBean id="trainerBookingBean" scope="request" class="ict.bean.TrainerBookingBean" />
<jsp:useBean id="centerBookingBean" scope="request" class="ict.bean.CenterBookingBean" />
<jsp:useBean id="userInfo" scope="session" class="ict.bean.UserBean" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Booking Detail</title>
        <style>
            .form-control-plaintext[readonly] {
                color: white !important;
            }
        </style>
    </head>
    <jsp:include page="../leftNavbar.jsp" />
    <jsp:include page="../topNavbar.jsp" />
    <body>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <form class="form-sample">
                    <div class="row">
                        <div class="col-6">
                            <div class="page-header">
                                <h3 class="page-title ml-3"> Booking Detail </h3>
                            </div>

                        </div>
                        <%
                            if(!userInfo.getRole().equals("Customer")){
                                out.println("<div class='col-6'><div class='text-right mr-3'>");
                                out.println("<a href='HandleBooking?action=Approve&centerBooingID="+centerBookingBean.getId()+"&handledBy="+userInfo.getId()+"&trainerBookingID="+trainerBookingBean.getId()+"'>");
                                out.println("<button type='button' class='btn btn-outline-success btn-icon-text mr-3'>");
                                out.println("<i class='mdi mdi-check btn-icon-prepend'></i> Approve</button>");
                                out.println("</a>");
                                out.println("<a href='HandleBooking?action=Reject&centerBooingID="+centerBookingBean.getId()+"&handledBy="+userInfo.getId()+"&trainerBookingID="+trainerBookingBean.getId()+"'>");
                                out.println("<button type='button' class='btn btn-outline-danger btn-icon-text'>");
                                out.println("<i class='mdi mdi-close btn-icon-prepend'></i> Reject</button></div></div>");
                                out.println("</a>");
                            }
                        %>
                    </div>
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-description"> Booking info </p>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Booking ID</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control-plaintext" maxlength="64" value="<jsp:getProperty name="centerBookingBean" property="id" />" readonly />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Center</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control-plaintext" maxlength="64" value="<jsp:getProperty name="centerBookingBean" property="centerName" />" readonly />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Customer ID</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control-plaintext" maxlength="64" value="<jsp:getProperty name="centerBookingBean" property="customerID" />" readonly />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Booking Date Time</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control-plaintext" maxlength="64" value="<jsp:getProperty name="centerBookingBean" property="startDate" /> <jsp:getProperty name="centerBookingBean" property="startTime" />" readonly />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Center Price</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control-plaintext" maxlength="64" value="<jsp:getProperty name="centerBookingBean" property="price" />" readonly />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Create Date Time</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control-plaintext" maxlength="64" value="<jsp:getProperty name="centerBookingBean" property="createDateTime" />" readonly />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <hr/>
                                        <p class="card-description"> Booking Status </p>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Handled</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control-plaintext" maxlength="64" value="<jsp:getProperty name="centerBookingBean" property="isHandled" />" readonly />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Handler</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control-plaintext" maxlength="64" value="<jsp:getProperty name="centerBookingBean" property="handledBy" />" readonly />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Handled Date Time</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control-plaintext" maxlength="64" value="<jsp:getProperty name="centerBookingBean" property="handledDateTime" />" readonly />
                                            </div>
                                        </div>
                                    </div>
                                            
                                    <div class="col-md-4">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Approved</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control-plaintext" maxlength="64" value="<jsp:getProperty name="centerBookingBean" property="isApproved" />" readonly />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Cancelled</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control-plaintext" maxlength="64" value="<jsp:getProperty name="centerBookingBean" property="isCancelled" />" readonly />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <hr/>
                                        <p class="card-description"> Trainer </p>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Trainer</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control-plaintext" maxlength="64" value="<jsp:getProperty name="trainerBookingBean" property="trainerName" />" readonly />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Trainer Handled</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control-plaintext" maxlength="64" value="<jsp:getProperty name="trainerBookingBean" property="isHandled" />" readonly />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Trainer Approved Date Time</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control-plaintext" maxlength="64" value="<jsp:getProperty name="trainerBookingBean" property="approvedDateTime" />" readonly />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Trainer Price</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control-plaintext" maxlength="64" value="<jsp:getProperty name="trainerBookingBean" property="price" />" readonly />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Trainer Approved</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control-plaintext" maxlength="64" value="<jsp:getProperty name="trainerBookingBean" property="isApproved" />" readonly />
                                            </div>
                                        </div>
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
    <jsp:include page="../footer.jsp" />
    <script>
        $("#txtRole").change(function () {
            console.log("Test");
            if ($("#txtRole").val() == "Personal Trainer") {
                $("#areaPrice").show();
            } else {
                $("#areaPrice").hide();
            }
        });
    </script>
</html>