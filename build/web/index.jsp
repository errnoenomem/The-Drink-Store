<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE HTML>
<html>
    <head>
        <title>Drink Store</title>
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

        <sql:query var="listItems"   dataSource="${myDS}">
            SELECT * FROM Item;
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

        <%
            int var = 1;
        %>

        <div class="container content"> 
            <h3>Our Selection:</h3>
            <form id="content-form" action="" method="post" >
                <table> 
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Availability</th>
                        <th>Seller</th>
                        <th>Quantity</th>
                        <th>Add to cart</th>
                    </tr>
                    <c:forEach var="item" items="${listItems.rows}">
                        <tr>
                            <td> <input type="hidden" value=<c:out value="${item.ArticleID}" /> name=<%out.println("ID" + var);%>/> <c:out value="${item.ArticleID}" /> </td>
                            <td> <c:out value="${item.Name}" /></td>
                            <td> <input type="hidden" value=<c:out value="${item.Price}" /> name=<%out.println("p" + var);%>/> $ <c:out value="${item.Price}" /></td>
                            <td> <input type="hidden" value=<c:out value="${item.Quantity}" /> id=<%out.println("s" + var);%> /> <c:out value="${item.Quantity}" /></td>
                            <td> <c:out value="${item.Seller}" /></td>
                            <td>
                                <input type="number" class="quant" value="1" min="1" name=<%out.println("q" + var);%> id=<%out.println("q" + var);%>/>
                            </td>
                            <td> 
                                <input type="submit" class="addToCart" value="" id="<%out.println(var);%>" name=<%out.println("row" + var++);%> />
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </form>
        </div>

        <div class="container footnote" > 
            <div class="row">
                <label> Items in your cart:  </label>
                <label id="numCartItems"><c:out value="${sessionScope.itemTotal}"/></label>
            </div>
            <div class="row">
                <button id="SCButton">Proceed to shopping cart</button>
            </div>
        </div>

    </body>
</html>

