<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        
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
