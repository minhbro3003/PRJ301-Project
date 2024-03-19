<%-- 
    Document   : viewattendance
    Created on : Mar 19, 2024, 11:51:10 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <ol class="breadcrumb">
            <li style="float: left;"><a href="/My_Project/index.html">Home</a>&nbsp;|&nbsp;<b>View Schedule</b></li>
            <li style="float: right; "><a style="color: #198754" href="/My_Project/logout">Logout</a></li>
            <div style="clear: both;"></div>
        </ol>
        <c:set var="id" value="0"/>
        <form action="viewatt" method="POST">
            <input type="hidden" name="id" value="${param.id}" />
            <table border="1px">
                <tr>
                    <td>NO</td>
                    <td>NAME</td>
                    <td>STATUS</td>
                    <td>COMMENT</td>                   
                    <td>TAKER</td>
                    <td>RECORD TIME</td>
                </tr> 
                <c:forEach items="${requestScope.atts}" var="a">
                    <tr>
                        <td><c:set var="id" value="${(id+1)}"/>${id}</td>
                        <td>${a.student.name}</td>
                        <td>
                            <c:if test="${a.isPresent}">
                                <p style="color: green">Present</p>
                            </c:if>
                                <c:if test="${!a.isPresent}">
                                <p style="color: red">Absent</p>
                            </c:if>
                        </td>
                        <td>
                            <input type="text" name="description${a.student.id}" value="${a.description}"/>
                        </td>                    
                        <td style="color: peru">${a.lession.lecturer.id}</td>
                        <td>${a.time}</td>
                    </tr>    
                </c:forEach>
            </table>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
