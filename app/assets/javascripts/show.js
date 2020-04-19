$(function () {
  $(".image").first().addClass("active");
  $('.item-img-small').click(function () {
    image_url = $(this).attr("src");
    $(".item-img-big").attr("src", image_url).hide().fadeIn();
    $(".image.active").removeClass("active");
    $(this).parent().addClass("active");
  });
});
