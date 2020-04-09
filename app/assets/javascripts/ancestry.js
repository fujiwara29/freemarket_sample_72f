$(function () {
  $(".parents_list").hide();
  $("li.category").hover(function () {
    $(".parents_list:not(:animated)", this).slideDown("fast")
  },
    function () {
      $(".parents_list", this).slideUp("fast");
    })
})

$(function () {
  $(".children_list").hide();
  $(".parent_category").hover(function () {
    $(".child_category:not(:animated)", this).slideDown("fast")
  },
    function () {
      $(".children_category", this).slideUp("fast");
    })
})
