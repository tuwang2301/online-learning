<%-- 
    Document   : viewuser
    Created on : Jan 30, 2023, 11:42:25 PM
    Author     : ducth
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" href="assets/css/viewuserdetail.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>View User</title>
        
        <link href="assets/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://kit.fontawesome.com/d846362117.css" crossorigin="anonymous">
        
        <script src="https://www.gstatic.com/charts/loader.js"></script>
        

        <script src="assets/js/scripts.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        
        
    </head>
    <body class="sb-nav-fixed">
        <jsp:include page="/nav.jsp"/>

        <div id="layoutSidenav">
              <jsp:include page="/sidenav.jsp"/>

            <div class="container-fluid rounded bg-white mt-5 mb-5">
                <div class="col">

                    <div class="border-right d-flex justify-content-center align-items-center ">
                        <form action="userdetail?action=edituser&uid=${Account.Id}" method="post">
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-center align-items-center mb-3">
                                    <h4 class="text-right">Account Detail</h4>
                                </div>


                                <div class="row mt-3">
                                    <div class="col-md-12"><label for = "pwd">Username</label><input name="username" type="text" class="form-control" placeholder="enter user number" value="${user.userName}" readonly></div>

                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12"><label for = "pwd">Gender</label></div>
                                </div>


                                <div class="row mt-3 ml-4">
                                    <div class="col-md-5"> 
                                        <input readonly="" type="radio" name="gender" ${user.getGender() == 'male'?"checked":""} id="radio1" value="male">Male
                                    </div>

                                    <div class="col-md-5">
                                        <input readonly="" type="radio" name="gender" ${user.getGender() == 'female'?"checked":""} id="radio2" value="female">Female
                                    </div>
                                    <div class="col-md-12 mt-3"><label for = "pwd">Email</label><input readonly="" name="email" type="email" class="form-control" placeholder="enter email" value="${user.email}"></div>
                                    <div class="col-md-12 mt-3"><label for = "pwd">Phone Number</label><input readonly="" name ="phone" type="tel" class="form-control" placeholder="enter phone number" value="${user.phoneNum}"></div>
                                    <div class="col-md-12 mt-3"><label for = "pwd">Role</label>
                                        <select class="form-select" name="role_id" id="role">
                                            <c:forEach items="${role}" var="r">
                                                <option <c:if test="${user.role.getRoleName() == r.getRoleName()}">selected</c:if> value="${r.getRoleID()}">${r.getRoleName()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col-md-12 mt-4"><label for = "pwd">Status</label>
                                        <select class="form-select" name="status_id" id="status">
                                            <c:forEach items="${userstatus}" var = "us">
                                                <option <c:if test="${user.userStatus.getStatusName() == us.getStatusName()}">selected</c:if> value="${us.getId()}">${us.getStatusName()}</option>
                                            </c:forEach>

                                        </select>
                                    </div>


                                </div>
                                <div class="row">
                                    <div class="col-md-12 mt-5 text-center">
                                        <button class="btn btn-primary" type="submit">Edit</button>

                                        <input class="btn btn-secondary" type="reset" value="Reset">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>  
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
