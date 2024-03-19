<%-- 
    Document   : attendance
    Created on : Mar 2, 2024, 3:54:16 PM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 10px;
                display: flex;
                flex-wrap: wrap;

            }

            form {
                background-color: #ffffff;
                padding: 0px 10px 0px 10px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 100%;
                height: 100%;
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

            input[type="radio"] {
                margin-right: 5px;
            }

            h5 {
                margin: 0;
                padding: 0;
                display: inline;
            }

            input[type="text"] {
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            input[type="submit"] {
                background-color: #4caf50;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 15px;
                margin-top: 10px;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }
            .breadcrumb {
                padding: 12px 15px;
                margin-bottom: 20px;
                list-style: none;
                background-color: bisque;
                width: 100%;
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
        <form action="logout" method="POST">
            
            <input type="submit" value="Logout"/>
        </form>
        <c:set var="id" value="0"/>
        <form action="attendance" method="POST">
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
                            <input type="radio" 
                                   ${!a.present?"checked=\"checked\"":""}
                                   name="present${a.student.id}" value="no"/> <h5 style="color: red">Absent</h5> 
                            <input type="radio" 
                                   ${a.present?"checked=\"checked\"":""}
                                   name="present${a.student.id}" value="yes"/> <h5 style="color: green">Present</h5>
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
