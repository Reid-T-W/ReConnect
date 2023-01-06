$(document).ready(function () {
  $('.otherimages').click(function () {
    const main = $('#img').attr('src');
    const other = $(this).attr('src');
    $('#img').attr('src', other);
    $(this).attr('src', main);
  });
});
