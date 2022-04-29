<%-- 
    Document   : index.jsp
    Created on : 29-Nov-2019, 10:59:01
    Author     : lcshum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ict.bean.UserBean"%>
<%@page import="ict.bean.CenterBean"%>
<jsp:useBean id="userInfo" scope="session" class="ict.bean.UserBean" />
<jsp:useBean id="centersWithPrice" scope="request" class="java.util.ArrayList<ict.bean.CenterBean>" />
<jsp:useBean id="trainersWithPrice" scope="request" class="java.util.ArrayList<ict.bean.UserBean>" />

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Dashboard</title>
        <style>
            .ui-datepicker-calendar {
                display: none;
            }
            .ui-datepicker-month {
                display: none;
            }
            .ui-datepicker-next,.ui-datepicker-prev {
                display:none;
            }
            select.form-control{
                color: #ffffff !important;
            }
        </style>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css">


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
                                <form>
                                    <h3 class="page-title"> Booking Report </h3>
                                    <div class="row">
                                        <div class="col-md-6 trainerSelect">
                                            <div class="form-group row m-2">
                                                <label class="col-form-label">Trainer</label>
                                                <select class="form-control">
                                                    <option></option>
                                                    <%
                                                            for(int i=0; i<trainersWithPrice.size(); i++){
                                                                out.println("<option value='"+trainersWithPrice.get(i).getId()+"'>"+trainersWithPrice.get(i).getFirstName()+" "+trainersWithPrice.get(i).getLastName()+"</option>");
                                                            }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row m-2">
                                                <label class="col-form-label">Center</label>
                                                <select class="form-control">
                                                    <option></option>
                                                    <%
                                                            for(int i=0; i<centersWithPrice.size(); i++){
                                                                out.println("<option value='"+centersWithPrice.get(i).getId()+"'>"+centersWithPrice.get(i).getName()+"</option>");
                                                            }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mt-5">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Period Type</label>
                                            <div class="col-sm-4">
                                                <div class="form-check">
                                                    <label class="form-check-label">
                                                        <input type="radio" class="form-check-input" name="period" id="membershipRadios1" value="month" checked=""> Monthly <i class="input-helper"></i></label>
                                                </div>
                                            </div>
                                            <div class="col-sm-5">
                                                <div class="form-check">
                                                    <label class="form-check-label">
                                                        <input type="radio" class="form-check-input" name="period" id="membershipRadios2" value="year"> Yearly <i class="input-helper"></i></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="text" class="form-control" placeholder="Year" id="dpYear" style="display: none" />
                                    <input type="month" class="form-control" id="dpMonth" placeholder="Month" style="display: none">

                                    <button type="submit" class="btn btn-primary my-2">Submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="page-title"> Trainer Booking Rate From 2022 </h3>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th> # </th>
                                                <th> Trainer </th>
                                                <th> Booking Rate </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Ken Wong</td>
                                                <td>1882/3650(51.5%)</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="page-title"> Center Booking Rate From 2022 </h3>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th> # </th>
                                                <th> Center </th>
                                                <th> Booking Rate </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>LWL</td>
                                                <td>1882/3650(51.5%)</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="page-title"> Booking Record From 2022 </h3>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th> # </th>
                                                <th> Customer ID </th>
                                                <th> Center </th>
                                                <th> Booking Date Time </th>
                                                <th> Price </th>
                                            </tr>
                                        </thead>
                                        <tbody>
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
    <script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $('#datepicker').datepicker({
                changeYear: true,
                showButtonPanel: true,
                dateFormat: 'yy',
                onClose: function (dateText, inst) {
                    var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                    $(this).datepicker('setDate', new Date(year, 1));
                }
            });
            $(".date-picker-year").focus(function () {
                $(".ui-datepicker-month").hide();
            });
        });

        $('input[type=radio][name=period]').change(function () {
            $("#dpYear").hide();
            $("#dpMonth").hide();
            if (this.value == 'month') {
                $("#dpMonth").show();
            } else if (this.value == 'year') {
                $("#dpYear").show();
            }
        });
    </script>
</html>