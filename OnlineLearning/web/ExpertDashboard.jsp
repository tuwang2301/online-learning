<%-- 
    Document   : Expert
    Created on : Jun 16, 2023, 10:42:49 PM
    Author     : dell
--%>
<%@page import = "java.util.*" %>
<%@page import = "DAO.*" %>
<%@page import = "model.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Dashboard</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">


        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Marketing Dashboard</title>
        
        <link href="assets/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://kit.fontawesome.com/d846362117.css" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <script src="https://www.gstatic.com/charts/loader.js"></script>
        

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="assets/js/scripts.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    </head>
    
    <%if(request.getSession().getAttribute("user")==null)
        response.sendRedirect("forbiddenAlert.jsp");
        AccountDAO a = new AccountDAO();
            int countAccount = a.countAccount();   
            CourseDAO c = new CourseDAO();
            int countCourse = c.countCourse();
            RegisterDAO r = new RegisterDAO();
            int countRegister = r.countRegister();  
            List<Course> lst = c.getCourses();
            List<Register> lrt = r.countCustomerCourse();
    %>
    <c:if test="${(sessionScope.roleName.equals('expert')
                  || sessionScope.roleName.equals('seller')
                  || sessionScope.roleName.equals('marketer'))}">
          <body class='vh-100'>
              
              <%@include file="nav.jsp"%>
              <div id="layoutSidenav">
                  <%@include file="sidenav.jsp" %>
                  <div id="layoutSidenav_content">
                      <main>
                          <div class="container-fluid px-4">
                              <h1 class="mt-4">Expert Dashboard</h1>
                              <div class="row col-md-12 mt-4">
                                  <div class="col-md-3">
                                      <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Total Number of Customers</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h3><%=countAccount%> Account</h3>

                                    </div>
                                </div>
                                  </div>
                                  <div class="col-md-3">
                                      <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Total Number of Course</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h3><%=countCourse%> Courses</h3>                                         
                                    </div>
                                </div>
                                  </div>
                                  <div class="col-md-3">
                                      <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Total Number of Registered</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h3><%=countRegister%> Register</h3>
                                    </div>
                                </div>
                                  </div>

                                  <div class="col-md-3">
                                      <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">Most Registeres Course</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h4><%=countCourse%> Registeres Course</h4>
                                    </div>
                                </div>
                                  </div>
                              </div>


                              <div class="row">
                                  <div class="col-xl-6">
                                      
                                  </div>
                                  <div class="col-xl-6">
                                      
                                  </div>
                              </div>

                              <div class="row">
                                  <div class="col-md-7">
                                      
                                  </div>

                                  <div class="col-md-5">
                                      
                                  </div>
                              </div>


                          </div>

                      </main>
                      <footer class="py-4 bg-light mt-auto">

                          <div class="container-fluid px-4">
                              <div class="d-flex align-items-center justify-content-between small">
                                  <div class="text-muted"></div>

                              </div>
                          </div>
                      </footer>
                  </div>
              </div>                                                         
          </body>
    </c:if>


</html>
