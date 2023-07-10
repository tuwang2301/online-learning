<%-- 
    Document   : test
    Created on : Jun 22, 2023, 12:44:15 AM
    Author     : dell
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="addsubject"method ="post" enctype='multipart/form-data'>
            <input name="content" type="text">
            <textarea name="Description" class="form-control" id="Description" rows="5" placeholder="Write product description here"></textarea>
            <input type="text" name="price" class="form-control" step="0.01" min="0" onkeypress="return isNumber(event)">
            <select class="form-select active" name="status">
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
                
                
                <input type="file" name="avatar"><br>
                
                
                
            <select name="cat">
               
                <option value="" disabled selected hidden>choose category</option>
                <c:forEach items="${requestScope.listCatergory}" var="l">                                              
                    <option value="${l.getCatergoryId()}">${l.getCatergoryName()}</option>
                </c:forEach>

            </select>
            <select id="featured" name="featureflag" class="form-control">
                <option value="0">0</option>
                <option value="1">1</option>
            </select>
            <input type="submit" class="btn btn-success" value="Save">
        </form>
    </body>
</html>
