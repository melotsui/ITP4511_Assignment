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
                <div class="row">
                    <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-9">
                                        <div class="d-flex align-items-center align-self-start">
                                            <h3 class="mb-0">12</h3>

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
                                            <h3 class="mb-0">5</h3>
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
                                            <h3 class="mb-0">$12.34</h3>
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
                                            <h3 class="mb-0">1</h3>
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
                                <h4 class="card-title">Position Distribution Chart</h4>
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
            labels: ["24/4/2022", "25/4/2022", "26/4/2022", "27/4/2022", "28/4/2022"],
            datasets: [{
                    label: 'Income',
                    data: [1200, 3800, 310, 550, 270, 350],
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
            labels: ["24/4/2022", "25/4/2022", "26/4/2022", "27/4/2022", "28/4/2022"],
            datasets: [{
                    label: 'Booking',
                    data: [120, 191, 34, 58, 25, 37],
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
            labels: ["24/4/2022", "25/4/2022", "26/4/2022", "27/4/2022", "28/4/2022"],
            datasets: [{
                    label: 'Customer',
                    data: [1, 9, 0, 5, 0, 3],
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
                    data: [30, 40, 30],
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