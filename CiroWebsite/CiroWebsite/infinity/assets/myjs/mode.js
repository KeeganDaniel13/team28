$(function () {

    $('tbody > tr').on('click', function (event) {
        event.preventDefault();
        $('#myModal').modal('show');
    })

    $('.btn-mais-info').on('click', function (event) {
        $('.open_info').toggleClass("hide");
    })


});