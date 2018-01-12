$(document).ready(function () {

    var contentForm = $('#content-form');
    var checkoutForm = $('#checkout-form');
    var paymentForm = $('#payment-form');
    var reviewForm = $('#review-form');

    $('#SCButton').click(function (event) {
        event.preventDefault();
        var num = $('#numCartItems').text();
        num2 = parseInt(num);
        if (num2 > 0) {
            window.location = 'ShoppingCart.jsp'
        } else {
            alert("Your cart cannot be empty");
        }
    });

    $(contentForm).submit(function (event) {
        event.preventDefault();
        var row = parseInt($(this).find("input[type=submit]:focus").attr('id'));
        var avail = parseInt($('#s' + row).val());
        var quant = parseInt($('#q' + row).val());
        if (quant <= avail) {
            $.ajax({
                url: 'CartServlet',
                method: 'POST',
                data: contentForm.serialize() + "&rowNum=" + row,
                success: function (data) {
                    $("#numCartItems").html(data);
                }
            });
        } else {
            alert("Quantity cannot exceed availability");
        }
    });

    $(checkoutForm).submit(function (event) {
        event.preventDefault();
        var note = "Please Enter your: ";
        var active = 0;
        var fName = $('#firstName').val();
        var lName = $('#lastName').val();
        var pNumber = $('#phone').val();
        var eMail = $('#email').val();
        var address = $('#addressInput').val();
        var city = $('#city').val();
        var state = $('#state').val();
        var zCode = $('#zip').val();
        
        if(fName == "" || fName == null){
            note += "\n + First Name.";
            active = 1;
        }
        if(lName == "" || lName == null){
            note += "\n + Last Name.";
            active = 1;
        }
        if(pNumber == "" || pNumber == null){
            note += "\n + Phone Number.";
            active = 1;
        }
        if(eMail == "" || eMail == null){
            note += "\n + Email.";
            active = 1;
        }
        if(address == "" || address == null){
            note += "\n + Address";
            active = 1;
        }
        if(city == "" || city == null){
            note += "\n + City.";
            active = 1;
        }
        if(state == "" || state == null){
            note += "\n + State.";
            active = 1;
        }
        if(zCode == "" || zCode == null){
            note += "\n + Zip Code.";
            active = 1;
        }
        
        if(active == 1){
            alert(note);
        }
        
        else{
            $.ajax({
                url: 'CheckoutServlet',
                method: 'POST',
                data: checkoutForm.serialize(),
                success: function (data) {
                    window.location = 'Payment.jsp'
                }
            });
        }
        
        
        
    });

    $(paymentForm).submit(function (event) {
        event.preventDefault();
        var note = "Please Enter your: ";
        var active = 0;
        var cName = $('#cardName').val();
        var cNumber = $('#cardNumber').val();
        var cvc = $('#cvc').val();
        var m = $('#month').val();
        var y = $('#year').val();
        var bAddress = $('#addressInput').val();
        var bCity = $('#billingCity').val();
        var bState = $('#billingState').val();
        var bZCode = $('#billingZip').val();
        
        if(cName == "" || cName == null){
            note += "\n + Card Name.";
            active = 1;
        }
        if(cNumber == "" || cNumber == null){
            note += "\n + Card Number.";
            active = 1;
        }
        if(cvc == "" || cvc == null){
            note += "\n + CVC.";
            active = 1;
        }
        if(m == "" || m == null){
            note += "\n + Month.";
            active = 1;
        }
        if(y == "" || y == null){
            note += "\n + Year.";
            active = 1;
        }
        if(bAddress == "" || bAddress == null){
            note += "\n + Billing Address.";
            active = 1;
        }
        if(bCity == "" || bCity == null){
            note += "\n + Billing City.";
            active = 1;
        }
        if(bState == "" || bState == null){
            note += "\n + Billing State.";
            active = 1;
        }
        if(bZCode == "" || bZCode == null){
            note += "\n + Billing Zip Code.";
            active = 1;
        }
        if(active == 1){
            alert(note);
        }
        
        else{
            $.ajax({
                url: 'PaymentServlet',
                method: 'POST',
                data: paymentForm.serialize(),
                success: function (data) {
                    window.location = 'Confirm.jsp'
                }
            });
        }
        
    });

    $('#placeOrderButton').click(function (event) {
        event.preventDefault();
        $.ajax({
            url: 'DatabaseServlet',
            method: 'POST',
            success: function (data) {
                window.location = 'OrderPlaced.jsp'
            }
        });
    });

    $(reviewForm).submit(function (event) {
        event.preventDefault();
        $.ajax({
            url: 'LeaveReviewServlet',
            method: 'POST',
            data: reviewForm.serialize(),
            success: function (data) {
                window.location = 'Reviews.jsp'
            }
        });
    });


});