// Script that helps view different pictures
// on the result page, pictures will be viewed
// when clicked
$(document).ready(function () {
  $('.otherimages').click(function () {
    const main = $('#img').attr('src');
    const other = $(this).attr('src');
    $('#img').attr('src', other);
    $(this).attr('src', main);
  });
});
