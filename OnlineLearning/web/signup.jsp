<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Signup</title>
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
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">
                ${successMessage}
            </div>
        </c:if>      


        <section class="login_box_area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="login_box_img">
                            <img class="img-fluid" src="assets/img/login.jpg" alt="">
                            <div class="hover">
                                <h4>Already have account?</h4>
                                <a class="btn btn-success" href="login.jsp">Login</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 align-content-center"> 
                        <div class="login_form_inner" style="padding: 30px 50px 10px;">
                            <h1 class="text-center">Sign up</h1>
                            <form action="signup" method="post">
                                <div class="form-group mb-3">
                                    <label for="fullname">Full Name: <span class="text-danger">${alertName}</span></label>
                                    <input type="text" id="fullname" name="fullname" value="${fullName}" class="form-control" required>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="username">Username: <span class="text-danger">${alertUserName}</span></label>
                                    <input type="text" id="username" name="username" value="${userName}" class="form-control" required>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="password">Password:</label>
                                    <input type="password" id="password" name="password" class="form-control" required>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="confirmPassword">Confirm Password: <span class="text-danger">${alertPassword}</span></label>
                                    <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="email">Email: <span class="text-danger">${alertEmail}</span></label>
                                    <input type="email" id="email" name="email" value="${email}" class="form-control" required>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="phoneNum">Phone Number: <span class="text-danger">${alertPhone}</span></label>
                                    <input type="text" id="phoneNum" name="phoneNum" value="${phoneNumber}" class="form-control" required>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <div class="gender-radio">
                                        <label>Gender: </label>
                                        <label>
                                            <input type="radio" name="gender" value="true" checked=""> Male
                                        </label>
                                        <label>                                      
                                            <input type="radio" name="gender" value="false"> Female
                                        </label>
                                    </div>
                                    <button type="submit" class="btn btn-success ">Sign Up</button>
                                </div>
                            </form>
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
