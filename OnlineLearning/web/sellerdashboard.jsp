<%-- 
    Document   : sellerdashboard
    Created on : Jun 3, 2023, 8:31:35 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.*"%> 
<%@page import="DAO.*"%> 
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
    <script src="assets/js/sellerdashboard.js"></script>
    <%if(request.getSession().getAttribute("user")==null)
        response.sendRedirect("forbiddenAlert.jsp");
        DAOBlog  b = new DAOBlog();
        int countBlog = b.countBlog();
        int AverageStar = b.AverageStar();
        RegisterDAO r = new RegisterDAO();
        int countRegister = r.countRegister();
    %>
    <c:if test="${(sessionScope.roleName.equals('admin')
                  || sessionScope.roleName.equals('seller')
                  || sessionScope.roleName.equals('marketer'))}">
          <body class='vh-100'>
              
              <%@include file="nav.jsp" %>
              <div id="layoutSidenav">
                  <%@include file="sidenav.jsp" %>
                  <div id="layoutSidenav_content">
                      <main>
                          <div class="container-fluid px-4">
                              <h1 class="mt-4">Marketing Dashboard</h1>
                              <div class="row col-md-12 mt-4">
                                  <div class="col-md-3">
                                      <div class="card bg-danger text-white mb-4">
                                          <div class="card-body">Total Number of Registration</div>
                                          <div class="card-footer d-flex align-items-center justify-content-between">
                                              <h3 class="text-white"><%=countRegister%> Registration</h3>

                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-md-3">
                                      <div class="card bg-primary text-white mb-4">
                                          <div class="card-body">Average Star Of Course Feedback</div>
                                          <div class="card-footer d-flex align-items-center justify-content-between">
                                              <h3 class="text-white"><%=AverageStar%><i class="fa-solid fa-star"></i></h3>

                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-md-3">
                                      <div class="card bg-warning text-white mb-4">
                                          <div class="card-body">The most voted course with 5<i class="fa-solid fa-star"></i></div>
                                          <div class="card-footer d-flex align-items-center justify-content-start">
                                              <h5 class="text-white">${course5star.course.courseName}(${course5star.star} times)</h5>
                                          </div>
                                      </div>
                                  </div>

                                  <div class="col-md-3">
                                      <div class="card bg-success text-white mb-4">
                                          <div class="card-body">Total Number of Blog</div>
                                          <div class="card-footer d-flex align-items-center justify-content-start">
                                              <h4 class="text-white"><%=countBlog%> blogs</h4>
                                          </div>
                                      </div>
                                  </div>
                              </div>


                              <div class="row">
                                  <div class="col-xl-6">
                                      <div class="card mb-4">
                                          <div class="card-header">
                                              <i class="fas fa-chart-area me-1"></i>
                                              Number of Blog by Category
                                          </div>
                                          <div class="card-body"><canvas id="mychart" width="100%" height="50"></canvas></div>
                                      </div>
                                  </div>
                                  <div class="col-xl-6">
                                      <div class="card mb-4">
                                          <div class="card-header">
                                              <i class="fas fa-chart-bar me-1"></i>
                                              Top 3 Course with highest average star
                                          </div>
                                          <div class="card-body"><canvas id="myPFeedback" width="100%" height="50"></canvas></div>
                                      </div>
                                  </div>
                              </div>

                              <div class="row">
                                  <div class="col-md-7">
                                      <div class="card mb-4">
                                          <div class="card-header">
                                              <i class="fas fa-chart-bar me-1"></i>
                                              Count Star of Feedback
                                          </div>
                                          <div class="card-body"id="myStarchart" width="100%" height="50"></div>
                                      </div>
                                  </div>

                                  <div class="col-md-5">
                                      <div class="card mb-4">
                                          <div class="card-header">
                                              <i class="fas fa-chart-bar me-1"></i>
                                              Top 3 Users with the most feedback
                                          </div>
                                          <div class="card-body"><canvas id="myPieChart" width="100%" height="50%"></canvas></div>
                                      </div>
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
                     
              <script>
                  var xValues = ["school1", "school3", "school4", "school8"];
                  var yValues =  ["${requestScope.school1}", "${requestScope.school3}", "${requestScope.school4}", "${requestScope.school8}"];
                  var barColors = ["red", "green", "blue", "orange"];
                  new Chart('mychart', {
                  type: 'pie',
                          data: {
                          labels: xValues,
                                  datasets: [{
                                  backgroundColor: barColors,
                                          data: yValues
                                  }]
                          },
                          options: {
                          title: {
                          display: true,
                                  text: 'Number of Blog by Category'
                          }
                          }
                  });
              </script>

              <script>
                  var xValues = ["Math", "Literature", "Chemistry", "Physics"];
                  var yValues = [${requestScope.school1}, ${requestScope.school3}, ${requestScope.school4}, ${requestScope.school8}];
                  var barColors = ["red", "green", "blue", "orange"];
                  new Chart('myBarchart', {
                  type: 'bar',
                          data: {
                          labels: xValues,
                                  datasets: [{
                                  backgroundColor: barColors,
                                          data: yValues
                                  }]
                          },
                          options: {
                          legend: {display: false},
                                  title: {
                                  display: true,
                                          text: 'Number of Viewer by Category'
                                  }
                          }
                  });
              </script>

              <script>
                  google.charts.load("current", {"packages": ["corechart"]});
                  google.charts.setOnLoadCallback(drawChart);
                  function drawChart() {
                  var data = google.visualization.arrayToDataTable([
                  ["Star", "Count"],
                  ["5*",${requestScope.star5}],
                  ["4*",${requestScope.star4}],
                  ["3*",${requestScope.star3}],
                  ["2*",${requestScope.star2}],
                  ["1*",${requestScope.star1}]
                  ]);
                  var options = {
                  title: "Count Star of Feedback"
                  };
                  var chart = new google.visualization.BarChart(document.getElementById("myStarchart"));
                  chart.draw(data, options);
                  }
              </script>

              <script>
                  const dataPie = {
                  labels: [
                  <c:forEach items="${userfeedback}" var="uf">
                  "${uf.user.userName}",
                  </c:forEach>
                  ],
                          datasets: [{
                          label: "My First Dataset",
                                  data: [
                  <c:forEach items="${userfeedback}" var="uf">
                                  "${uf.star}",
                  </c:forEach>
                                  ],
                                  backgroundColor: [
                                          "rgb(255, 99, 132)",
                                          "rgb(54, 162, 235)",
                                          "rgb(255, 205, 86)"
                                  ],
                                  hoverOffset: 4
                          }]
                  };
                  const configPie = {
                  type: "pie",
                          data: dataPie,
                  };
                  const myPieChart = new Chart(
                          document.getElementById("myPieChart"),
                          configPie
                          );
              </script>

              <script>
                  const dataBar = {
                  labels: [
                  <c:forEach items="${pFeedback}" var="pf">
                  "${pf.product.productName}",
                  </c:forEach>
                  ],
                          datasets: [{
                          label: "My First Dataset",
                                  data: [
                  <c:forEach items="${pFeedback}" var="pf">
                                  "${pf.star}",
                  </c:forEach>
                                  ],
                                  backgroundColor: [
                                          "rgb(255,0,0)",
                                          "rgb(54, 162, 235)",
                                          "rgb(255, 205, 86)"
                                  ],
                                  hoverOffset: 4
                          }]
                  };
                  const configBar = {
                  type: "pie",
                          data: dataBar,
                  };
                  const myBarChart = new Chart(
                          document.getElementById("myPFeedback"),
                          configBar
                          );
              </script>



              //<script src="assets/js/mktdashboard.js"></script>                         
          </body>
    </c:if>


</html>
