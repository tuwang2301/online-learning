<%-- 
    Document   : admindashboard
    Created on : Jun 3, 2023, 8:37:15 PM
    Author     : dell
--%>

<%@page import = "java.util.*" %>
<%@page import = "DAO.*" %>
<%@page import = "model.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" href="assets/css/newsubject.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin Dashboard</title>

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
    <%if(request.getSession().getAttribute("user")==null){
            response.sendRedirect("forbiddenAlert.jsp");}
            AccountDAO a = new AccountDAO();
            int countAccount = a.countAccount();   
            CourseDAO c = new CourseDAO();
            int countCourse = c.countCourse();
            RegisterDAO r = new RegisterDAO();
            int countRegister = r.countRegister();  
            List<Course> lst = c.getCourses();
            List<Register> lrt = r.countCustomerCourse();
            
    %>
    <%
//    int data = (int) request.getAttribute("countTime");
    %>
    <body class="sb-nav-fixed">

        <%@include file="nav.jsp" %>
        <div id="layoutSidenav">
            <%@include file="sidenav.jsp" %>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Welcome To Dashboard</h1>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Total Number of Customers</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h3><%=countAccount%> Account</h3>

                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Total Number of Course</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h3><%=countCourse%> Courses</h3>                                         
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Total Number of Registered</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h3><%=countRegister%> Register</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
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
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Statics of new subjects 
                                    </div>                                    
                                    <div class="card-body subjects-table">                                                                                
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Subject name</th>
                                                    <th>Category</th>
                                                    <th>Customers</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% for(Course x: lst) { %>
                                                <tr>
                                                    <td><%= x.getCourseName() %></td>
                                                    <td><%= c.getCategoryName(x.getCatergoryId())%> </td>
                                                    <td><%= r.countRegisterByCourse(x.getCourseId()) %></td>
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">

                                        New registrations
                                    </div>
                                    <div class="card-body subjects-table">                                                                                
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>UserID</th>
                                                    <th>RegisterTime</th>                                                  
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% for(Register e: lrt) { %>
                                                <tr>
                                                    <td><%= e.getUserId()%></td>
                                                    <td><%= e.getRegTime()%></td>
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">

                                        Revenues 
                                    </div>
                                    <div class="card-body">Total: <%= a.countPrice()%>$</div>

                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">

                                        Trends of order count
                                    </div>
                                    <div class="card-body">
                                        <!--<label for="start-date">Start Date:</label>
                                          <input type="text" id="start-date" placeholder="DD/MM/YYYY">
                                     <label for="end-date">End Date:</label>
                                        <input type="text" id="end-date" placeholder="DD/MM/YYYY">-->
                                        <%request.getAttribute("countTime");%>
                                        <form action="AdmindashboardServlet" method="post">
                                            <select name="selectYear" id="selectYear">
                                                <option value="2021-">2021</option>
                                                <option value="2022-">2022</option>
                                                <option value="2023-">2023</option>
                                                <!-- Các tùy chọn năm khác -->
                                            </select>                                        
                                            <select name="selectWeek" id="selectWeek">                                               
                                                <option value="08-05/14-05">08/05 To 14/05</option>
                                                <option value="15-05/21-05">15/05 To 21/05</option>
                                                <option value="22-05/28-05">22/05 To 28/05</option>
                                                <option value="29-05/04-06">29/05 To 04/06</option>
                                                <option value="05-06/11-06">05/06 To 11/06</option>
                                                <option value="12-06/18-06">12/06 To 18/06</option>
                                                <option value="19-06/25-06">19/06 To 25/06</option>
                                                <option value="26-06/02-07">26/06 To 02/07</option>
                                                <option value="03-07/09-07<">03/07 To 09/07</option>
                                                <option value="10-07/16-07">10/07 To 16/07</option>
                                                <option value="17-07/23-07">17/07 To 23/07</option>
                                                <option value="24-07/30-07">24/07 To 30/07</option>
                                                <option value="31-07/06-08">31/07 To 06/08</option>
                                                <!-- Các tùy chọn tuần khác -->
                                            </select>
                                            <button id="show-trends-button" type="submit">Show Trends</button>
                                            <canvas id="chart"></canvas>
                                        </form>
                                    </div>

                                    <!--                                    <script>
                                                                            document.getElementById('show-trends-button').addEventListener('click', function () {
                                                                            var selectYear = document.getElementById('selectYear');
                                                                            var selectWeek = document.getElementById('selectWeek');
                                                                            var selectedYear = selectYear.value;
                                                                            var selectedWeek = selectWeek.value;
                                                                            console.log('Selected Year:', selectedYear);
                                                                            console.log('Selected Week:', selectedWeek);
                                                                            // Thực hiện các tác vụ khác dựa trên giá trị ngày và tuần đã chọn
                                                                            });
                                                                        </script>-->

                                    <script>
                                        document.getElementById('show-trends-button').addEventListener('click', function(event) {
                                        event.preventDefault(); // Ngăn chặn gửi lại form

                                        // Lấy giá trị được chọn từ các thẻ select
                                        var selectedYear = document.getElementById('selectYear').value;
                                        var selectedWeek = document.getElementById('selectWeek').value;
                                        // Gọi hàm để lấy dữ liệu từ máy chủ (AdmindashboardServlet) dựa trên năm và tuần đã chọn
                                        // Ví dụ: fetchDataFromServer(selectedYear, selectedWeek, function(data) {
                                        //   var countTime = data.countTime;
                                        //   createChart(countTime);
                                        // });

                                        // Dữ liệu giả định
                                        var countTime = [10, 40, 30, 40, 25];
                                        // Tạo biểu đồ dựa trên dữ liệu
                                        createChart(countTime);
                                        });
                                        function createChart(countTime) {
                                        var ctx = document.getElementById('chart').getContext('2d');
                                        var myChart = new Chart(ctx, {
                                        type: 'bar',
                                                data: {
                                                labels: ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6", "Day 7"],
                                                        datasets: [{
                                                        label: 'Day',
                                                                data: countTime,
                                                                backgroundColor: 'rgba(0, 123, 255, 0.5)',
                                                                borderColor: 'rgba(0, 123, 255, 1)',
                                                                borderWidth: 1
                                                        }]
                                                },
                                                options: {
                                                scales: {
                                                y: {
                                                beginAtZero: true
                                                }
                                                }
                                                }
                                        });
                                        }
                                    </script>

                                    <!--                                    <script>
                                                                            var countRegister = <%= countRegister %>; // L?y gi� tr? countRegister t? JSP
                                                                            
                                                                             // L?y gi� tr? countRegister t? JSP
                                    //                                        
                                    //                                        data = countRegister;
                                                                            // V? bi?u d?
                                                                            var ctx = document.getElementById("chart").getContext("2d");
                                                                            var chart = new Chart(ctx, {
                                                                            type: "line",
                                                                                    data: {
                                                                                    labels: ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6", "Day 7"],
                                                                                            datasets: [
                                                                                            {
                                                                                            label: "Trend",
                                                                                                    data: 11,
                                                                                                    backgroundColor: "rgba(54, 162, 235, 0.2)",
                                                                                                    borderColor: "rgba(54, 162, 235, 1)",
                                                                                                    borderWidth: 1
                                                                                            }
                                                                                            ]
                                                                                    },
                                                                                    options: {
                                                                                    responsive: true,
                                                                                            scales: {
                                                                                            y: {
                                                                                            beginAtZero: true
                                                                                            }
                                                                                            }
                                                                                    }
                                                                            });
                                                                        </script>-->

                                    <!--                                    
                                    
                                                                        <div class="card-body"><canvas id="mychart" width="100%" height="50"></canvas></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                    
                                    <!--                        <div class="col-xl-12">
                                                                <div class="card mb-4">
                                                                    <div class="card-header">
                                                                        <i class="fas fa-chart-bar me-1"></i>
                                                                        Revenues
                                                                    </div>
                                                                    <div class="card-body"><canvas id="countUserOrder" width="100%" height="30"></canvas></div>
                                                                </div>
                                                            </div>      -->
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
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
                        <script src="js/scripts.js"></script>
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                        <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
                        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
                        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
                        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
                        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>




                        <script>
                                          const dataBar = {
                                          labels: [
                            <c:forEach items="${orders}" var="od">
                                          "${od.user.userName}",
                            </c:forEach>
                                          ],
                                                  datasets: [{
                                                  label: "My First Dataset",
                                                          data: [
                            <c:forEach items="${orders}" var="od">
                                                          "${od.totalPrice}",
                            </c:forEach>
                                                          ],
                                                          backgroundColor: [
                                                                  "rgb(255, 0, 0)",
                                                                  "rgb(0, 63, 127)",
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
                                                  document.getElementById("countUserOrder"),
                                                  configBar
                                                  );
                        </script>-->




                        </body>

                        </html>
