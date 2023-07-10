<%-- 
    Document   : userprofile
    Created on : May 16, 2023, 11:48:37 PM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>User profile</title>
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
        <!--
            
        
        
        -->
    </head>
    <body>
        <!-- Start Header Area -->
        <jsp:include page="header.jsp" />
        <!-- End Header Area -->

        <div class="container-fluid rounded mb-5" style="margin-top: -80px;">
            <div class="col" >
                <div class="border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span> </span></div>

                </div>
                <div class="border-right d-flex justify-content-center align-items-center ">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-center align-items-center mb-3">
                            <h4 class="text-right">User Profile</h4>
                        </div>
                        <div class="row mt-2">  
                        </div>
                        <div class="row mt-3">                          
                        </div>
                        <div class="row mt-3">   
                            <div class="col-md-12 mt-3"><label for = "pwd">Username: </label>
                                <a  class="text-right"> ${sessionScope.user.getUserName()}</a>
                            </div>
                            <div class="col-md-12 mt-3"><label for = "pwd">Fullname: </label>
                                <a  class="text-right"> ${sessionScope.user.getFullName()}</a>
                            </div>
                            <div class="col-md-12 mt-3"><label for = "pwd">Email: </label>
                                <a  class="text-right"> ${sessionScope.user.getEmail()}</a></div>

                            <div class="col-md-12 mt-3"><label for = "pwd">Phone Number: </label>
                                <a  class="text-right"> ${sessionScope.user.getPhoneNum()}</a></div>
                            <div class="col-md-12 mt-3"><label for = "pwd">Address: </label>
                                <a  class="text-right"> ${sessionScope.user.getAddress()}</a>
                            </div>
                            <div class="col-md-12 mt-3"><label for = "pwd">Role: </label>
                                <a  class="text-right"> ${sessionScope.user.getRoleName()}</a>
                            </div>
                            <div class="col-md-12 mt-3"><label for = "pwd">Gender: </label>
                                <a  class="text-right"> ${sessionScope.user.getGender()}</a>
                            </div>
                        </div>


                        <div class="mt-5 text-center"><a class="primary-btn" href="edit.jsp">Edit User</a>

                        <div class="mt-4 text-center">
                            <a class="primary-btn" href="changepassword.jsp">Change Password</a>
                        </div>
                        <% if (session.getAttribute("passwordChanged") != null) { %>
                        <div class="alert alert-success" role="alert">
                            Password has been changed successfully!
                        </div>
                        <% session.removeAttribute("passwordChanged"); %>
                        <% } %>


                    </div>

                </div>
            </div>  



            <!-- End footer -->

            <!-- Start Script -->

            <script src="assets/js/jquery-1.11.0.min.js"></script>
            <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
            <script src="assets/js/bootstrap.bundle.min.js"></script>
            <script src="assets/js/templatemo.js"></script>
            <script src="assets/js/custom.js"></script>
            <!-- End Script -->
        </div>
        <!-- Start footer -->
        <%@include file="footer.jsp" %>
    </body>
</html>

