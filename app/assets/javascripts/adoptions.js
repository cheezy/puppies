var Adoption = function() {
    jQuery.extend(this);
    $('#collar').live('click', function(event) {
        Adoption.prototype.handleClickEvent(event, '.collar-amount', 19.99);
    });
    
    $('#toy').live('click', function(event) {
        Adoption.prototype.handleClickEvent(event, '.toy-amount', 8.99);
    });

    $('#carrier').live('click', function(event) {
        Adoption.prototype.handleClickEvent(event, '.carrier-amount', 39.99);
    });

    $('#vet').live('click', function(event) {
        Adoption.prototype.handleClickEvent(event, '.vet-amount', 69.99);
    });
}

Adoption.prototype = {
    handleClickEvent: function(event, cls, price) {
        if (event.target.checked) {
            $(event.target).parent().parent().find(cls).first().html('$'+price);
            Adoption.prototype.increaseCartTotal(price);
        } else {
            $(event.target).parent().parent().find(cls).first().empty();
            Adoption.prototype.decreaseCartTotal(price);
        }
    },
    
    increaseCartTotal: function(amount) {
        var priceCell = $('.total_cell').children().first();
        var total = Adoption.prototype.cartTotal(priceCell);
        total = total + amount;
        priceCell.html("$" + Adoption.prototype.roundNumber(total, 2));
    },

    decreaseCartTotal: function(amount) {
        Adoption.prototype.increaseCartTotal(-1*amount);
    },


    cartTotal: function(priceCell) {
        var priceCell = $('.total_cell').children().first();
        var cartTotal = priceCell.html();
        var len = cartTotal.length;
        return parseFloat(cartTotal.substr(1, len));
    },

    roundNumber: function(number, decimalPlaces) {
        return Math.round(number * Math.pow(10, decimalPlaces)) / Math.pow(10, decimalPlaces);
    }
};

var adoption;

$(function() {
    adoption = new Adoption();
});




