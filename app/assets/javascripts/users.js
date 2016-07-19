
$(document).ready(function () {
  $('ul.tabs > li > a' ).on('click', function(event) {
    var target = $(event.target);
    $('li.active').removeClass('active');
    target.parent().addClass('active');

  });
});