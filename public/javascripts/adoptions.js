$(function() {
    $('#collar').live('click', function(event) {
        if (event.target.checked) {
            $(this).parent().parent().find('.collar-amount').first().replaceWith('<div class=\"collar-amount">$19.99</div>');
        } else {
            $(this).parent().parent().find('.collar-amount').first().empty();
        };
    });
    
    $('#toy').live('click', function(event) {
        if (event.target.checked) {
            $(this).parent().parent().find('.toy-amount').first().replaceWith('<div class=\"toy-amount">$8.99</div>');
        } else {
            $(this).parent().parent().find('.toy-amount').first().empty();
        };
    });

    $('#carrier').live('click', function(event) {
        if (event.target.checked) {
            $(this).parent().parent().find('.carrier-amount').first().replaceWith('<div class=\"carrier-amount">$39.99</div>');
        } else {
            $(this).parent().parent().find('.carrier-amount').first().empty();
        };
    });

    $('#vet').live('click', function(event) {
        if (event.target.checked) {
            $(this).parent().parent().find('.vet-amount').first().replaceWith('<div class=\"vet-amount">$69.99</div>');
        } else {
            $(this).parent().parent().find('.vet-amount').first().empty();
        };
    });

});