<%-- 
    Document   : index.jsp
    Created on : 29-Nov-2019, 10:59:01
    Author     : lcshum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="userInfo" class="ict.bean.UserBean" scope="session" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Add Gym Center</title>
    </head>
    <jsp:include page="../leftNavbar.jsp" />
    <jsp:include page="../topNavbar.jsp" />
    <body>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="page-header">
                    <h3 class="page-title"> Add Gym Center </h3>
                    <!--<nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                          <li class="breadcrumb-item"><a href="#">Forms</a></li>
                          <li class="breadcrumb-item active" aria-current="page">Form elements</li>
                        </ol>
                      </nav>-->
                </div><div class="col-12 grid-margin">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Gym Center</h4>
                            <form class="form-sample" action="handleCenter" method="post">
                                <input type="hidden" name="action" class="form-control" value="add" />
                                <input type="hidden" name="role" class="form-control" value="<jsp:getProperty name="userInfo" property="role" />" />
                                <p class="card-description"> Center info </p>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Center Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="name" class="form-control" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Phone</label>
                                            <div class="col-sm-9">
                                                <input type="tel" maxlength="8" name="phone" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group ">
                                            <label for="address">Address</label>
                                            <textarea class="form-control" name="address" rows="4"></textarea>
                                        </div>
                                    </div>
<!--                                    <div class="col-md-6">
                                        <div class="form-group ">
                                            <label for="address">Address</label>
                                            <textarea class="form-control" name="address" rows="4"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group ">
                                            <label for="address">Price</label>
                                                <input type="number"  name="price" class="form-control" />
                                        </div>
                                    </div>-->
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="form-check form-check-success">
                                                <label class="form-check-label">
                                                    <input type="checkbox" class="form-check-input" name="active" checked=""> Active <i class="input-helper"></i></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 text-right mt-3">
                                        <input type='submit' value="Save" class="btn btn-primary mr-2">
                                        <input type='button' onclick="document.location = '${pageContext.request.contextPath}/index.jsp'" value="Cancal" class="btn btn-dark">
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
</html>