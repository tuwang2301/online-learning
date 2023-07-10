<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">


        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/logo.png">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/css/main.css">
        <link rel="stylesheet" href="./assets/css/style.css">

        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.css">
        <link rel="stylesheet" href="assets/css/nouislider.min.css">
        <link rel="stylesheet" href="assets/css/ion.rangeSlider.css" />
        <link rel="stylesheet" href="assets/css/ion.rangeSlider.skinFlat.css" />
        <link rel="stylesheet" href="assets/css/magnific-popup.css">

    </head>
    <body>
        <jsp:include page="header.jsp" />
        <!-- Ki?m tra và hi?n th? thông báo thành công -->

        <section class="login_box_area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="login_box_img">
                            <img class="img-fluid" src="assets/img/login.jpg" alt="">
                            <div class="hover">
                                <h4>Have not an account?</h4>
                                <a class="btn btn-success" href="signup.jsp">Register</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 align-content-center"> 
                        <div class="login_form_inner">
                            <h1 class="mb-5 text-center">Login</h1>
                            <form action="login" class="row signin-form" method="post">
                                <div class="form-group mb-3">
                                    <label for="username">Username</label>
                                    <input type="text" id="username" name="username" class="form-control" required>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="password">Password</label>
                                    <input type="password" id="password" name="password" class="form-control" required>
                                </div>
                                <h5 class="text-danger">${sessionScope.mess}</h5>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-success">Sign In</button>
                                </div>
                            </form>
                            <div class="mt-3 text-danger">${alert}</div>    
                            <div class="mt-3 text-success">${successMessage}</div>    
                            <div class="mt-5 d-flex justify-content-between">
                                <a class="highlight" href="resetpassword.jsp">Forgot Password</a>
                                <p class="text-center text-md-right">Not a member? <a class="highlight" data-toggle="tab" href="signup.jsp">Sign Up</a></p>                                     
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--</section>-->
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>


        <!-- Start footer -->


        <!-- End footer -->


        <!-- Start Script -->
        <script src="assets/js/jquery-1.11.0.min.js"></script>
        <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/templatemo.js"></script>
        <script src="assets/js/custom.js"></script>
    </body>
    <%@include file="footer.jsp" %>                                                                                                                                                                                                                                        
</html>
