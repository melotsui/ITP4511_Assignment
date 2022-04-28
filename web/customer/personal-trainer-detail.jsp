<%-- 
    Document   : personal-trainer
    Created on : 2022年4月21日, 下午6:04:23
    Author     : Melo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="ict.bean.UserBean" scope="request" />
<!DOCTYPE html>
<html>
    <head>
        <title>User Detail</title>
    </head>
    <jsp:include page="../leftNavbar.jsp" />
    <jsp:include page="../topNavbar.jsp" />
    <body>
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="page-header">
                    <h3 class="page-title"> User Detail</h3>
                    <!--              <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                      <li class="breadcrumb-item"><a href="#">Forms</a></li>
                                      <li class="breadcrumb-item active" aria-current="page">Form elements</li>
                                    </ol>
                                  </nav>-->
                </div>
                <div class="row">
                    <div class="col-md-6 col-xl-4 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Portfolio </h4>
                                <div class="owl-carousel owl-theme full-width owl-carousel-dash portfolio-carousel" id="owl-carousel-basic">
                                    <div class="item">
                                        <img src="data:image/jpg;base64,<jsp:getProperty name="user" property="image" />" alt="">
                                    </div>
                                </div>
                                <div class="d-flex py-4">
                                    <div class="preview-list w-100">
                                        <div class="preview-item p-0">
                                            <div class="preview-thumbnail">
                                                <img src="data:image/jpg;base64,<jsp:getProperty name="user" property="image" />" class="rounded-circle" alt="">
                                            </div>
                                            <div class="preview-item-content d-flex flex-grow">
                                                <div class="flex-grow">
                                                    <div class="d-flex d-md-block d-xl-flex justify-content-between">
                                                        <h6 class="preview-subject"><jsp:getProperty name="user" property="firstName" /> <jsp:getProperty name="user" property="lastName" /></h6>
                                                        <!--<p class="text-muted text-small">4 Hours Ago</p>-->
                                                    </div>
                                                    <p class="text-muted"><jsp:getProperty name="user" property="role" /> </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-row justify-content-between">
                                    <h4 class="card-title mb-1">Open Projects</h4>
                                    <p class="text-muted mb-1">Your data status</p>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="preview-list">
                                            <div class="preview-item border-bottom">
                                                <div class="preview-thumbnail">
                                                    <div class="preview-icon bg-primary">
                                                        <i class="mdi mdi-file-document"></i>
                                                    </div>
                                                </div>
                                                <div class="preview-item-content d-sm-flex flex-grow">
                                                    <div class="flex-grow">
                                                        <h6 class="preview-subject">Admin dashboard design</h6>
                                                        <p class="text-muted mb-0">Broadcast web app mockup</p>
                                                    </div>
                                                    <div class="mr-auto text-sm-right pt-2 pt-sm-0">
                                                        <p class="text-muted">15 minutes ago</p>
                                                        <p class="text-muted mb-0">30 tasks, 5 issues </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="preview-item border-bottom">
                                                <div class="preview-thumbnail">
                                                    <div class="preview-icon bg-success">
                                                        <i class="mdi mdi-cloud-download"></i>
                                                    </div>
                                                </div>
                                                <div class="preview-item-content d-sm-flex flex-grow">
                                                    <div class="flex-grow">
                                                        <h6 class="preview-subject">Wordpress Development</h6>
                                                        <p class="text-muted mb-0">Upload new design</p>
                                                    </div>
                                                    <div class="mr-auto text-sm-right pt-2 pt-sm-0">
                                                        <p class="text-muted">1 hour ago</p>
                                                        <p class="text-muted mb-0">23 tasks, 5 issues </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="preview-item border-bottom">
                                                <div class="preview-thumbnail">
                                                    <div class="preview-icon bg-info">
                                                        <i class="mdi mdi-clock"></i>
                                                    </div>
                                                </div>
                                                <div class="preview-item-content d-sm-flex flex-grow">
                                                    <div class="flex-grow">
                                                        <h6 class="preview-subject">Project meeting</h6>
                                                        <p class="text-muted mb-0">New project discussion</p>
                                                    </div>
                                                    <div class="mr-auto text-sm-right pt-2 pt-sm-0">
                                                        <p class="text-muted">35 minutes ago</p>
                                                        <p class="text-muted mb-0">15 tasks, 2 issues</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="preview-item border-bottom">
                                                <div class="preview-thumbnail">
                                                    <div class="preview-icon bg-danger">
                                                        <i class="mdi mdi-email-open"></i>
                                                    </div>
                                                </div>
                                                <div class="preview-item-content d-sm-flex flex-grow">
                                                    <div class="flex-grow">
                                                        <h6 class="preview-subject">Broadcast Mail</h6>
                                                        <p class="text-muted mb-0">Sent release details to team</p>
                                                    </div>
                                                    <div class="mr-auto text-sm-right pt-2 pt-sm-0">
                                                        <p class="text-muted">55 minutes ago</p>
                                                        <p class="text-muted mb-0">35 tasks, 7 issues </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="preview-item">
                                                <div class="preview-thumbnail">
                                                    <div class="preview-icon bg-warning">
                                                        <i class="mdi mdi-chart-pie"></i>
                                                    </div>
                                                </div>
                                                <div class="preview-item-content d-sm-flex flex-grow">
                                                    <div class="flex-grow">
                                                        <h6 class="preview-subject">UI Design</h6>
                                                        <p class="text-muted mb-0">New application planning</p>
                                                    </div>
                                                    <div class="mr-auto text-sm-right pt-2 pt-sm-0">
                                                        <p class="text-muted">50 minutes ago</p>
                                                        <p class="text-muted mb-0">27 tasks, 4 issues </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
    <jsp:include page="../footer.jsp" />
</html>
