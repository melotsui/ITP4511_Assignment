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
                                                    <p class="text-muted"><jsp:getProperty name="user" property="price" /> </p>
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
            </div>
    </body>
    <jsp:include page="../footer.jsp" />
</html>
