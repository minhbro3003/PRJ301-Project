<%-- 
    Document   : timetable
    Created on : Mar 2, 2024, 5:01:32 PM
    Author     : PC
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TimeTable Page</title>
        <style>
            body{
                font-family: Arial, sans-serif;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            th {
                background-color: #6b90da;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            a {
                text-decoration: none;
            }
            h4{
                text-align: center;
            }
            .breadcrumb {
                padding: 12px 15px;
                margin-bottom: 20px;
                list-style: none;
                background-color: bisque;
                ;
                border-radius: 4px;
            }
        </style>
    </head>
    <body>
        <ol class="breadcrumb">
            <li style="float: left;"><a href="/My_Project/index.html">Home</a>&nbsp;|&nbsp;<b>View Schedule</b></li>
            <li style="float: right; "><a style="color: #198754" href="/My_Project/logout">Logout</a></li>
            <div style="clear: both;"></div>
        </ol>
        <div>
            <div style="display: flex; ">
                <h4 style="font-weight: bold; margin-top: 0;">Note: </h4>
                <span> These activities do not include extra-curriculum activities, such as club activities ...</span>
            </div>
            <div style="display: flex;">
                <h4 style="font-weight: bold; margin-top: 0;">Chú thích: </h4>
                <span> Các hoạt động trong bảng dưới không bao gồm hoạt động ngoại khóa, ví dụ như hoạt động câu lạc bộ ...</span>
            </div>
            Các phòng bắt đầu bằng AL thuộc tòa nhà Alpha. VD: AL...<br>
            Các phòng bắt đầu bằng BE thuộc tòa nhà Beta. VD: BE,..<br>
            Các phòng bắt đầu bằng G thuộc tòa nhà Gamma. VD: G201,...<br>
            Các phòng tập bằng đầu bằng R thuộc khu vực sân tập Vovinam.<br>
            Các phòng bắt đầu bằng DE thuộc tòa nhà Delta. VD: DE,..<br>
            Little UK (LUK) thuộc tầng 5 tòa nhà Delta
        </div>
        <form action="timetable" method="GET">  
            <h4> 
                Campus: FU-HL <br>
                Lecturer: <input type="text" value="${requestScope.lid}" name="id"/> 
                <input type="submit" value="View"/> <br></h4>        

            <table border="1px">
                <tr>
                    <th>                            
                        From: <input type="date" name="from" value="${requestScope.from}"/> <br>
                        To:   <input type="date" name="to" value="${requestScope.to}"/>                    
                    </th>
                    <c:set var="defaultLocale" value="en_US" scope="page" />
                    <fmt:setLocale value="${defaultLocale}" />
                    <fmt:setBundle basename="yourResourceBundle" />

                    <c:forEach items="${requestScope.dates}" var="d">
                        <th>
                            <fmt:formatDate pattern="E" value="${d}" /><br>
                            ${d}
                        </th>
                    </c:forEach>
                </tr>
                <c:forEach items="${requestScope.slots}" var="slot">
                    <tr>
                        <td>${slot.name}</td> 
                        <c:forEach items="${requestScope.dates}" var="d"> 
                            <td>
                                <c:forEach items="${requestScope.lessions}" var="les">
                                    <c:if test="${les.date eq d and les.slot.id eq slot.id}">
                                         ${les.group.subject.name} <br> at
                                            ${les.group.name} 
                                        <br>
                                        <c:if test="${les.attended}">(<span style="color: rgb(0, 128, 0)">attended</span>) </c:if>
                                        <c:if test="${!les.attended}">(<span style="color: red">Not Yet</span>)</c:if>
                                            <br>
                                            <a href="attendance?id=${les.id}">
                                            <c:if test="${les.attended}">Edit</c:if>
                                            <c:if test="${!les.attended}">Take</c:if>
                                            </a>
                                    </c:if>
                                </c:forEach>
                            </td>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </table>
        </form>

        <br>                
        <script>
            function goToHomePage() {
                window.location.href = "index.html";
            }
        </script>
    </body>
</html>
