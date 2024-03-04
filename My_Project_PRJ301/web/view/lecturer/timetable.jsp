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
        </style>
    </head>
    <body>
        <form action="timetable" method="GET">
            <input type="hidden" value="${param.id}" name="id"/>
            From: <input type="date" name="from" value="${requestScope.from}"/> To:
            <input type="date" name="to" value="${requestScope.to}"/>
            <input type="submit" value="View"/>
        </form>
        <table border="1px">
            <tr>
                <th>   Time Slot      </th>
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
                                    ${les.group.name} 
                                    <br> <a href="attendance?id=${les.id}">Take</a>
                                    <br> (Not Yet)
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
