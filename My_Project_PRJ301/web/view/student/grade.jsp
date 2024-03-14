<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grade Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            form {
                margin: 20px;
            }

            table {
                width: 50%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #4CAF50;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #ddd;
            }

            .total-container {
                margin-top: 20px;
            }
            .breadcrumb {
                margin: 20px;
                padding: 12px 15px;
                margin-bottom: 20px;
                list-style: none;
                background-color: bisque;
                ;
                border-radius: 4px;
            }
        </style>
    <body>
        <ol class="breadcrumb">
            <span><a href="/My_Project/index.html">Home</a>&nbsp;|&nbsp;<b>View Schedule</b></span>
        </ol>
        <form action="grade" method="GET">
            <table>
                <h1 style="color: chocolate">View Grade</h1>

                <thead>
                    <tr>
                        <th>GRADE CATEGORY</th>
                        <th>WEIGHT</th>
                        <th>VALUE</th>
                        <th>COMMENT</th>
                    </tr>
                </thead>
                <c:forEach items="${grades}" var="g">               
                    <tr>
                        <td>${g.exame.assessment.name}</td>
                        <td>${g.exame.assessment.weight}</td>
                        <td>${g.score}</td>
                        <td>${g.exame.assessment.comment}</td>
                    </tr>
                </c:forEach>  
            </table>

            <div class="total-container">
                TOTAL: <!-- Add your total value here -->
            </div>
        </form>
        
        
    </body>
</html>
