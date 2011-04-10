$(function() {
    $('#collar').live('click', function(event) {
        handleClickEvent(event, '.collar-amount', 19.99);
    });
    
    $('#toy').live('click', function(event) {
        handleClickEvent(event, '.toy-amount', 8.99);
    });

    $('#carrier').live('click', function(event) {
        handleClickEvent(event, '.carrier-amount', 39.99);
    });

    $('#vet').live('click', function(event) {
        handleClickEvent(event, '.vet-amount', 69.99);
    });

});

var handleClickEvent = function(event, cls, price) {
    if (event.target.checked) {
        $(event.target).parent().parent().find(cls).first().html('$'+price);
        increaseCartTotal(price);
    } else {
        $(event.target).parent().parent().find(cls).first().empty();
        decreaseCartTotal(price);
    };
};

var increaseCartTotal = function(amount) {
    var priceCell = $('.total_cell').children().first();
    var total = cartTotal(priceCell);
    total = total + amount;
    priceCell.html("$" + roundNumber(total, 2));
};

var decreaseCartTotal = function(amount) {
    increaseCartTotal(-1*amount);
};

var cartTotal = function(priceCell) {
    var priceCell = $('.total_cell').children().first();
    var cartTotal = priceCell.html();
    var len = cartTotal.length;
    return parseFloat(cartTotal.substr(1, len));
};

var roundNumber = function(number, decimalPlaces) {
    return Math.round(number * Math.pow(10, decimalPlaces)) / Math.pow(10, decimalPlaces);
};