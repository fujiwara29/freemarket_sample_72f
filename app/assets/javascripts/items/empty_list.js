$(function(){
  var list_length = $('.pickup_list');
  var pickup_lists  = $('.pickup_lists');
  var pickup_lists_search  = $('.pickup_lists_search');
  var html= `<div class="empty_list"></div>`
  for(var i = 0; i < list_length.length; i += 1){}
  while ((i % 5) != 0){
    pickup_lists.append(html);
    pickup_lists_search.append(html);
    i += 1;
  }
});