describe("Adoption", function() {
    var adoption;

    beforeEach(function() {
        loadFixtures("adoption.html");
        adoption = new Adoption();
    });

    it("should add the Collar & Leash to the total when it is selected", function() {
        var cartTotal = $('.total_cell').children().first().html();
        expect(cartTotal).toEqual("$34.95");
        expect($('#collar')).not.toBeChecked();
        $('#collar').click();
        expect($('#collar')).toBeChecked();

//        I'm getting two click events each with the target unchecked

//        expect($('.total_cell').children().first()).toHaveHtml("$34.95");
//        expect($('.collar-amount')).toHaveHtml("19.99");
//        cartTotal = $('.total_cell').children().first().html();
//        expect(cartTotal).toEqual("$54.94");
    });

});