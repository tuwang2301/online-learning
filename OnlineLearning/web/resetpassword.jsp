<%-- 
    Document   : resetpassword
    Created on : May 23, 2023, 10:16:12 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Reset Password</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon-->
        <link rel="shortcut icon" href="assets/img/logo.png">
        <!-- Author Meta -->
        <meta name="author" content="CodePixar">
        <!-- Meta Description -->
        <meta name="description" content="">
        <!-- Meta Keyword -->
        <meta name="keywords" content="">
        <!-- meta character set -->
        <meta charset="UTF-8">
        
        <link rel="shortcut icon" href="assets/img/logo.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/nouislider.min.css">
        <link rel="stylesheet" href="assets/css/ion.rangeSlider.css" />
        <link rel="stylesheet" href="assets/css/ion.rangeSlider.skinFlat.css" />
        <link rel="stylesheet" href="assets/css/magnific-popup.css">

        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/css/main.css">
        
        
    </head>
    <body>
        <jsp:include page="/header.jsp" />
        <!--================Reset Box Area =================-->
        <section class="login_box_area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="login_box_img">
                            <img class="img-fluid" src="assets/img/login.jpg" alt="">
                            <div class="hover">
                                <h4>Have not an account?</h4>
                                <a class="btn btn-success" href="signup.jsp">Register</a>
                                <p>
                                <h4>Already have account?</h4>
                                <a class="btn btn-success" href="login.jsp">Login</a>
                            </div>
                            
                        </div>
                    </div>
                    <div class="col-lg-6 align-content-center"> 
                        <div class="login_form_inner">
                            
                            
                            <h1 class="text-center mb-5">Reset Password</h1>
                            <form class="row login_form" action="ResetPasswordServlet" method="post" id="contactForm" novalidate="novalidate">
                                <div class="form-group mb-3">
                                    <label for="email">Email</label>
                                    <input type="email" id="email" name="email" class="form-control" required>
                                </div>
                                <div class="col-md-12 form-group">
                                    <h3 class="text-danger">${mess}</h3>
                                </div>
                                <div class="col-md-12 form-group">
                                    <button type="submit" value="submit" class="btn btn-success">
                                        Send Code
                                    </button>
                                </div>
                            </form>
                                
                                
                                
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Reset Box Area =================-->


    </body>
    <jsp:include page="/footer.jsp" />
</html>
