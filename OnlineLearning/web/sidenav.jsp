

    Document   : sidenav
    Created on : Jun 5, 2023, 4:54:49 PM
    Author     : dell
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">Core</div>
                <c:if test="${sessionScope.user.getRoleId() == 3}">
                    <a class="nav-link" href="admindashboard.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Dashboard
                    </a>
                    <a class="nav-link" href="userlist.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                        Manager User
                    </a>
                    <a class="nav-link" href="sublist">
                        <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                        Manage Subject
                    </a>
                    <a class="nav-link" href="ListPrice.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                        Manage Price
                    </a>  
                </c:if>
                
                
                <c:if test="${sessionScope.user.getRoleId() == 4}">
                    <a class="nav-link" href="ExpertDashboard.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Dashboard
                    </a>                   
                    <a class="nav-link" href="sublist">
                        <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                        Manage Subject
                    </a>
                    <a class="nav-link" href="ListPrice.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                        Manage Price
                    </a>  
                </c:if>

                <c:if test="${sessionScope.user.getRoleId() == 2}">
                    <a class="nav-link" href="Listsubject.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-dashboard"></i></div>
                        Manager Subject
                    </a>
                    <a class="nav-link" href="SubjectDimension.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-dashboard"></i></div>
                        Subject Dimension
                    </a>
                    <a class="nav-link" href="ListPrice.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-dashboard"></i></div>
                        Price 
                    </a>
                </c:if>

            </div>
        </div>

    </nav>
</div>
