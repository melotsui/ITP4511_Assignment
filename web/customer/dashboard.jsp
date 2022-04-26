<%-- 
    Document   : index.jsp
    Created on : 29-Nov-2019, 10:59:01
    Author     : lcshum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                                                <th>
                                                    <div class="form-check form-check-muted m-0">
                                                        <label class="form-check-label">
                                                            <input type="checkbox" class="form-check-input">
                                                        </label>
                                                    </div>
                                                </th>
                                                <th> Personal Trainer Name </th>
                                                <th> Gender </th>
                                                <th> Email </th>
                                                <th> Phone </th>
                                                <th> Fee </th>
                                                <th>  </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="form-check form-check-muted m-0">
                                                        <label class="form-check-label">
                                                            <input type="checkbox" class="form-check-input">
                                                        </label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <img src="${pageContext.request.contextPath}/assets/images/faces/face1.jpg" alt="image" />
                                                    <span class="pl-2">Henry Klein</span>
                                                </td>
                                                <td> 02312 </td>
                                                <td> $14,500 </td>
                                                <td> Dashboard </td>
                                                <td> Credit card </td>
                                                <td>
                                                    <div class="badge badge-outline-success">Detail</div>
                                                </td>
                                            </tr>
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
                                                <th>
                                                    <div class="form-check form-check-muted m-0">
                                                        <label class="form-check-label">
                                                            <input type="checkbox" class="form-check-input">
                                                        </label>
                                                    </div>
                                                </th>
                                                <th> Gym Center Name </th>
                                                <th> Location </th>
                                                <th> Phone </th>
                                                <th> fee </th>
                                                <th>  </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="form-check form-check-muted m-0">
                                                        <label class="form-check-label">
                                                            <input type="checkbox" class="form-check-input">
                                                        </label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <img src="${pageContext.request.contextPath}/assets/images/faces/face1.jpg" alt="image" />
                                                    <span class="pl-2">Henry Klein</span>
                                                </td>
                                                <td> 02312 </td>
                                                <td> $14,500 </td>
                                                <td> Dashboard </td>
                                                <td>
                                                    <div class="badge badge-outline-success">Detail</div>
                                                </td>
                                            </tr>
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