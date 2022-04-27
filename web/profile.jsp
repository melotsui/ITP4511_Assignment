<%-- 
    Document   : profile
    Created on : 2022年4月20日, 上午12:52:55
    Author     : Melo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="userInfo" scope="session" class="ict.bean.UserBean" />
<!DOCTYPE html>
<html>
    <head>
        <title>Profile</title>
    </head>
    <jsp:include page="leftNavbar.jsp" />
    <jsp:include page="topNavbar.jsp" />
    <body>
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="page-header">
                    <h3 class="page-title"> Account Settings </h3>
                    <!--              <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                      <li class="breadcrumb-item"><a href="#">Forms</a></li>
                                      <li class="breadcrumb-item active" aria-current="page">Form elements</li>
                                    </ol>
                                  </nav>-->
                </div>
                <div class="col-12 grid-margin">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Profile</h4>
                            <form class="form-sample" action="HandleUserDetail" method="post">
                                <input type="hidden" class="form-control" name="action" value="edit-profile" />
                                <input type="hidden" class="form-control" name="id" value="<jsp:getProperty name="userInfo" property="id" />" />
                                <input type="hidden" class="form-control" name="role" value="<jsp:getProperty name="userInfo" property="role" />" />
                                <p class="card-description"> Personal info </p>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">First Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="firstName" value="<jsp:getProperty name="userInfo" property="firstName" />" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Last Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="lastName" value="<jsp:getProperty name="userInfo" property="lastName" />" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Gender</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="gender">
                                                    <%
                                                        if(userInfo.getGender().equals("Female")){
                                                            out.println("<option value='Male' >Male</option>");
                                                            out.println("<option value='Female' selected>Female</option>");
                                                        } else {
                                                            out.println("<option value='Male' selected>Male</option>");
                                                            out.println("<option value='Female'>Female</option>");
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Date of Birth</label>
                                            <div class="col-sm-9">
                                                <input class="form-control" name="birthday" value="<jsp:getProperty name="userInfo" property="birthday" />" placeholder="YYYY-MM-DD" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Address</label>
                                            <div class="col-sm-9">
                                                <textarea class="form-control" name="address" rows="3"><jsp:getProperty name="userInfo" property="address" /></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Phone</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="phone" value="<jsp:getProperty name="userInfo" property="phone" />" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Role</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" readonly value="<jsp:getProperty name="userInfo" property="role" />" style="background-color: #2A3038;"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <input type='submit' value="Submit" class="btn btn-primary mr-2">
                                <input type='button' onclick="document.location = '${pageContext.request.contextPath}/index.jsp'" value="Cancel" class="btn btn-dark">

                            </form>
                        </div>
                    </div>
                </div>
            </div>
    </body>
    <jsp:include page="footer.jsp" />
</html>
