<%-- 
    Document   : edit
    Created on : May 23, 2023, 12:59:52 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/css/main.css">
        <%@include file="header.jsp" %>
    </head>
    <body>
        <form action="edit" method="post">
            <div class="container-fluid rounded mb-5" style="margin-top: -70px;">
                <div class="col">
                    <div class="border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span> </span></div>
                        <div class="border-right d-flex justify-content-center align-items-center">
                        </div>
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-center align-items-center mb-3">
                                <h4 class="text-center">User Profile</h4>
                            </div>
                            <div class="row mt-2">
                            </div>
                            <div class="row mt-3">
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12 mt-3">
                                    <div class="container-fluid">
                                        <div class="row justify-content-center">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="username">Username:</label>
                                                    <input type="text" class="form-control" name="userName" value="${sessionScope.user.getUserName()}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 mt-3"
                                     <div class="container-fluid">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="fullname">Fullname:</label>
                                                <input type="text" class="form-control" name="fullName" value="${sessionScope.user.getFullName()}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 mt-3"
                                 <div class="container-fluid">
                                <div class="row justify-content-center">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="email">Email:</label>
                                            <input type="email" class="form-control" name="email" value= "${sessionScope.user.getEmail()}">
                                            ${requestScope.mess}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 mt-3"  
                             <div class="container-fluid">
                            <div class="row justify-content-center">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="PhoneNumber">Phone Number:</label>
                                        <input type="text" class="form-control" name="phoneNumber" value="${sessionScope.user.getPhoneNum()}">
                                        ${requestScope.mess}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 mt-3"    
                         <div class="container-fluid">
                        <div class="row justify-content-center">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="Address">Address:</label>
                                    <input type="text" class="form-control" name="Address" value="${sessionScope.user.getAddress()}"> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 mt-3"  
                     <div class="container-fluid">
                    <div class="row justify-content-center">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="Role">Role:</label >
                                <input type="text" class="form-control" name="role" value="${sessionScope.user.getRoleName()}">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 mt-3"   
                 <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="Gender">Gender:</label><p>
                            <div style="display: flex; justify-content: space-between">
                                <c:if test="${sessionScope.user.getGender()}">
                                    <div><input type="radio" name="gender" value="true" checked> Male</div>

                                    <div><input type="radio" name="gender" value="false"> Female</div>
                                </c:if>
                                <c:if test="${!sessionScope.user.getGender()}">
                                    <div><input type="radio" name="gender" value="true"> Male</div>

                                    <div><input type="radio" name="gender" value="false" checked> Female</div>
                                </c:if>
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
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-lg-6 text-center mt-5 mb-5">
            <input type="submit" value="Save">
        </div>
    </div>
</div>
</div>
</form>
<%@include file="footer.jsp" %>
</body>
</html>
