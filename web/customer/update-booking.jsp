<%-- 
    Document   : index.jsp
    Created on : 29-Nov-2019, 10:59:01
    Author     : hhch0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ict.bean.UserBean"%>
<jsp:useBean id="userInfo" scope="session" class="ict.bean.UserBean" />
<!DOCTYPE html>
<%
    String urlBase = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<html lang="en">
    <head>
        <title>Dashboard</title>
        <style>
            select.form-control{
                color: #ffffff !important;
            }
        </style>
    </head>
    <jsp:include page="../leftNavbar.jsp" />
    <jsp:include page="../topNavbar.jsp" />
    <body>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="page-header">
                    <h3 class="page-title"> Update Booking </h3>
                </div>

                <form class="form-sample" action="" method="post">
                    <div class="row ">
                        <div class="col-12 grid-margin">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Update Booking</h4>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="col-form-label">Center</label>
                                                    <select class="form-control">
                                                        <option>Tuen Mun Center</option>
                                                        <option>Sha Tin Center</option>
                                                        <option>Tsing Yi Center</option>
                                                        <option>Lee Wai Lee Center</option>
                                                        <option>Chai Wan Center</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6"></div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-form-label">Booking Date</label>
                                                    <input type="date" class="form-control mr-3" placeholder="dd/mm/yyyy" id="txtDate" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <label class="col-form-label">Booking Time</label>
                                                    <select class="form-control">
                                                        <option>11:00 - 12:00</option>
                                                        <option>12:00 - 13:00</option>
                                                        <option>13:00 - 14:00</option>
                                                        <option>14:00 - 15:00</option>
                                                        <option>15:00 - 16:00</option>
                                                        <option>16:00 - 17:00</option>
                                                        <option>17:00 - 18:00</option>
                                                        <option>18:00 - 19:00</option>
                                                        <option>19:00 - 20:00</option>
                                                        <option>20:00 - 21:00</option>
                                                        <option>21:00 - 22:00</option>
                                                        <option>22:00 - 23:00</option>

                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-4"></div>

                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <div class="form-check form-check-success">
                                                        <label class="form-check-label">
                                                            <input type="checkbox" class="form-check-input cbTrainer"> Trainer <i class="input-helper"></i></label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mt-2 trainerSelect" style="display: none">
                                                <div class="form-group row">
                                                    <select class="form-control">
                                                        <option></option>
                                                        <option>Melo Tsui ($200/hr)</option>
                                                        <option>Ken Wong</option>
                                                        <option>Ivan Leung</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                            </div>
                                            <div class="col-md-6 text-right mt-3">
                                                <input type='submit' value="Save" class="btn btn-primary mr-2">
                                                <input type='button' onclick="document.location = '${pageContext.request.contextPath}/index.jsp'" value="Cancal" class="btn btn-dark">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



            </div>
            <!-- content-wrapper ends -->
            <!-- partial:partials/_footer.html -->
            <!-- main-panel ends -->
        </form>
</body>
<jsp:include page="../footer.jsp" />
<script>
    $(function () {
        var dtMin = new Date();
        var dtMax = new Date();
        dtMax.setDate(dtMin.getDate() + 14);
        var monthMax = dtMax.getMonth() + 1;
        var dayMax = dtMax.getDate();
        var yearMax = dtMax.getFullYear();

        var monthMin = dtMin.getMonth() + 1;
        var dayMin = dtMin.getDate();
        var yearMin = dtMin.getFullYear();

        if (monthMax < 10)
            monthMax = '0' + monthMax.toString();
        if (dayMax < 10)
            dayMax = '0' + dayMax.toString();

        if (monthMin < 10)
            monthMin = '0' + monthMin.toString();
        if (dayMin < 10)
            dayMin = '0' + dayMin.toString();

        var minDate = yearMin + '-' + monthMin + '-' + dayMin;
        var maxDate = yearMax + '-' + monthMax + '-' + dayMax;
        $('#txtDate').attr('min', minDate);
        $('#txtDate').attr('max', maxDate);
    });


    $(document).on("click", ".cbTrainer", function () {
        if ($(this).is(":checked")) {
            $(this).parents().find(".trainerSelect").show();
        } else {
            $(this).parents().find(".trainerSelect").hide();
        }
    });





</script>
</html>