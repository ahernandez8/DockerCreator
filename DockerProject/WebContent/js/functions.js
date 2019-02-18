$(function () {
  $('[data-toggle="popover"]').popover({
	  placement:"right",
	  trigger:'hover' 
  })
});

$(function () {
    $("#selectList").on("change", onChange);
    $("#selectList").on("focus", function()
    	     {
        $(this).popover('destroy')
   			 });
});

function onChange() {
    var $this = $(this);
    var $e = $(this.target);
    $('#selectList').popover('destroy');
    $("#selectList").popover({
        trigger: 'hover',
        placement: 'right',
        content: $("#selectList option:selected").attr('data-info')
    }).popover('show');
    $this.blur();
}