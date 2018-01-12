<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Checkout</title>
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
            <form id="checkout-form">
                <div class="container contactInfo">
                    <div class="header">
                        <h3>Contact Info</h3>
                    </div>
                    <div class="row">
                        <div class="col-md-2"> </div>
                        <div class="col-md-2"> </div>
                        <div class="col-md-2">
                            <label>First Name </label>
                        </div>
                        <div class="col-md-2">
                            <label>Last Name </label>
                        </div>
                        <div class="col-md-2"> </div>
                        <div class="col-md-2"> </div>
                    </div>
                    <div class="row input-row">
                        <div class="col-md-2"> </div>
                        <div class="col-md-2"> </div>
                        <div class="col-md-2">
                            <input type="text" id="firstName" name="firstName"/>
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="lastName" name="lastName"/>
                        </div>
                        <div class="col-md-2"> </div>
                        <div class="col-md-2"> </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                        </div>
                        <div class="col-md-2">
                            <label>Phone Number</label>
                        </div>
                    </div>
                    <div class="row input-row">
                        <div class="col-md-5">
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="phone" name="phone" maxlength="10" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                        </div>
                        <div class="col-md-2">
                            <label>Email</label>
                        </div>
                    </div>
                    <div class="row input-row">
                        <div class="col-md-5">
                        </div>
                        <div class="col-md-2">
                            <input type="email" id="email" name="email"/>
                        </div>
                    </div>
                </div>

                <div class="container shippingInfo">
                    <div class="header">
                        <h3>Shipping Info</h3>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                        </div>
                        <div class="col-md-2">
                            <label>Address</label>
                        </div>
                    </div>
                    <div class="row input-row">
                        <div class="col-md-4">
                        </div>
                        <div class="col-md-2">
                            <input id="addressInput" type="text" name="address"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-2">
                            <label>City</label>
                        </div>
                        <div class="col-md-2">
                            <label>State</label>
                        </div>
                        <div class="col-md-2">
                            <label>Zip Code</label>
                        </div>
                        <div class="col-md-3"></div>
                    </div>
                    <div class="row input-row">
                        <div class="col-md-3"></div>
                        <div class="col-md-2">
                            <input type="text" id="city" name="city"/>
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="state" name="state" maxlength="2"/>
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="zip" name="zip" maxlength="5" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
                        </div>
                        <div class="col-md-3"></div>
                    </div>
                </div>

                <div class="container">
                    <div class="row">

                        <select class="select" name="shipType">
                            <option value="priority">Priority Mail - $6</option>
                            <option value="express">Priority Mail Express - $12</option>
                        </select>

                    </div>
                </div>

                <div class="container footnote" > 
                    <div class="row">
                        <input class="submitButton" id="checkoutSubmit" type="submit" value="PROCEED TO PAYMENT" />
                    </div>
                </div>

            </form>
        </div>


    </body>
</html>
