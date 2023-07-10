<%-- 
    Document   : BlogDetail
    Created on : May 17, 2023, 4:32:41 PM
    Author     : DAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <title>Marketing Blog Detail</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">

        <link rel="stylesheet" type="text/css" href="assets/css/blogdetail.css">
        <link rel="stylesheet" type="text/css" href="assets/css/MktBlogDetail.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="assets/js/MktBlogDetail.js"></script>

        <% String bid = request.getParameter("bid");%>


    </head>
    <body>
        <%@ include file = "header.jsp" %>

        <div class="navbar2">
            <div class="container2">
                <span class="navbar2-brand"><a href="homepage.jsp">Home</a></span>
                <span class="navbar2-brand-divider ">/</span>
                <span class="navbar2-brand"><a href="bloglist?user-Roleid=5">List Blog</a></span>
                <span class="navbar2-brand-divider ">/</span>
                <span class="navbar2-brand">Blog Detail</span>
            </div>
        </div>
        <div class="container1">
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
                <div class="widget">
                    <h2 class="widget-title">Rate</h2>
                    <div class="rating">
                        <input type="radio" id="star1" name="rating" value="1">
                        <label for="star1" title="1 star">&#9733;</label>
                        <input type="radio" id="star2" name="rating" value="2">
                        <label for="star2" title="2 stars">&#9733;</label>
                        <input type="radio" id="star3" name="rating" value="3">
                        <label for="star3" title="3 stars">&#9733;</label>
                        <input type="radio" id="star4" name="rating" value="4">
                        <label for="star4" title="4stars">&#9733;</label>
                        <input type="radio" id="star5" name="rating" value="5" checked>
                        <label for="star5" title="5 stars">&#9733;</label>
                    </div>
                </div>
                <div class="widget">
                    <h2 class="widget-title">Comment</h2>
                    <ul style="list-style: none">
                        <li>bổ ích quá</li>
                        <li>rất thú vị cảm ơn tác giả</li>

                    </ul>
                </div>
                <div class="widget">
                    <div class="last">

                        <h2 class="widget-title"  >Last Post</h2>

                        <div class="card-body">
                            <img src="${last.image}" alt="Post thumbnail">
                            <h2><a style=" text-decoration: none" href="detail?bid=${last.blogid}" title="View Post">${last.title}</a></h2>
                            <p style="font-size: 10px;">${last.briefInfor}</p>
                        </div>


                    </div>
                </div>

            </div>
            <div class="post">
                <form action="editpost?bid=<%=bid%>&anh=${detail.image}" method ="post" enctype="multipart/form-data">
<!--                    <input type="hidden" name="anh" value="${detail.image}" />-->
                    <div class="post-image">
                        <img id="preview" src="${detail.image}" alt="blog">
                    </div>
                    <p style="color: #0066CC;">Edit Image:</p>
                    <input type="file" name="image" accept="image/*" onchange="previewImage(event)"  />
                    <h1>${detail.title}</h1>
                    <p style="color: #0066CC;">Edit title: <input type="text" class="text-box" name="title" value="${detail.title}"/>
                    <p> <strong>Author:</strong> ${detail.author}</p>

                    <p style="color: #0066CC;">Edit Author: <input type="text" class="text-box" name="author" value="${detail.author}"/>

                    <p><strong>Update Date:</strong>${detail.updateDate} </p>

                    <p style="color: #0066CC;">Edit Update Date: <input type="date" name="update-date" value="${detail.updateDate}"/>
                    <p style="color: #0066CC;">Edit Create Date: <input type="date" name="create-date" value="${detail.createDate}"/>


                    <p><strong>Category:</strong> ${Cateid.cname}</p>
                    <p style="color: #0066CC;">Edit Category:</p>
                    <select name="category">
                        <option value="Online Learning Tips">Online Learning Tips</option>
                        <option value="EdTech News">EdTech News</option>
                        <option value="Study Skills">Study Skills</option>
                        <option value="Study Habits">Study Habits</option>
                        <option value="Mobile Learning">Mobile Learning</option>
                        <option value="Online Teaching">Online Teaching</option>
                        <option value="Online Course Reviews">Online Course Reviews</option>
                    </select>
                    <p><strong>Blog Detail:</strong></p>
                    <p>${detail.briefInfor}</p>
                    <p style="color: #0066CC;">Edit Detail: <textarea name="blog-detail" class="text-box" style="width: 100%; height: auto;">${detail.briefInfor}</textarea></p>
                    <span class="flag-icon">🚩</span> <span class="flag-text">Feature Blog</span>
                    <select name="flag">
                        <option value="false">Off</option>
                        <option value="true">On</option>
                    </select>
                    <div class="button-container">
                        <a id="back-button" href="javascript:history.back()">Back</a>
                        <input id="edit-button" type="submit" value="Edit" onclick="return confirm('Are you sure you want to edit the information?')">
                    </div> 
                </form>
                <div class="author">
                    <img src="image/anh-dai-dien-FB-200.jpg" alt="Tác giả">
                    <p><strong>Written by:</strong> ${detail.author}</p>
                    <p><strong>Posted on :</strong> ${detail.createDate}</p>

                </div>

            </div>

        </div>
        <%@include file="footer.jsp" %>

    </body>

</html>
