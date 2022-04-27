<%-- 
    Document   : index.jsp
    Created on : 29-Nov-2019, 10:59:01
    Author     : lcshum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Edit User</title>
    </head>
    <jsp:include page="../leftNavbar.jsp" />
    <jsp:include page="../topNavbar.jsp" />
    <body>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="page-header">
                    <h3 class="page-title"> Add User </h3>
                    <!--                                  
                      <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                          <li class="breadcrumb-item"><a href="#">Forms</a></li>
                          <li class="breadcrumb-item active" aria-current="page">Form elements</li>
                        </ol>
                      </nav>
                    -->
                </div><div class="col-12 grid-margin">
                    <div class="card">
                        <div class="card-body">
                            <form class="form-sample">
                                <p class="card-description"> Personal info </p>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">First Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" maxlength="64" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Last Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" maxlength="64" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Phone</label>
                                            <div class="col-sm-9">
                                                <input type="number" class="form-control" maxlength="8" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Birthday</label>
                                            <div class="col-sm-9">
                                                <input type="date" class="form-control" placeholder="dd/mm/yyyy" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Center</label>
                                            <div class="col-sm-9">
                                                <select class="form-control">
                                                    <option>Tuen Mun Center</option>
                                                    <option>Sha Tin Center</option>
                                                    <option>Tsing Yi Center</option>
                                                    <option>Lee Wai Lee Center</option>
                                                    <option>Chai Wan Center</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Role</label>
                                            <div class="col-sm-9">
                                                <select class="form-control">
                                                    <option>Customer</option>
                                                    <option>Staff</option>
                                                    <option>Personal Trainer</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Gender</label>
                                            <div class="col-sm-4">
                                                <div class="form-check">
                                                    <label class="form-check-label">
                                                        <input type="radio" class="form-check-input" name="membershipRadios" id="membershipRadios1" value="Male" checked> Male </label>
                                                </div>
                                            </div>
                                            <div class="col-sm-5">
                                                <div class="form-check">
                                                    <label class="form-check-label">
                                                        <input type="radio" class="form-check-input" name="membershipRadios" id="membershipRadios2" value="Female"> Female </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-md-6">
                                        <div class="row d-flex justify-content-center align-items-center">
                                            <div class="col-md-6">
                                                <div class="avatar mx-auto my-auto white">
                                                    <img id="imgUser" src="${pageContext.request.contextPath}/assets/images/userIcon.svg" alt="avatar mx-auto white" class="rounded-circle img-fluid" style="height: 250px">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-12 mt-2">
                                                <input accept="image/png, image/jpeg" type="file" id="imgInputUser" name="imgInputUser" class="file-upload-default" required>
                                                <div class="input-group ">
                                                    <input type="text" class="form-control file-upload-info" disabled placeholder="Choose User Image">
                                                    <span class="input-group-append">
                                                        <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group ">
                                            <label for="address">Address</label>
                                            <textarea class="form-control" id="address" rows="4"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="form-check form-check-success">
                                                <label class="form-check-label">
                                                    <input type="checkbox" class="form-check-input" checked=""> Active <i class="input-helper"></i></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 text-right mt-3">
                                        <input type='submit' value="Save" class="btn btn-primary mr-2">
                                        <input type='reset' value="Clear" class="btn btn-dark">
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
    <script>
        imgInputUser.onchange = evt => {
            const [file] = imgInputUser.files
            if (file) {
                imgUser.src = URL.createObjectURL(file)
            }
        }
    </script>
    <script src="${pageContext.request.contextPath}/assets/js/file-upload.js"></script>
</html>