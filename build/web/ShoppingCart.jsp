<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Your Cart</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="resource/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
        <link href="resource/bootstrap/css/font-awesome.min.css" rel="stylesheet">
        <script src="resource/bootstrap/js/jquery-3.2.1.js"></script>
        <script src="resource/bootstrap/js/bootstrap.min.js"></script>

        <link href="resource/css/main.css" rel="stylesheet">
    </head>
    <body>

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

        <div class="container content">
            <h3>Shopping Cart: </h3>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
                <c:forEach var="item" items="${sessionScope.itemList}">
                    <c:if test="${item.quantity > 0}">
                        <tr>
                            <td>
                                <c:out value="${item.ID}"/>
                            </td>
                            <td>
                                $ <c:out value="${item.price}"/>0
                            </td>
                            <td>
                                <c:out value="${item.quantity}"/>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </div>

        <div class="container footnote" > 
            <div class="row">
                <label> Total: </label>
                <label id="totalLabel">$  <c:out value="${sessionScope.total}"/>0</label>
            </div>
            <div class="row">
                <button id="CheckoutButton" onclick="location.href = 'Checkout.jsp';">Checkout</button>
            </div>
        </div>

    </body>
</html>
