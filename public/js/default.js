$(document).ready(function(){
    /**
     * Show list cycle
     * @author tien.nguyen
     */
    $('.cycileBilling').click(function(){
        var monthlyPersonal = 19;
        var monthlyBusiness = 29;
        var monthlyGBusiness = 39;

        var typeOfCycle = $(this).val();

        /** SWITH TO SHOW PRICE **/
        switch (typeOfCycle){
            case 'MONTHLY': {
                showPriceInPricePage(monthlyPersonal, monthlyBusiness, monthlyGBusiness, 'mo');
                break;
            }
            case 'SIX_MONTHLY': {
                var discountPersonal = monthlyPersonal/2;
                var discountBusiness = monthlyBusiness/2;
                var discountGBusiness = monthlyGBusiness/2;
                showPriceInPricePage(monthlyPersonal*6 - discountPersonal,
                    monthlyBusiness*6 - discountBusiness, monthlyGBusiness*6 - discountGBusiness, "6mos");
                break;
            }
            case 'YEARLY': {
                var discountPersonal = monthlyPersonal;
                var discountBusiness = monthlyBusiness;
                var discountGBusiness = monthlyGBusiness;
                showPriceInPricePage(monthlyPersonal*12 - discountPersonal,
                    monthlyBusiness*12 - discountBusiness, monthlyGBusiness*12 - discountGBusiness, "y");
                break;
            }
            case 'TWO_YEARLY': {
                var discountPersonal = monthlyPersonal*2;
                var discountBusiness = monthlyBusiness*2;
                var discountGBusiness = monthlyGBusiness*2;
                showPriceInPricePage(monthlyPersonal*24 - discountPersonal,
                    monthlyBusiness*24 - discountBusiness, monthlyGBusiness*24 - discountGBusiness, "2ys");
                break;
            }
        }
    })

    /**
     * Click button order now
     * @author tien.nguyen
     */
    $('.btnOrderNow').click(function(){
        var url = $(this).attr('href');
        var cycelBilling = document.forms['frmCycle'].elements['cycleBilling'].value;
        window.location.href = url + '/cycle-billing/' + cycelBilling;
        return false;
    });
});

/**
 * Function show price in price page
 * @author tien.nguyen
 */
function showPriceInPricePage(personal, business, gBusiness, label){
    $('.pricePersonal').html('$'+ personal + '/' + label );
    $('.priceBusiness').html('$'+ business + '/' + label);
    $('.priceGBusiness').html('$'+ gBusiness + '/' + label);
}