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
        $.ajax({
            url: 'CheckoutServlet',
            method: 'POST',
            data: checkoutForm.serialize(),
            success: function (data) {
                window.location = 'Payment.jsp'
            }
        });
    });

    $(paymentForm).submit(function (event) {
        event.preventDefault();
        $.ajax({
            url: 'PaymentServlet',
            method: 'POST',
            data: paymentForm.serialize(),
            success: function (data) {
                window.location = 'Confirm.jsp'
            }
        });
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