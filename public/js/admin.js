$(document).ready(function () {
    $('.icon-remove').click(function () {
        var href = $(this).attr('href');
        $("#dialog-alert").modal('show');
        $('#messageDeleteOk').click(function(){
            window.location.href = href;
        })
    });
})
