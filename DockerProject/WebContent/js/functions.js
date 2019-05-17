$(function () {
  $('[data-toggle="popover"]').popover({
	   html:true,
  })
});



/*

var $popoversettings = $('.settings').popover({
    html: true,
    placement: 'right',
    content: function () {
        var mySettings = $(this).data('mysettings');
        return $(mySettings).html();
    }
});


$(':not(#anything)').on('click', function (e) {
    $popoversettings.each(function () {
        if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
            $(this).popover('hide');
            return;
        }
    });
});


$(document).on('change','#list', function () {
    $('#result').text($('#list option:selected').val());
});
*/



