$(function(){
  var container = $('#image-container')
  var image_box = new DataTransfer();
  var file_field = document.querySelector('input[type=file]')
  
  $('#upload-image').change(function(){
    $.each(this.files, function(image, file){
      var fileReader = new FileReader();
      image_box.items.add(file)
      file_field.files = image_box.files
      var num = $('.item-img').length + 1 + image
      fileReader.readAsDataURL(file);
      if (num == 10){
        container.css('display', 'none')
      }
      fileReader.onloadend = function() {
        var src = fileReader.result
        var html= `<div class='item-img' data-image="${file.name}">
                    <div class='item-img__content'>
                      <img src=${src}>
                    </div>
                    <div class='item-img__btn'>
                      <div class='item-img__btn--delete'>削除</div>
                    </div>
                  </div>`
                  
        container.before(html);
      };
      container.attr('class', `num-${num}`)
    });
  });


  $(document).on("click", '.item-img__btn--delete', function(){
    var target_image = $(this).parent().parent()
    var target_name = $(target_image).data('image')
    if(file_field.files.length==1){
      $('input[type=file]').val(null)
      image_box.clearData();
      console.log(image_box)
    }else{
      $.each(file_field.files, function(image,input){
        if(input.name==target_name){
          image_box.items.remove(image)
        }
      })
      file_field.files = image_box.files
    }

    target_image.remove()
    var num = $('.item-img').length
    container.show()
    container.attr('class', `num-${num}`)
  })
});