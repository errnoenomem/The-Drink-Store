<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE HTML>
<!DOCTYPE html>
<html>
    <head>
        <title>Reviews</title>
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

        <sql:query var="listReview"   dataSource="${myDS}">
            SELECT * FROM Review;
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

        <div class="container content">

            <h3> Reviews </h3>

            <c:forEach var="review" items="${listReview.rows}">

                <div class="row review">

                    <div class="col-md-4">

                        <label>

                            <c:out value="${review.Nickname}" /> - <c:out value="${review.ArticleID}" />

                        </label>

                    </div>

                    <div class="col-md-4">
                        Rating: <c:out value="${review.Rating}" /> /5
                    </div>

                    <div class="col-md-4">

                        <p>
                            <c:out value="${review.Review}" />
                        </p>

                    </div>

                </div>

            </c:forEach>

        </div>

        <sql:query var="listItems"   dataSource="${myDS}">
            SELECT * FROM Item;
        </sql:query>

        <div class="container leaveReview">

            <form id="review-form">
                <div class="row reviewRow">
                    <label>Order Number: </label>
                    <input name="reviewON" type="text"  >
                </div>
                <div class="row reviewRow">
                    <label>Nickname: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                    <input name="nickname" type="text"  >
                </div>
                <div class="row reviewRow">
                    <label>Item ID: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                    <select name="reviewItem">
                        <c:forEach var="item" items="${listItems.rows}">
                            <option value="<c:out value="${item.ArticleID}" />"><c:out value="${item.ArticleID}" /></option>
                        </c:forEach>
                    </select>
                </div>  
                <div class="row reviewRow">
                    <label>Rating (1-5): &nbsp;&nbsp;&nbsp;</label>
                    <input name="rating" type="number" value="1" min="1" max="5">
                </div>
                <div class="row reviewRow">
                    <label>Your review: &nbsp;&nbsp;&nbsp;</label>
                    <input name="review" id="reviewText" type="text">
                </div>
                <div class="row reviewRow">
                    <input class="submitButton" type="submit">
                </div>
            </form>

        </div>

    </body>
</html>
