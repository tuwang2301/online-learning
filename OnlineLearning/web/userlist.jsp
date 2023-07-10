<%-- 
    Document   : userList
    Created on : Jan 28, 2023, 1:10:32 AM
    Author     : ducth
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


        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>List User</title>
        
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
    <%
        AccountDAO a = new AccountDAO();
        ArrayList<Account> lst = a.selectAll();
        %>
    <body class="sb-nav-fixed">
         <jsp:include page="/nav.jsp"/>
        <div id="layoutSidenav">
             <jsp:include page="/sidenav.jsp"/>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">User List</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                List User
                            </div>
                            <div class="row">
                                <div class="col-md-6 mt-4">
                                    <form id="filter" action="filteruser" method="get">
                                        <div class="justify-content-md-start row">
                                            <div class="col-md-6 row align-items-center">
                                                <div class="col-md-2">
                                                    <label class="form-label">Role</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <select name="role_id" class="form-select" aria-label="Default select example" onchange="document.getElementById().submit()">
                                                        <option value="" >All</option>
                                                        <option value="1" <c:if test="${requestScope.role.equals('1')}">selected</c:if> >Admin</option>
                                                        <option value="2" <c:if test="${requestScope.role.equals('2')}">selected</c:if> >Seller</option>
                                                        <option value="3" <c:if test="${requestScope.role.equals('3')}">selected</c:if> >Customer</option>
                                                        <option value="4" <c:if test="${requestScope.role.equals('4')}">selected</c:if> >Marketing</option>
                                                        </select>  
                                                    </div>
                                                </div>
                                                <div class="col-md-4 row align-items-center">
                                                    <div class="col-md-4">
                                                        <label class="form-label">Status</label>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <select name="status" class="form-select" aria-label="Default select example" onchange="document.getElementById().submit()">
                                                            <option value="" >All</option>
                                                            <option value="1" <c:if test="${requestScope.status.equals('1')}">selected</c:if> >Active</option>
                                                        <option value="2" <c:if test="${requestScope.status.equals('2')}">selected</c:if> >Inactive</option>
                                                        </select>
                                                    </div>  
                                                </div>                                               
                                            </div>
                                        </form>
                                    </div>
                                    <div class="row col-md-6 mt-4">
                                        <div class="col-md-8">
                                            <div class="search-bar p-1 d-lg-block ms-2">                                                        
                                                <div id="search" class="menu-search mb-2">
                                                    <form action="searchuser" method="get" id="searchform" class="searchform">
                                                        <div class="container">
                                                            <div class="row">
                                                                <span> 
                                                                    <input oninput="searchBy(this" value="${txtS}" type="text" class="col-8" name="txt" placeholder="Search...">
                                                                <button style="border: none;" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                                                            </span>
                                                        </div>

                                                    </div>
                                                </form>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <a class="btn btn-secondary" href="adduser.jsp">Add new User</a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table width ="100%">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Gender</th>
                                                <th>FullName</th>
                                                <th>Address</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Role</th>                                                                               
                                                <th>CreatDate</th>
                                                <th>StatusName</th>
                                            </tr>
                                        </thead>
                                                <% for(Account x: lst) { %>
                                                <tbody>

                                                    <tr>
                                                        <td><%= x.getId() %></td>                                               
                                                        <td><%= x.getUserName() %></td>
                                                        <td><%= x.getGender() %></td>
                                                        <td><%= x.getFullName() %></td>
                                                        <td><%= x.getAddress() %></td>
                                                        <td><%= x.getEmail() %></td>
                                                        <td><%= x.getPhoneNum() %></td>
                                                        <td><%= x.getRoleId() %></td>
                                                        <td><%= x.getTime()%></td>                                                     
                                                        <td><%= a.getUserStatus(x.getStatusId())%></td>
                                                        
                                                    </tr>

                                                </tbody>

                                                <%}%>
                                                
                                    </table>

                                    <c:if test="${requestScope.check.equals('list')}">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                                <c:set var="page" value="${page}"/>
                                                <c:if test="${requestScope.page > 1}">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="user?page=${requestScope.page-1}">Previous</a></li>
                                                    </c:if>
                                                    <c:forEach begin="${1}" end="${num}" var="i">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="user?page=${i}">${i}</a></li>
                                                    </c:forEach>
                                                    <c:if test="${requestScope.num > requestScope.page}">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="user?page=${requestScope.page+1}">Next</a></li>
                                                    </c:if>    
                                            </ul>
                                        </nav>
                                    </c:if>

                                    <c:if test="${requestScope.check.equals()}">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                                <c:set var="page" value="${page}"/>
                                                <c:if test="${requestScope.page > 1}">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="filteruser?role_id=${requestScope.role}&status=${requestScope.status}&page=${requestScope.page-1}">Previous</a></li>
                                                    </c:if>
                                                <c:forEach begin="${1}" end="${num}" var="i">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="filteruser?role_id=${requestScope.role}&status=${requestScope.status}&page=${i}">${i}</a></li>
                                                    </c:forEach>
                                                    <c:if test="${requestScope.num > requestScope.page}">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="filteruser?role_id=${requestScope.role}&status=${requestScope.status}&page=${requestScope.page+1}">Next</a></li>
                                                    </c:if>
                                                    
                                            </ul>
                                        </nav>
                                    </c:if>

                                    <c:if test="${requestScope.check.equals('search')}">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                                <c:set var="page" value="${page}"/>
                                                <c:if test="${requestScope.page > 1}">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="searchuser?txt=${requestScope.search}&page=${requestScope.page-1} ">Previous</a></li>
                                                    </c:if>
                                                <c:forEach begin="${1}" end="${num}" var="i">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="searchuser?txt=${requestScope.search}&page=${i}">${i}</a></li>
                                                    </c:forEach>
                                                     <c:if test="${requestScope.num > requestScope.page}">
                                                    <li class="page-item"><a class="page-link ${i==page?"current":""}" href="searchuser?txt=${requestScope.search}&page=${requestScope.page+1}">Next</a></li>
                                                    </c:if>
                                            </ul>
                                        </nav>
                                    </c:if>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>

    </body>
</html>
