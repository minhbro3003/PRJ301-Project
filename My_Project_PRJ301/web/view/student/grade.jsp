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

            .breadcrumb {
                margin: 20px;
                padding: 12px 15px;
                margin-bottom: 20px;
                list-style: none;
                background-color: bisque;
                border-radius: 7px;
            }
        </style>
    <body>
        <ol class="breadcrumb">
            <li style="float: left;"><a href="/My_Project/index.html">Home</a>&nbsp;|&nbsp;<b>View Schedule</b></li>
            <li style="float: right; "><a style="color: #198754" href="/My_Project/logout">Logout</a></li>
            <div style="clear: both;"></div>
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
                        <td>${g.exame.assessment.weight} %</td>
                        <td>${g.score}</td>
                        <td>${g.exame.assessment.comment}</td>
                    </tr>
                </c:forEach>  
            </table>
            <table border="1" style="width: 41%">
                <thead>
                    <tr>
                        <th style="padding: 5px">COURSE TOTALAVERAGE</th>
                        <th>9.5</th>

                    </tr>
                </thead>

                <tr>
                    <td>STATUS</td>
                    <td>PASSED</td>

                </tr>

            </table>

            <div style="padding-top: 100px ">
                <br><h1></h1>
                <b>Mọi góp ý, thắc mắc xin liên hệ: </b><span  float: none;">Phòng dịch vụ sinh viên</span>: Email: <a>dichvusinhvien@fe.edu.vn</a>.
                Điện thoại: <span >(024)7308.13.13 </span>
                <br>
            </div>
        </form>
    </body>
</html>
