<%-- 
    Document   : homepage
    Created on : May 16, 2023, 11:48:04 PM
    Author     : quang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@page import = "DAO.*" %>
<%@page import = "model.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Homepage</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/logo.png">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/css/detective.css">
        <link rel="stylesheet" href="assets/css/slidebar.css">
        <link rel="stylesheet" href="assets/css/hot.css">
        <link rel="stylesheet" href="assets/css/flag.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
        <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    </head>

</head>
<%            
    if(request.getSession().getAttribute("user")==null){
               request.getSession().setAttribute("roleName", "guest");
        }
        CourseDAO dao = new CourseDAO();
    List<Course> listfeatureCourses = dao.getCourses();
        
%>
<body class="vh-100">
    <%@include file="header.jsp" %>
</body>   
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active d-flex justify-content-center align-items-center" style="margin-top: 40px;">
            <a href="coursedetail?courseid=7">
                <img src="assets/img/english.png" class="d-block w-60" alt="">
            </a>
            <div class="carousel-caption d-none d-md-block">
            </div>
        </div>
        <div class="carousel-item d-flex justify-content-center align-items-center" style="margin-top: 40px;">
            <a href="coursedetail?courseid=6">
                <img src="assets/img/literature.png" class="d-block w-60" alt="">
            </a>
            <div class="carousel-caption d-none d-md-block">
            </div>
        </div>
        <div class="carousel-item d-flex justify-content-center align-items-center" style="margin-top: 40px;">
            <a href="coursedetail?courseid=2">
                <img src="assets/img/chem.png" class="d-block w-60" alt="">
            </a>
            <div class="carousel-caption d-none d-md-block">
            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
        <span class="carousel-control-prev-icon custom-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
        <span class="carousel-control-next-icon custom-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>




<!--    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active d-flex justify-content-center align-items-center" style="margin-top: 40px;">
                <a href="coursedetail?courseid=7" target="_self">
                <img src="assets/img/Eng.png" class="d-block w-50" alt="">
                 </a>
                <div class="carousel-caption d-none d-md-block">
                </div>
            </div>
            <div class="carousel-item d-flex justify-content-center align-items-center" style="margin-top: 40px;">
                <a href="coursedetail?courseid=6" target="_self">
                <img src="assets/img/psychology.png" class="d-block w-50" alt="">
                 </a>
                <div class="carousel-caption d-none d-md-block" >
                </div>
            </div>
            <div class="carousel-item d-flex justify-content-center align-items-center" style="margin-top: 40px;">
                <a href="coursedetail?courseid=2" target="_self">
                <img src="assets/img/hoahoc.jpg" class="d-block w-50" alt="">
                 </a>
                <div class="carousel-caption d-none d-md-block">
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
            <span class="carousel-control-prev-icon custom-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
            <span class="carousel-control-next-icon custom-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </button>
    </div>-->

<section class="category-area mb-4">
    <div class="row text-center mb-3">
        <h1 style="margin-top: 200px; margin-bottom: -70px;">Hot Posts</h1>
    </div>              
    <div class="container d-flex align-items-center justify-content-center" style="height: 100vh;">
        <div class="row justify-content-center">
            <div class="col-lg-4 col-md-4 d-flex flex-column align-items-center justify-content-center">
                <img src="assets/img/sachli.png" alt="Image 1" class="img-fluid zoom-image">
                <h4 class="text-center mt-1">PhysicsCourse</h4>
                <h5 class="text-center mt-1" style="margin-bottom: 10px;">Published on March 1</h5>
                <a href="coursedetail?courseid=3" class="btn btn-primary mt-1">View Details</a>
            </div>

            <div class="col-lg-4 col-md-4 d-flex flex-column align-items-center justify-content-center">
                <img src="assets/img/sachsinh.png" alt="Image 2" class="img-fluid zoom-image">
                <h4 class="text-center mt-1">BiologyCourse</h4>
                <h5 class="text-center mt-1">Published on May 30</h5>
                <a href="coursedetail?courseid=5" class="btn btn-primary mt-1">View Details</a>                  
            </div>
            <div class="col-lg-4 col-md-4 d-flex flex-column align-items-center justify-content-center">
                <img src="assets/img/sachnhac.png" alt="Image 3" class="img-fluid zoom-image">
                <h4 class="text-center mt-1">MusicCourse</h4>
                <h5 class="text-center mt-1">Published on April 23</h5>
                <a href="coursedetail?courseid=4" class="btn btn-primary mt-1">View Details</a>

            </div>
        </div>

    </div>
    <div style="display: flex; justify-content: center;">
        <div class="center mt-1" style="transform: scale(2); margin-bottom: 10px;">
            <span class="flag-icon" style="margin-top: 50px;">🚩</span>
            <span class="flag-text" style="margin-top: 50px;">Feature Course</span>
        </div>
    </div>

            <div class="container d-flex justify-content-center" style="margin-top: 10px;">
                <div class="slider">
                    <c:forEach items="${listfeaturCourses}" var="course" varStatus="loop">
                        <c:if test="${course.getFeatureflag() eq 1}">
                            <div class=" d-flex justify-content-center">
                                <div class="text-center justify-content-center">
                                    <img src="${course.image}" alt="Course Image" class="image-half-width">
                                    <h1 class="text-center">${course.courseName}</h1>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

            </div>






</section>


<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">

</script>
<script>
    $(document).ready(function () {
        $('.slider').slick({
            dots: true,
            infinite: true,
            speed: 500,
            slidesToShow: 1,
            slidesToScroll: 1
        });
    });
</script>
<%@include file="footer.jsp" %>
</html>
