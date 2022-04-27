<%-- 
    Document   : navbar
    Created on : 2022年4月19日, 下午6:22:40
    Author     : Melo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@ page errorPage="./error/handle-exception.jsp" %>--%>
<jsp:useBean id="userInfo" scope="session" class="ict.bean.UserBean" />
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- plugins:css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/css/vendor.bundle.base.css">
        <!-- endinject -->
        <!-- Plugin css for this page -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/jvectormap/jquery-jvectormap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/flag-icon-css/css/flag-icon.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/owl-carousel-2/owl.carousel.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/owl-carousel-2/owl.theme.default.min.css">
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <!-- endinject -->
        <!-- Layout styles -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <!-- End layout styles -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/shortcut-logo.png" />
    </head>
    <body>

        <%
            String url = request.getContextPath() + "/login.jsp";
            try {
                if (userInfo == null || userInfo.getRole()==null){
                    out.println("<script>window.location.href = \"" + url + "\";</script>");
//                    response.sendRedirect("./login.jsp");
                }
            } catch (Exception ex) {
                    out.println("<script>window.location.href = \"" + url + "\";</script>");
            }
        %>
        <div class="container-scroller">
            <!-- partial:partials/_sidebar.html -->
            <nav class="sidebar sidebar-offcanvas" id="sidebar">
                <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
                    <a class="sidebar-brand brand-logo" href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/assets/images/DGlogo.svg" alt="logo" /></a> 
                    <a class="sidebar-brand brand-logo-mini" href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/assets/images/DGlogo-mini.svg" alt="logo" /></a>
                </div>
                <ul class="nav">
                    <li class="nav-item profile">
                        <div class="profile-desc">
                            <div class="profile-pic">
                                <div class="count-indicator">
                                    <img class="img-xs rounded-circle " src="${pageContext.request.contextPath}/assets/images/faces/face15.jpg" alt="">
                                    <span class="count bg-success"></span>
                                </div>
                                <div class="profile-name">
                                    <h5 class="mb-0 font-weight-normal"><jsp:getProperty name="userInfo" property="firstName" /> <jsp:getProperty name="userInfo" property="lastName" /></h5>
                                    <span><jsp:getProperty name="userInfo" property="role" /></span>
                                </div>
                            </div>
                            <a href="#" id="profile-dropdown" data-toggle="dropdown"><i class="mdi mdi-dots-vertical"></i></a>
                            <div class="dropdown-menu dropdown-menu-right sidebar-dropdown preview-list" aria-labelledby="profile-dropdown">
<!--                                <a href="${pageContext.request.contextPath}/profile.jsp" class="dropdown-item preview-item">
                                    <div class="preview-thumbnail">
                                        <div class="preview-icon bg-dark rounded-circle">
                                            <i class="mdi mdi-settings text-primary"></i>
                                        </div>
                                    </div>
                                    <div class="preview-item-content">
                                        <p class="preview-subject ellipsis mb-1 text-small">Account settings</p>
                                    </div>
                                </a>-->
                                <div class="dropdown-divider"></div>
                                <a href="#" class="dropdown-item preview-item">
                                    <div class="preview-thumbnail">
                                        <div class="preview-icon bg-dark rounded-circle">
                                            <i class="mdi mdi-file-image text-success"></i>
                                        </div>
                                    </div>
                                    <div class="preview-item-content">
                                        <p class="preview-subject ellipsis mb-1 text-small">Change Icon</p>
                                    </div>
                                </a>
                                <div class="dropdown-divider"></div>
                                <a href="${pageContext.request.contextPath}/change-password.jsp" class="dropdown-item preview-item">
                                    <div class="preview-thumbnail">
                                        <div class="preview-icon bg-dark rounded-circle">
                                            <i class="mdi mdi-onepassword  text-info"></i>
                                        </div>
                                    </div>
                                    <div class="preview-item-content">
                                        <p class="preview-subject ellipsis mb-1 text-small">Change Password</p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item nav-category">
                        <span class="nav-link">Navigation</span>
                    </li>
                    <li class="nav-item menu-items">
                        <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">
                            <span class="menu-icon">
                                <i class="mdi mdi-speedometer"></i>
                            </span>
                            <span class="menu-title">Dashboard</span>
                        </a>
                    </li>
                    <% 
                        if(userInfo.getRole().equalsIgnoreCase("Staff")){
                            out.println("<li class='nav-item menu-items'>");
                            out.println("<a class='nav-link' data-toggle='collapse' href='#center' aria-expanded='false' aria-controls='center'>");
//                            out.println("<a class='nav-link' href='edit-gym-center.jsp'>");
                            out.println("<span class='menu-icon'><i class='mdi mdi-speedometer'></i></span>");
                            out.println("<span class='menu-title'>Gym Center</span>");
                            out.println("<i class='menu-arrow'></i>");
                            out.println("</a>");
                            out.println("<div class='collapse' id='center'>");
                            out.println("<ul class='nav flex-column sub-menu'>");
                            out.println("<li class='nav-item'> <a class='nav-link' href='handleCenter/getAll'> List Gym Center </a></li>");
                            out.println("<li class='nav-item'> <a class='nav-link' href='add-gym-center.jsp'> Add Gym Center </a></li>");
                            out.println("<li class='nav-item'> <a class='nav-link' href='edit-gym-center.jsp'> Edit Gym Center </a></li>");
                            out.println("</ul></div></li>");
                        }
                    %>
                    <% 
                        if(userInfo.getRole().equalsIgnoreCase("Staff")){
                            out.println("<li class='nav-item menu-items'>");
                            out.println("<a class='nav-link' data-toggle='collapse' href='#user' aria-expanded='false' aria-controls='user'>");
//                            out.println("<a class='nav-link' href='edit-gym-center.jsp'>");
                            out.println("<span class='menu-icon'><i class='mdi mdi-speedometer'></i></span>");
                            out.println("<span class='menu-title'>User</span>");
                            out.println("<i class='menu-arrow'></i>");
                            out.println("</a>");
                            out.println("<div class='collapse' id='user'>");
                            out.println("<ul class='nav flex-column sub-menu'>");
                            out.println("<li class='nav-item'> <a class='nav-link' href='handleAccount?action=list'> List User </a></li>");
                            out.println("<li class='nav-item'> <a class='nav-link' href='add-user.jsp'> Add User </a></li>");
                            out.println("<li class='nav-item'> <a class='nav-link' href='edit-user.jsp'> Edit User </a></li>");
                            out.println("</ul></div></li>");
                        }
                    %>
                    <% 
//                        if(userInfo.getRole().equalsIgnoreCase("Customer")){
//                            out.println("<li class='nav-item menu-items'>");
//                            out.println("<a class='nav-link' href='personal-trainer-detail.jsp'>");
//                            out.println("<span class='menu-icon'>");
//                            out.println("<i class='mdi mdi-speedometer'></i>");
//                            out.println("</span>");
//                            out.println("<span class='menu-title'>Personal Trainer Detail</span>");
//                            out.println("</a>");
//                            out.println("</li>");
//                        }
                    %>
                    <li class="nav-item menu-items">
                        <a class="nav-link" href="${pageContext.request.contextPath}/profile.jsp">
                            <span class="menu-icon">
                                <i class="mdi mdi-speedometer"></i>
                            </span>
                            <span class="menu-title">Profile</span>
                        </a>
                    </li>
                    <li class='nav-item menu-items'>
                        <a class='nav-link' data-toggle='collapse' href='#auth' aria-expanded='false' aria-controls='auth'>
                            <span class='menu-icon'>
                                <i class='mdi mdi-security'></i>
                            </span>
                            <span class='menu-title'>User Pages</span>
                            <i class='menu-arrow'></i>
                        </a>
                        <div class='collapse' id='auth'>
                            <ul class='nav flex-column sub-menu'>
                                <li class='nav-item'> <a class='nav-link' href='pages/samples/blank-page.html'> Blank Page </a></li>
                                <li class='nav-item'> <a class='nav-link' href='pages/samples/error-404.html'> 404 </a></li>
                                <li class='nav-item'> <a class='nav-link' href='pages/samples/error-500.html'> 500 </a></li>
                                <li class='nav-item'> <a class='nav-link' href='pages/samples/login.html'> Login </a></li>
                                <li class='nav-item'> <a class='nav-link' href='pages/samples/register.html'> Register </a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </nav>

    </body>
</html>
