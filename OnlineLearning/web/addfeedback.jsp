<%-- 
    Document   : addfeedback
    Created on : Feb 13, 2023, 11:18:54 AM
    Author     : Trang
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html lang="en">
        <head>
            <meta charset="UTF-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <!-- icon -->
            <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/favicon.ico" type="image/x-icon">
            <!-- link Fonts -->
            <link
                href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
                rel="stylesheet"
                />
            <!--BOOTSTRAP5-->
            <link
                href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
                rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous"
                />
            <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/css/slidebar.css">
        <link rel="stylesheet" type="text/css" href="assets/css/courselist.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
            <title>Add Feedback</title>

            <style>
                .rating {
                    display: inline-block;
                    position: relative;
                    height: 50px;
                    line-height: 50px;
                    font-size: 50px;
                }

                .rating label {
                    position: absolute;
                    top: 0;
                    left: 0;
                    height: 100%;
                    cursor: pointer;
                }

                .rating label:last-child {
                    position: static;
                }

                .rating label:nth-child(1) {
                    z-index: 5;
                }

                .rating label:nth-child(2) {
                    z-index: 4;
                }

                .rating label:nth-child(3) {
                    z-index: 3;
                }

                .rating label:nth-child(4) {
                    z-index: 2;
                }

                .rating label:nth-child(5) {
                    z-index: 1;
                }

                .rating label input {
                    position: absolute;
                    top: 0;
                    left: 0;
                    opacity: 0;
                }

                .rating label .icon {
                    float: left;
                    color: transparent;
                }

                .rating label:last-child .icon {
                    color: #000;
                }

                .rating:not(:hover) label input:checked ~ .icon,
                .rating:hover label:hover input ~ .icon {
                    color: #fcc603;
                }

                .rating label input:focus:not(:checked) ~ .icon:last-child {
                    color: #000;
                    text-shadow: 0 0 5px #09f;
                }
            </style>
            <script>
                let starValue = 0;
                /* for star rating */
                function starChange(value) {
                    console.log('New star rating: ' + value);
                    starValue = value;
                }

                /* for submit feedback */
                function submitFeedback() {
                    document.getElementById('star-value').value = starValue;
                    document.getElementById('submit-feedback').submit();
                }

            </script>
        </head>
        <body>
        <%@ include file="header.jsp" %>

            <!-- Start Banner Area -->
            <section class="banner-area organic-breadcrumb">
                <div class="container">
                    <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                        <div class="col-first">
                            <nav class="d-flex align-items-center">
                                Add feedback
                            </nav>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End Banner Area -->

            <div class="container">

                <div class="row mt-3">

                    <div class="col-md-7">
                        <div class="card">
                            <div class="feedback-form mt-5 mb-5 ml-5 mr-5">

                                <div class="header">
                                    <h3 class="text-dark">Add feedback for product</h3>
                                </div>

                                <div class="star-rating">
                                    <form class="rating">
                                        <label>
                                            <input type="radio" name="stars" value="1" onclick="starChange(this.value)"/>
                                            <span class="icon">★</span>
                                        </label>
                                        <label>
                                            <input type="radio" name="stars" value="2" onclick="starChange(this.value)"/>
                                            <span class="icon">★</span>
                                            <span class="icon">★</span>
                                        </label>
                                        <label>
                                            <input type="radio" name="stars" value="3" onclick="starChange(this.value)"/>
                                            <span class="icon">★</span>
                                            <span class="icon">★</span>
                                            <span class="icon">★</span>   
                                        </label>
                                        <label>
                                            <input type="radio" name="stars" value="4" onclick="starChange(this.value)"/>
                                            <span class="icon">★</span>
                                            <span class="icon">★</span>
                                            <span class="icon">★</span>
                                            <span class="icon">★</span>
                                        </label>
                                        <label>
                                            <input type="radio" name="stars" value="5" onclick="starChange(this.value)"/>
                                            <span class="icon">★</span>
                                            <span class="icon">★</span>
                                            <span class="icon">★</span>
                                            <span class="icon">★</span>
                                            <span class="icon">★</span>
                                        </label>
                                    </form>
                                </div>


                                <div class="feedback-text">
                                    <form action="<%=request.getContextPath()%>/addfeedback" id="submit-feedback" method="POST" onsubmit="submitFeedback()" >                                    
                                        <label for="feedback-text" class="form-label">Your Feedback: </label>
                                        <textarea name="feedback-text" class="form-control" id="feedback-text" rows="5" maxlength="300" placeholder="Tối đa 300 kí tự "></textarea>
                                        <input type="hidden" id="star-value" name="star-value">                                        
                                        <input type="hidden" id="productID" name="productID" value="${product.getProductID()}">
                                       <button type="submit" class="btn btn-success mt-5">Submit</button>                                
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>                            
            </div>

            <!--Start footer-->
                    <%@ include file="footer.jsp" %>

            <!--End footer-->

       <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
            <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"
            ></script>
        </body>



    </html>

