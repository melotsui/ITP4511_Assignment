<%-- 
    Document   : index.jsp
    Created on : 29-Nov-2019, 10:59:01
    Author     : lcshum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="center" class="ict.bean.CenterBean" scope="request" />
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
                    <h3 class="page-title"> Edit Gym Center </h3>
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
                                <input type="hidden" name="action" class="form-control" value="edit" />
                                <input type="hidden" name="id" class="form-control" value="<jsp:getProperty name="center" property="id" />" />
                                <p class="card-description"> Center info </p>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Center Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="name" value="<jsp:getProperty name="center" property="name" />" class="form-control" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Phone</label>
                                            <div class="col-sm-9">
                                                <input type="tel" maxlength="8" name="phone" value="<jsp:getProperty name="center" property="phone" />" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group ">
                                            <label for="address">Address</label>
                                            <textarea class="form-control" name="address" rows="4"><jsp:getProperty name="center" property="address" /></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="form-check form-check-success">
                                                <label class="form-check-label">
                                                    <%
                                                        if(center.getIsActive()){
                                                            out.println("<input type='checkbox' name='active' class='form-check-input' checked=''> Active <i class='input-helper'></i></label>");
                                                        } else {
                                                            out.println("<input type='checkbox' name='active' class='form-check-input' > Active <i class='input-helper'></i></label>");
                                                        }
                                                    %>
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