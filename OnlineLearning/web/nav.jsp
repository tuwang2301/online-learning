<%-- 
    Document   : nav
    Created on : Jun 5, 2023, 4:54:56 PM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="#"></a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>

    <a class="nav-link" href="home">Home</a>
    <a class="nav-link" href="logout">Logout</a>
    
    <!-- Navbar Search-->
    <form action="user?action=search" method="post" class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">


    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">

        <li class="nav-item dropdown">
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <c:if test="${sessionScope.Account != null}">
                    <li><a class="dropdown-item" href="logout">Logout</a></li>
                    </c:if>
            </ul>
        </li>
    </ul>
</nav>
