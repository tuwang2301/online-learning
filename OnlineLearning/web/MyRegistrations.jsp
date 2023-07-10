<%-- 
    Document   : MyRegistrations
    Created on : May 23, 2023, 3:22:29 PM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.*"%> 
<%@page import="DAO.*"%> 
<%@page import = "java.util.*" %>

<%@page import = "model.Register" %>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List" %>
<% RegisterDAO dao = new RegisterDAO();
 List<Register> list =(List<Register>)request.getAttribute("listRe");%>
 <%
        AccountDAO a = new AccountDAO();
        ArrayList<Account> lst = a.selectAll();
        %>
<!DOCTYPE html>
<html>
    <head>

        <title>My Registrations</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/templatemo.css">


        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">

        <!-- JS của Bootstrap (cần thiết cho các thành phần JavaScript của Bootstrap) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="assets/css/myregi.css">
        <style>
  
        </style>
    </head>
    <%if(request.getSession().getAttribute("user")==null)
               response.sendRedirect("forbiddenAlert.jsp");
    %>
    <c:if test="${sessionScope.roleName.equals('customer')}">
        <body>

            <%@include file="header.jsp" %>
            <div class="navbar3" style="  background-color: #f9f9f9;
    border-bottom: 1px solid #e5e5e5;
    padding-top: 10px;
    padding-bottom: 10px;
}">
            <div class="container2">
                <span class="navbar3-brand"><a href="home">Home</a></span>
                <span class="navbar3-brand-divider ">/</span>
                <span class="navbar3-brand"><a href="#">My Registrations</a></span>
                

                
            </div>
        </div>
            <h1  style="text-align: center;">My registrations</h1>
            <section class="body_content">

                <div class="container">
                    <div class="row">
                        <div style="">
                            <div class="search-box" >
                                <form action="search" method="get">
                                    <input type="hidden" name="userid" value="${user.getId()}">
                                    <input type="text" name="txtt" placeholder="Search...">
                                    <button type="submit">Search</button>
                                </form>
                            </div>

                            <button class="add_button" style="width: 150px;"  onclick="goToCourseList()">Add Course</button>
                            <form action="testtt" method="post">
                                <div class="filter-box">
                                    <select name="dateFilter" id="date-filter" style="">
                                        <option value="0">All Dates</option>
                                        <option value="1">Last Week</option>
                                        <option value="2">Last Month</option>
                                        <option value="3">Last 3 Months</option>
                                        <option value="4">Last 6 Months</option>
                                    </select>
                                                            <input type="hidden"  name="user-id" value="${user.getId()}"  />

                                    <button type="submit" id="filter-button">Filter</button>
                                </div>
                            </form>



                            <div class="table_regis">

                             
                                <table class="table3" style="border:none">
                                      <thead>
                                    <tr>
                                        <th>ID</th>
                                         <th>Email</th>
                                        <th>Time</th>
                                        <th>Course</th>
                                        <th>Pakage</th>
                                        <th>Total Cost</th>
                                        <th>Valid from</th>
                                        <th>Valid to</th>
                                        <th>Update by</th>
                                         <td ><i class="fa-solid fa-circle-info" ></i></td>

                                    </tr>
                                      </thead>
                                         <tbody>
                                    <% int count = 1; %>
                                    <% for(Register x: list) { %>
                                    <tr>
                                         <td><%= count %></td>
                                         <td><%= a.getUserEmail(x.getUserId()) %></td>
                                        <td><%= x.getValidFrom() %></td>
                                        <td><% 
                                               int courseid = x.getCourseId();
       if (courseid == 3) {
      out.print("Physics");
    }else if (courseid == 1) {
      out.print("Math");
    }else if (courseid == 2) {
      out.print("Chemistry");
    }else if (courseid == 4) {
      out.print("Music");
    }else if (courseid == 5) {
      out.print("Biology");
    }else if (courseid == 6) {
      out.print("Literature");
    }else if (courseid == 7) {
      out.print("English");
    }else if (courseid == 8) {
      out.print("Science");
    }else if (courseid == 9) {
      out.print("Geography");
    }else if (courseid == 10) {
      out.print("History");
    }
                                            %></td>
                                        <td>  <%
      int packageId = x.getPackageId();
       if (packageId == 3) {
      out.print("6 tháng");
    }else if (packageId == 1) {
      out.print("1 tháng");
    }else if (packageId == 2) {
      out.print("3 tháng");
    }else if (packageId == 4) {
      out.print("1 năm");
    }
   
                                            %></td>
                                        <td><%= x.getCost() %></td>
                                        <td><%= x.getValidFrom() %></td>
                                        <td><%= x.getValidTo() %></td>
                                        <td><%= a.getUsername(x.getUserId()) %></td>
                                        <td><a href="LessonView.jsp?courseid=<%=x.getCourseId()%>"><i class="fa-solid fa-eye"></i></a></td>
                                            <td><a onclick="return confirm('Are you sure to cancel the course and we will not refund?')" href="test?courseid=<%=x.getCourseId()%>&user-id=<%=x.getUserId()%>">
                                                    <i class="fa-solid fa-trash"></i>
                                                </a>
                                            </td>
                                    </tr>
                                    <% count++; %>
                                    <% } %>
                                      </tbody>
                                </table>



                            </div>


                        </div>
                    </div>

            </section>
            <%@include file="footer.jsp" %>

        </body>
    </c:if>

    <script src="assets/js/Myregistation.js"></script>

</html>
