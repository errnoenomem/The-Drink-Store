<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Payment</title>
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
            <form id="payment-form" > 
                <div class="container paymentInfo">
                    <div class="header">
                        <h3>Payment Info</h3>
                    </div>
                    <div class="row paymentRow">
                        <div class="col-md-3"></div>
                        <div class="col-md-3">
                            <label>Name on Card</label>
                        </div>
                        <div class="col-md-3">
                            <input type="text" id ="cardName" name="cardName"/>
                        </div>
                        <div class="col-md-3"></div>
                    </div>

                    <div class="row paymentRow">
                        <div class="col-md-3"></div>
                        <div class="col-md-3">
                            <label>Card Number</label>
                        </div>
                        <div class="col-md-3">
                            <input type="text" id="cardNumber" name="cardNumber" maxlength="16" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
                        </div>
                        <div class="col-md-3"></div>
                    </div>

                    <div class="row paymentRow">
                        <div class="col-md-3"></div>
                        <div class="col-md-3">
                            <label>CV Code</label>
                        </div>
                        <div class="col-md-3">
                            <input type="text" id="cvc" name="cvc" maxlength="3" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
                        </div>
                        <div class="col-md-3"></div>
                    </div>
                    <div class="row paymentRow">
                        <div class="col-md-3"></div>
                        <div class="col-md-3">
                            <label>Expiration Date</label>
                        </div>
                        <div class="col-md-3">
                            <span class="expiration">
                                <input type="text" id="month" name="month" placeholder="MM" maxlength="2" size="2" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
                                <span>/</span>
                                <input type="text" id="year" name="year" placeholder="YY" maxlength="2" size="2" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
                            </span>
                        </div>
                        <div class="col-md-3"></div>
                    </div>

                </div>

                <div class="container billingInfo">
                    <div class="header">
                        <h3>Billing Address </h3>
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
                            <input id="addressInput" type="text" name="billingAddress"/>
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
                            <input type="text" id="billingCity" name="billingCity"/>
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="billingState" maxlength="2" name="billingState"/>
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="billingZip" name="billingZip" maxlength="5" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
                        </div>
                        <div class="col-md-3"></div>
                    </div>
                </div>

                <div class="container footnote" > 
                    <div class="row">
                        <input class="submitButton" id="paymentSubmit" type="submit" value="CONTINUE" />
                    </div>
                </div>

            </form>
        </div>

    </body>
</html>
