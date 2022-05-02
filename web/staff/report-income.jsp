<%-- 
    Document   : index.jsp
    Created on : 29-Nov-2019, 10:59:01
    Author     : lcshum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ict.bean.CenterBean"%>
<%@page import="ict.bean.ReportBean"%>
<jsp:useBean id="userInfo" scope="session" class="ict.bean.UserBean" />
<jsp:useBean id="trainerIncome" scope="request" class="java.util.ArrayList<ict.bean.ReportBean>" />
<jsp:useBean id="centerIncome" scope="request" class="java.util.ArrayList<ict.bean.ReportBean>" />

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Income Report</title>
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
                                <form action="HandleReport" method="post">
                                    <input type="hidden" name="action" value="genIncomeReport" />
                                    <h3 class="page-title"> Income Report </h3>
                                    <div class="col-md-6 mt-5">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Period Type</label>
                                            <div class="col-sm-4">
                                                <div class="form-check">
                                                    <label class="form-check-label">
                                                        <input type="radio" class="form-check-input" name="period" id="membershipRadios1" value="month" > Monthly <i class="input-helper"></i></label>
                                                </div>
                                            </div>
                                            <div class="col-sm-5">
                                                <div class="form-check">
                                                    <label class="form-check-label">
                                                        <input type="radio" class="form-check-input" name="period" id="membershipRadios2" value="year" > Yearly <i class="input-helper"></i></label>
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
                                <h3 class="page-title"> Income Generated By Trainer From 2022 </h3>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th> # </th>
                                                <th> Trainer </th>
                                                <th> Income </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                for(int i=0; i<trainerIncome.size(); i++){
                                                    ReportBean cbr = trainerIncome.get(i);
                                                    out.println("<tr>");
                                                    out.println("<td>"+(i+1)+"</td>");
                                                    out.println("<td>"+cbr.getTrainerName()+"</td>");
                                                    out.println("<td>"+cbr.getTrainerIncome()+"</td>");
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

                <div class="row">
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="page-title"> Income Generated By Center From 2022 </h3>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th> # </th>
                                                <th> Center </th>
                                                <th> Income </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                for(int i=0; i<centerIncome.size(); i++){
                                                    ReportBean cbr = centerIncome.get(i);
                                                    out.println("<tr>");
                                                    out.println("<td>"+(i+1)+"</td>");
                                                    out.println("<td>"+cbr.getCenterName()+"</td>");
                                                    out.println("<td>"+cbr.getCenterIncome()+"</td>");
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