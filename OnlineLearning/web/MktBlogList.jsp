<%-- 
    Document   : ListBlog
    Created on : May 22, 2023, 4:56:25 PM
    Author     : DAT
--%>
<%@ page import="model.Blog, java.util.List, java.util.ArrayList" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.DAOBlog"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>List Blog</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/MktBlogList.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        <script type="text/javascript" src="javascript/sort.js"></script>
        <link rel="stylesheet" type="text/css" href="assets/css/bloglist.css">


    </head>
    <body>

        <%@include file="header.jsp" %>
        <div class="navbar1">
            <div class="container3">
                <span class="navbar1-brand"><a href="home">Home</a></span>
                <span class="navbar1-brand-divider ">/</span>
                <span class="navbar1-brand"><a href="bloglist?user-Roleid=5">List Blog</a></span>
            </div>
        </div>
        <div class="container3" >
            <div class="row">
                <div class="col-sm-3">
                    <div class="card bg-light mb-3">
                        <div class="sidebar">
                            <div class="search-box">
                                <form action="search" method="get">
                                    <input type="text" name="txt" placeholder="Search...">
                                    <input type="hidden" name="user-Roleid" value="5">
                                    <button type="submit">Search</button>
                                </form>
                            </div>
                            <div class="widget">
                                <h2 class="widget-title" >Catergory</h2>
                                <ul  style=" list-style: none;
                                     text-decoration: none" >
                                    <c:forEach items="${list1}" var="o">
                                        <li class="${tag==o.cid ? "active":""}"  ><a style=" text-decoration: none" href="catogory?cid=${o.cid}&user-Roleid=5">${o.cname}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>
                            <div class="widgetre" style="">
                                <h2 class="widget-title">Funtion</h2>
                                <ul style=" margin: 10px; padding: 10px; display:flex" >
                                    <a style="text-decoration: none; border: 1px solid black; border-radius: 5px;" href="bloglist?sortOrder=ASC&user-Roleid=5">Sort A-Z</a>
                                    <a style="text-decoration: none; border: 1px solid black; border-radius: 5px;" href="bloglist?sortOrder=DESC&user-Roleid=5">Sort Z-A</a>
                                    <a style="text-decoration: none; border: 1px solid black; border-radius: 5px;" href="bloglist?sortOrder=CreateDESC&user-Roleid=5">Sort New Blog</a>
                                    <a style="text-decoration: none; border: 1px solid black; border-radius: 5px;" href="bloglist?sortOrder=CreateASC&user-Roleid=5">Sort Old Blog</a>
                                </ul>
                            </div>
                        </div>    
                    </div>
                    <div class="card bg-light mb-3">
                        <div class="last">

                            <h2 class="widget-title" style="margin:0px 70px" >Last Post</h2>

                            <div class="card-body">
                                <img src="${last.image}" alt="Post thumbnail">
                                <h2><a style=" text-decoration: none" href="detail?bid=${last.blogid}" title="View Post">${last.title}</a></h2>
                                <p style="font-size: 10px;">${last.briefInfor}</p>
                            </div>
                        </div>
                    </div>
                    <div class="card bg-light mb-3">
                        <div class="last">

                            <h2 class="widget-title" style="margin:0px 70px" >Feature Post</h2>
                             <c:forEach items="${FlagBlog}" var="o">
                            <div class="card-body">
                                <img src="${o.image}" alt="Post thumbnail">
                                <h2><a style=" text-decoration: none" href="detail?bid=${o.blogid}" title="View Post">${o.title}</a></h2>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-sm-9">
                    <div class="row">
                        <c:forEach items="${listP}" var="o">
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="posts">

                                    <div class="post">
                                        <a href="#">
                                            <img src="${o.image}" alt="Post thumbnail">
                                            <h2><a style=" text-decoration: none" href="detail?bid=${o.blogid}" title="View Blog">${o.title}</a></h2>
                                            <p>${o.briefInfor}</p>
                                            <a class="button" href="detail?bid=${o.blogid}&user-Roleid=5">Edit Information</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div> 
                <div class="page-patri"style="text-align: center;" >
                    <c:set var="page" value="${requestScope.page}"/>
                    <div class="pagination" style="display: inline-block; ">
                        <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                            <a  href="bloglist?page=${i}&user-Roleid=5">${i}</a>
                        </c:forEach>
                    </div>
                </div>            
            </div>  
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
