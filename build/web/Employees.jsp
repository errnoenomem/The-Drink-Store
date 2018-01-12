<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<!DOCTYPE html>
<html>
    <head>
        <title>About Us</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="resource/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
        <link href="resource/bootstrap/css/font-awesome.min.css" rel="stylesheet">
        <script src="resource/bootstrap/js/jquery-3.2.1.js"></script>
        <script src="resource/bootstrap/js/bootstrap.min.js"></script>

        <link href="resource/css/main.css" rel="stylesheet">
        <script src="resource/js/ajax.js"></script>
    </head>
    <body>

        <sql:setDataSource
            var="myDS"
            driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/cse305"
            user="root" password="password"
            />

        <sql:query var="listEmployees"   dataSource="${myDS}">
            SELECT * FROM Employee;
        </sql:query>

        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp">Drink Store™</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="Inventory.jsp">Inventory</a></li>
                    <li><a href="Reviews.jsp">Reviews</a></li>
                    <li><a href="Employees.jsp">About Us</a></li>
                </ul>
            </div>
        </nav>

        <div class="container mission">
            <h3>Mission</h3>
            <p> To sell drinks at very fair prices all over the US </p>
        </div>

        <div class="container content"> 
            <h3>Employees</h3>
            <form id="content-form" action="" method="post" >
                <table> 
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Title</th>
                    </tr>
                    <c:forEach var="employee" items="${listEmployees.rows}">
                        <tr>
                            <td> <c:out value="${employee.EmployeeID}" /> </td>
                            <td> <c:out value="${employee.Name}" /></td>
                            <td> <c:out value="${employee.Title}" /></td>
                        </tr>
                    </c:forEach>
                </table>
            </form>
        </div>

    </body>
</html>
