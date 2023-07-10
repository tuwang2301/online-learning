<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%> 
<%@page import="DAO.*"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/menu.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

    <header class="floating-header">
        <div class="floating-menu-btn">
            <div class="floating-menu-toggle-wrap">
                <div class="floating-menu-toggle">
                    <span class="bar"></span>
                    <span class="bar"></span>
                    <span class="bar"></span>
                </div>
            </div>
        </div>

        <div class="main-navigation-wrap">
            <nav class="main-navigation" data-back-btn-text="Back">
                <ul class="menu">
                    <c:if test="${sessionScope.user != null}">
                        <li class="menu-item-has-children current-menu-item delay-0">
                            <a href="#"><i class="fa fa-arrow-right" aria-hidden="true"></i>More Options</a>
                            <ul class="sub-menu">
                                <li class="current-menu-item"><a href="userprofile.jsp">My Profile</a></li>
                                <li><a href="logout">Log out</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <li class="delay-1"><a href="home">Home</a></li>
                    <li class="delay-2"><a href="bloglist">Blog</a></li>
                        <c:if test="${sessionScope.user == null}">
                        <li class="delay-3"><a href="course">Courses</a></li>
                        <li class="delay-4"><a href="login.jsp">Log in</a></li>
                        <li class="delay-5"><a href="signup.jsp">Sign up</a></li>
                        </c:if>
                        <c:set var="roleName" value="${sessionScope.roleName}"></c:set>
                        <c:if test="${roleName.equals('customer')}">
                        <li class="delay-3">
                            <a class="nav-link" href="course">Courses</a>
                        </li>
                        <li class="delay-4">
                            <a class="nav-link" href="MyRegistrations.jsp">My Registrations</a>
                        </li>
                    </c:if>


                    <c:if test="${roleName.equals('marketer')}">
                        <li class="delay-3">
                            <a class="nav-link" href="PostsList.jsp">Posts List</a>
                        </li>
                        <li class="delay-4">
                            <a class="nav-link" href="sellerdashboard.jsp">Dashboard</a>
                        </li>
                    </c:if>


                    <c:if test="${roleName.equals('seller')}">
                        <li class="delay-3">
                            <a class="nav-link" href="RegistrationsList.jsp">Registrations List</a>
                        </li>
                        <li class="delay-4">
                            <a class="nav-link" href="sellerdashboard.jsp">Dashboard</a>
                        </li>
                    </c:if>


                    <c:if test="${roleName.equals('expert')}">
                        <li class="delay-3">
                            <a class="nav-link" href="SubjectsList.jsp">Subjects List</a>
                        </li>
                        <li class="delay-4">
                            <a class="nav-link" href="QuestionsList.jsp">Questions List</a>
                        </li>
                        <li class="delay-4">
                            <a class="nav-link" href="sellerdashboard.jsp">Dashboard</a>
                        </li>
                    </c:if>

                    <c:if test="${roleName.equals('admin')}">
                        <li class="delay-3">
                            <a class="nav-link" href="SubjectsList.jsp">Subjects List</a>
                        </li>
                        <li class="delay-4">
                            <a class="nav-link" href="QuestionsList.jsp">Questions List</a>
                        </li>
                        <li class="delay-5">
                            <a class="nav-link" href="admindashboard.jsp">Dashboard</a>
                        </li>
                        <li class="delay-6">
                            <a class="nav-link" href="UsersList.jsp">Users List</a>
                        </li>
                        <li class="delay-7">
                            <a class="nav-link" href="SettingsList.jsp">Settings List</a>
                        </li>
                    </c:if>
                   
                </ul><!-- .menu -->
            </nav><!-- .main-navigation -->
        </div><!-- .main-navigation-wrap -->
    </header>
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/menu.js"></script>
</html>
