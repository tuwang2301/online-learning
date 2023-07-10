<%-- 
    Document   : AddNewSubject
    Created on : Jun 18, 2023, 8:59:23 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import = "java.util.*" %>
<%@page import = "DAO.*" %>
<%@page import = "model.*" %>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

        <title>Add</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="<%=request.getContextPath()%>/css/managerproduct.css" rel="stylesheet" type="text/css"/>

        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>



    <body class="sb-nav-fixed">

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">


                        <form action="addsubject" method="post" enctype='multipart/form-data' >  

                            <div class="modal-header">						
                                <h3 class="text-warning">New Subject</h3>
                            </div>
                            <div class="modal-body">	


                                <div class="form-group">
                                    <label>Course Name</label>
                                    <input name="content" type="text" required="">
                                </div>    

                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="Description" class="form-control" id="Description" rows="5" placeholder="Write product description here" required=""></textarea>
                                </div>

                                <div class="form-group">
                                    <label for="price">Price:</label>
                                    <input type="text" name="price" class="form-control" step="0.01" min="0" onkeypress="return isNumber(event)" required="">
                                </div>


                                <div class="post_tag">
                                    <h4>
                                        <select class="form-select active" name="status" required>
                                            <option value="0"hidden>Status</option>
                                            <c:set var="trueValueRendered" value="false" />
                                            <c:set var="falseValueRendered" value="false" />


                                            <c:forEach items="${coursestatus}" var="s">
                                                <c:if test="${s.isStatus() && trueValueRendered eq 'false'}">
                                                    <option value="${s.Status()}">${s.Status()}</option>
                                                    <c:set var="trueValueRendered" value="true" />
                                                </c:if>
                                                <c:if test="${!s.isStatus() && falseValueRendered eq 'false'}">
                                                    <option value="${s.Status()}">${s.Status()}</option>
                                                    <c:set var="falseValueRendered" value="true" />
                                                </c:if>
                                            </c:forEach>
                                        </select>


                                    </h4>
                                </div>        

                                <div class="form-group">         
                                    <label for="avatar">Image</label>
                                    <input type="file" name="avatar" required ><br>
                                </div>

                                <div class="post_tag">
                                    <h4>
                                        <select name="cat" required="">
                                            <option value="" disabled selected hidden>choose category</option>
                                            <c:forEach items="${listCatergory}" var="l">                                              
                                                <option value="${l.getCatergoryId()}">${l.getCatergoryName()}</option>
                                            </c:forEach>

                                        </select>

                                    </h4>
                                </div>

                                <div class="form-group" >
                                    <label for="featured">Featured flag:</label>
                                    <select id="featured" name="featureflag" class="form-control" required>

                                        <option value="0">0</option>
                                        <option value="1">1</option>

                                    </select>
                                </div>                            





                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Save" onclick="showSuccessMessage()">
                                <button type="button" class="btn btn-light"><a href="sublist">Back</a></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>


        <script src="<%=request.getContextPath()%>/js/manager.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script>
                                        function isNumber(evt) {
                                            evt = (evt) ? evt : window.event;
                                            var charCode = (evt.which) ? evt.which : evt.keyCode;
                                            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                                                return false;
                                            }
                                            return true;
                                        }
        </script>

        <script>
            function showSuccessMessage() {
                alert("ADD SUBJECT!");
            }
        </script>
    </body>
</html>
