<%-- 
    Document   : index.jsp
    Created on : 29-Nov-2019, 10:59:01
    Author     : lcshum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ict.bean.UserBean"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="trainers" scope="session" class="java.util.ArrayList<ict.bean.UserBean>" />
<jsp:useBean id="userInfo" scope="session" class="ict.bean.UserBean" />
<%!

    public Connection getConnection() throws SQLException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return (Connection) DriverManager.getConnection("jdbc:mysql://chunon.me:3306/esd", "esd", "qY6-@f67rp");
    }

    public String getResult(String mySQL) {
        java.sql.Connection cnnct = null;
        PreparedStatement preQueryStatement = null;
        ResultSet rs = null;
        boolean isValid = false;
        try {
            cnnct = getConnection();

            String sql = mySQL;
            preQueryStatement = cnnct.prepareStatement(sql);

            preQueryStatement.execute();
            rs = preQueryStatement.getResultSet();

            if (rs.next()) {
                return rs.getString(1);
            }

        } catch (SQLException e) {
            while (e != null) {
                e.printStackTrace();
                e = e.getNextException();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "Unable to get records";
    }
%>
<% 

    out.print(getResult("SELECT COUNT(*) FROM esd.user WHERE DATE(createDateTime) = CURDATE()"));
%>

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
                <div class="row">
                    <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-9">
                                        <div class="d-flex align-items-center align-self-start">
                                            <h3 class="mb-0"><% out.print(getResult("SELECT COUNT(*) FROM esd.centerBooking WHERE DATE(createDateTime) = CURDATE()"));%></h3>

                                        </div>
                                    </div>
                                </div>
                                <h6 class="text-muted font-weight-normal">Daily Booking</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-9">
                                        <div class="d-flex align-items-center align-self-start">
                                            <h3 class="mb-0"><% out.print(getResult("SELECT COUNT(*) FROM esd.user WHERE DATE(createDateTime) = CURDATE()"));%></h3>
                                        </div>
                                    </div>
                                </div>
                                <h6 class="text-muted font-weight-normal">New User</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-9">
                                        <div class="d-flex align-items-center align-self-start">
                                            <h3 class="mb-0">$<% out.print(getResult("SELECT coalesce(SUM(coalesce(centerBooking.price, 0)) + SUM(coalesce(trainerBooking.price, 0)), 0) FROM centerBooking LEFT JOIN trainerBooking ON centerBooking.trainerBookingID = trainerBooking.id WHERE DATE(centerBooking.createDateTime) = CURDATE();"));%></h3>
                                        </div>
                                    </div>
                                </div>
                                <h6 class="text-muted font-weight-normal">Daily Income</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-9">
                                        <div class="d-flex align-items-center align-self-start">
                                            <h3 class="mb-0"><% out.print(getResult("SELECT COUNT(*) FROM `centerBooking` WHERE isHandled = 0"));%></h3>
                                        </div>
                                    </div>
                                </div>
                                <h6 class="text-muted font-weight-normal">Booking Unhandled</h6>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    
                    <div class="col-lg-6 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                <h4 class="card-title">Sale Chart</h4>
                                <canvas id="areaSaleChart" style="height: 310px; display: block; width: 620px;" width="620" height="310" class="chartjs-render-monitor"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                <h4 class="card-title">Booking Chart</h4>
                                <canvas id="areaBookingChart" style="height: 310px; display: block; width: 620px;" width="620" height="310" class="chartjs-render-monitor"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                <h4 class="card-title">Customer Chart</h4>
                                <canvas id="areaCustomerChart" style="height: 310px; display: block; width: 620px;" width="620" height="310" class="chartjs-render-monitor"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">User Distribution Chart</h4>
                                <canvas id="PositionChart" style="height:250px"></canvas>
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

    <script>
        var areaSaleData = {
            labels: ["<% out.print(getResult("SELECT (CURDATE() + INTERVAL -4 DAY)"));%>", "<% out.print(getResult("SELECT (CURDATE() + INTERVAL -3 DAY)"));%>", "<% out.print(getResult("SELECT (CURDATE() + INTERVAL -2 DAY)"));%>", "<% out.print(getResult("SELECT (CURDATE() + INTERVAL -1 DAY)"));%>", "<% out.print(getResult("SELECT (CURDATE() + INTERVAL +0 DAY)"));%>"],
            datasets: [{
                    label: 'Income',
                    data: [<% out.print(getResult("SELECT coalesce(SUM(coalesce(centerBooking.price, 0)) + SUM(coalesce(trainerBooking.price, 0)),0) FROM centerBooking LEFT JOIN trainerBooking ON centerBooking.trainerBookingID = trainerBooking.id WHERE DATE(centerBooking.createDateTime) = (CURDATE() + INTERVAL -4 DAY)"));%>,
                        <% out.print(getResult("SELECT coalesce(SUM(coalesce(centerBooking.price, 0)) + SUM(coalesce(trainerBooking.price, 0)),0) FROM centerBooking LEFT JOIN trainerBooking ON centerBooking.trainerBookingID = trainerBooking.id WHERE DATE(centerBooking.createDateTime) = (CURDATE() + INTERVAL -3 DAY)"));%>,
                        <% out.print(getResult("SELECT coalesce(SUM(coalesce(centerBooking.price, 0)) + SUM(coalesce(trainerBooking.price, 0)),0) FROM centerBooking LEFT JOIN trainerBooking ON centerBooking.trainerBookingID = trainerBooking.id WHERE DATE(centerBooking.createDateTime) = (CURDATE() + INTERVAL -2 DAY)"));%>,
                        <% out.print(getResult("SELECT coalesce(SUM(coalesce(centerBooking.price, 0)) + SUM(coalesce(trainerBooking.price, 0)),0) FROM centerBooking LEFT JOIN trainerBooking ON centerBooking.trainerBookingID = trainerBooking.id WHERE DATE(centerBooking.createDateTime) = (CURDATE() + INTERVAL -1 DAY)"));%>,
                        <% out.print(getResult("SELECT coalesce(SUM(coalesce(centerBooking.price, 0)) + SUM(coalesce(trainerBooking.price, 0)),0) FROM centerBooking LEFT JOIN trainerBooking ON centerBooking.trainerBookingID = trainerBooking.id WHERE DATE(centerBooking.createDateTime) = (CURDATE() + INTERVAL +0 DAY)"));%>
                                ],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1,
                    fill: true, // 3: no fill
                }]
        };
        
        
        var areaBookingData = {
            labels: ["<% out.print(getResult("SELECT (CURDATE() + INTERVAL -4 DAY)"));%>", "<% out.print(getResult("SELECT (CURDATE() + INTERVAL -3 DAY)"));%>", "<% out.print(getResult("SELECT (CURDATE() + INTERVAL -2 DAY)"));%>", "<% out.print(getResult("SELECT (CURDATE() + INTERVAL -1 DAY)"));%>", "<% out.print(getResult("SELECT (CURDATE() + INTERVAL +0 DAY)"));%>"],
            datasets: [{
                    label: 'Booking',
                    data: [<% out.print(getResult("SELECT COUNT(*) FROM centerBooking WHERE DATE(createDateTime) = CURDATE() + INTERVAL -4 DAY"));%>,
                        <% out.print(getResult("SELECT COUNT(*) FROM centerBooking WHERE DATE(createDateTime) = CURDATE() + INTERVAL -3 DAY"));%>,
                        <% out.print(getResult("SELECT COUNT(*) FROM centerBooking WHERE DATE(createDateTime) = CURDATE() + INTERVAL -2 DAY"));%>,
                        <% out.print(getResult("SELECT COUNT(*) FROM centerBooking WHERE DATE(createDateTime) = CURDATE() + INTERVAL -1 DAY"));%>,
                        <% out.print(getResult("SELECT COUNT(*) FROM centerBooking WHERE DATE(createDateTime) = CURDATE()"));%>
                                ],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1,
                    fill: true, // 3: no fill
                }]
        };        
        var areaCustomerData = {
            labels: ["<% out.print(getResult("SELECT (CURDATE() + INTERVAL -4 DAY)"));%>", "<% out.print(getResult("SELECT (CURDATE() + INTERVAL -3 DAY)"));%>", "<% out.print(getResult("SELECT (CURDATE() + INTERVAL -2 DAY)"));%>", "<% out.print(getResult("SELECT (CURDATE() + INTERVAL -1 DAY)"));%>", "<% out.print(getResult("SELECT (CURDATE() + INTERVAL +0 DAY)"));%>"],
            datasets: [{
                    label: 'Customer',
                    data: [<% out.print(getResult("SELECT COUNT(*) FROM user WHERE role = 'Customer' AND DATE(createDateTime) = CURDATE() + INTERVAL -4 DAY"));%>,
                        <% out.print(getResult("SELECT COUNT(*) FROM user WHERE role = 'Customer' AND DATE(createDateTime) = CURDATE() + INTERVAL -3 DAY"));%>,
                        <% out.print(getResult("SELECT COUNT(*) FROM user WHERE role = 'Customer' AND DATE(createDateTime) = CURDATE() + INTERVAL -2 DAY"));%>,
                        <% out.print(getResult("SELECT COUNT(*) FROM user WHERE role = 'Customer' AND DATE(createDateTime) = CURDATE() + INTERVAL -1 DAY"));%>,
                        <% out.print(getResult("SELECT COUNT(*) FROM user WHERE role = 'Customer' AND DATE(createDateTime) = CURDATE()"));%>
                                ],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1,
                    fill: true, // 3: no fill
                }]
        };


        var doughnutPieData = {
            datasets: [{
                    data: [<% out.print(getResult("SELECT COUNT(*) FROM user WHERE role = 'Customer'"));%>, <% out.print(getResult("SELECT COUNT(*) FROM user WHERE role = 'Staff'"));%>, <% out.print(getResult("SELECT COUNT(*) FROM user WHERE role = 'Personal Trainer'"));%>],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.5)',
                        'rgba(54, 162, 235, 0.5)',
                        'rgba(255, 206, 86, 0.5)',
                        'rgba(75, 192, 192, 0.5)',
                        'rgba(153, 102, 255, 0.5)',
                        'rgba(255, 159, 64, 0.5)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                }],

            // These labels appear in the legend and in the tooltips when hovering different arcs
            labels: [
                'Customer',
                'Staff',
                'Trainer',
            ]
        };
        var doughnutPieOptions = {
            responsive: true,
            animation: {
                animateScale: true,
                animateRotate: true
            }
        };

        var areaOptions = {
            plugins: {
                filler: {
                    propagate: true
                }
            },
            scales: {
                yAxes: [{
                        gridLines: {
                            color: "rgba(204, 204, 204,0.1)"
                        }
                    }],
                xAxes: [{
                        gridLines: {
                            color: "rgba(204, 204, 204,0.1)"
                        }
                    }]
            }
        }
        
        if ($("#areaSaleChart").length) {
            var areaChartCanvas = $("#areaSaleChart").get(0).getContext("2d");
            var areaChart = new Chart(areaChartCanvas, {
                type: 'line',
                data: areaSaleData,
                options: areaOptions
            });
        }
        
        if ($("#areaBookingChart").length) {
            var areaChartCanvas = $("#areaBookingChart").get(0).getContext("2d");
            var areaChart = new Chart(areaChartCanvas, {
                type: 'line',
                data: areaBookingData,
                options: areaOptions
            });
        }
        
        if ($("#areaCustomerChart").length) {
            var areaChartCanvas = $("#areaCustomerChart").get(0).getContext("2d");
            var areaChart = new Chart(areaChartCanvas, {
                type: 'line',
                data: areaCustomerData,
                options: areaOptions
            });
        }
        
        if ($("#PositionChart").length) {
            var pieChartCanvas = $("#PositionChart").get(0).getContext("2d");
            var pieChart = new Chart(pieChartCanvas, {
                type: 'pie',
                data: doughnutPieData,
                options: doughnutPieOptions
            });
        }

    </script>
</html>