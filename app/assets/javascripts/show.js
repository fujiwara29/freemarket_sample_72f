$(function () {
  $('.item-img-small').hover(function () {
    $('.item-img-big').attr('src', $(this).attr('src'));
  });
});
