<%-- 
Document   : header
Created on : May 15, 2023, 11:35:59 PM
Author     : quang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%> 
<%@page import="DAO.*"%> 

<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="assets/css/header.css"/>
    <body >
        <!-- Header -->
        <nav class="navbar navbar-expand-lg navbar-light shadow header">
            <div class="container d-flex justify-content-between align-items-center">

                <a class="logo-container navbar-brand h1 align-self-center" href="home">
                    <img src="assets/img/logo.png" alt="logo""/>
                </a>

                <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                    <div class="flex-fill">
                        <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto col-8">
                            <li class="nav-item">
                                <a class="nav-link" href="home">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="bloglist">Blog</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Contact</a>
                            </li>
                            <c:set var="roleName" value="${sessionScope.roleName}"></c:set>

                            <c:if test="${roleName.equals('guest')}">
                                <li class="nav-item">
                                    <a class="nav-link" href="course">Courses</a>
                                </li>
                            </c:if>

                            <c:if test="${roleName.equals('customer')}">
                                <li class="nav-item">
                                    <a class="nav-link" href="course">Courses</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="myregistation?user-id=${user.getId()}">My Registrations</a>
                                </li>
                            </c:if>


                            <c:if test="${roleName.equals('marketer')}">
                                <li class="nav-item">
                                    <a class="nav-link" href="PostsList.jsp">Posts List</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="sellerdashboard.jsp">Dashboard</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="bloglist?user-Roleid=${user.getRoleId()}">Edit Post</a>
                                </li>

                            </c:if>

                            <c:if test="${roleName.equals('seller')}">
                                <li class="nav-item">
                                    <a class="nav-link" href="RegistrationsList.jsp">Registrations List</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="sellerdashboard.jsp">Dashboard</a>
                                </li>
                            </c:if>

                            <c:if test="${roleName.equals('expert')}">
                                <li class="nav-item">
                                    <a class="nav-link" href="sublist?page=1">Subjects List</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="QuestionsList.jsp">Questions List</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="ExpertDashboard.jsp">Dashboard</a>
                                </li>
                            </c:if>

                            <c:if test="${roleName.equals('admin')}">
                                <li class="nav-item">
                                    <a class="nav-link" href="sublist">Subjects List</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="QuestionsList.jsp">Questions List</a>
                                </li>
                            </c:if>


                            <c:if test="${sessionScope.user == null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="login.jsp">Log in</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="signup.jsp">Sign up</a>
                                </li>
                            </c:if>
                        </ul>

                    </div>
                    <div class="navbar align-self-center d-flex">
                        <c:if test="${sessionScope.user != null}">
                            <a class="nav-link" href="logout">Log Out</a>
                            <div class="m-auto">Hello ${user.getFullName()}</div>
                            <div class="profile-pic">
                                <c:if test="${sessionScope.user.getGender()}">
                                    <a href="userprofile.jsp"><img src="assets/img/man.png"/></a>
                                    </c:if>
                                    <c:if test="${!sessionScope.user.getGender()}">
                                    <a href="userprofile.jsp"><img src="assets/img/woman.png"/></a>
                                    </c:if>
                            </div>
                        </c:if>

                    </div>
                    <div>
                        <%@include file="menu.jsp" %>
                    </div>
                </div>
        </nav>
        <!-- Close Header -->
    </body>
