<%-- 
    Document   : change-password
    Created on : 2022年4月20日, 上午12:36:56
    Author     : Melo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Change Password</title>
    </head>
    <jsp:include page="leftNavbar.jsp" />
    <jsp:include page="topNavbar.jsp" />
    <body>
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="page-header">
                    <h3 class="page-title"> Change Password </h3>
                    <!--              <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                      <li class="breadcrumb-item"><a href="#">Forms</a></li>
                                      <li class="breadcrumb-item active" aria-current="page">Form elements</li>
                                    </ol>
                                  </nav>-->
                </div>
                <div class="row">
                    <div class="col-md-6 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <!--<h4 class="card-title"><jsp:getProperty name="userInfo" property="id" /></h4>-->
                                <!--<p class="card-description"> A strong password helps to prevent unauthorised access to your account </p>-->
                                <form class="forms-sample" action='HandleChangePassword' method='post'>
                                        <input type="hidden" class="form-control" name="id" value='<jsp:getProperty name="userInfo" property="id" />'>
                                    <div class="form-group">
                                        <label for="current-password">Current Password</label>
                                        <input type="password" class="form-control" name="current-password" placeholder="Current Password">
                                    </div>
                                    <div class="form-group">
                                        <label for="new-password">New Password</label>
                                        <input type="password" class="form-control" name="new-password" placeholder="New Password">
                                    </div>
                                    <div class="form-group">
                                        <label for="confirm-new-password">Confirm New Password</label>
                                        <input type="password" class="form-control" name="confirm-new-password" placeholder="Confirm New Password">
                                    </div>
                                    <input type='submit' value="Submit" class="btn btn-primary mr-2">
                                    <input type='reset' value="Cancel" class="btn btn-dark">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->
            <!-- partial:../../partials/_footer.html -->
            <!-- main-panel ends -->
    </body>
    <jsp:include page="footer.jsp" />
</html>
