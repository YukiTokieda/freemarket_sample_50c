$(document).on('turbolinks:load', function(){
  var sellzone = $('.sellzone-area');
  var sellzone2 = $('.sellzone-area2');
  var selluploaditem = $('.sell-upload-item');
  var sellboxcontainer = $('.sell-box_container');
  var images = [];
  var inputs  =[];
  var input_area = $('.input_area');
  var preview = $('#preview');
  var preview2 = $('#preview2');

  $(document).on('change', 'input[type= "file"].upload-image',function(event) {
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    inputs.push($(this));
    var img = $(`<div class= "sell-upload-item"><img></div>`);
    reader.onload = function(e) {
      var btn_wrapper = $('<div class="sell-upload-button"><div class="btn edit">編集</div><div class="btn delete">削除</div></div>');
      img.append(btn_wrapper);
      img.find('img').attr({
        src: e.target.result
      })
    }
    reader.readAsDataURL(file);
    images.push(img);

    if(images.length >= 5) {
      sellzone2.css({
        'display': 'block'
      })
      sellzone.css({
        'display': 'none' 
      })
      sellboxcontainer.css({
        'height': '334px'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview2.append(image);
        sellzone2.css({
          'width': `calc(100% - (124px * ${images.length - 5}))`
        })
      })
      if(images.length == 9) {
        sellzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
    } else {
        $('#preview').empty();
        $.each(images, function(index, image) {
          image.attr('data-image', index);
          preview.append(image);
        })
        sellzone.css({
          'width': `calc(100% - (124px * ${images.length}))`
        })
      }
      if(images.length == 4) {
        sellzone.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
    if(images.length == 10) {
      sellzone2.css({
        'display': 'none'
      })
      return;
    }
    var new_image = $(`<input multiple= "multiple" name="images[image_form][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`);
    input_area.prepend(new_image);
  });
  $(document).on('click', '.delete', function() {
    var target_image = $(this).parent().parent();
    $.each(inputs, function(index, input){
      if ($(this).data('image') == target_image.data('image')){
        $(this).remove();
        target_image.remove();
        var num = $(this).data('image');
        images.splice(num, 1);
        inputs.splice(num, 1);
        if(inputs.length == 0) {
          $('input[type= "file"].upload-image').attr({
            'data-image': 0
          })
        }
      }
    })
    $('input[type= "file"].upload-image:first').attr({
      'data-image': inputs.length
    })
    $.each(inputs, function(index, input) {
      var input = $(this)
      input.attr({
        'data-image': index
      })
      $('input[type= "file"].upload-image:first').after(input)
    })
    if (images.length >= 5) {
      sellzone2.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview2.append(image);
      })
      sellzone2.css({
        'width': `calc(100% - (124px * ${images.length - 5}))`
      })
      if(images.length == 9) {
        sellzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
      if(images.length == 8) {
        sellzone2.find('i').replaceWith('<p>ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード</p>')
      }
    } else {
      sellzone.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview.append(image);
      })
      sellzone.css({
        'width': `calc(100% - (124px * ${images.length}))`
      })
    }
    if(images.length == 4) {
      sellzone2.css({
        'display': 'none'
      })
    }
    if(images.length == 3) {
      sellzone.find('i').replaceWith('<p>ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード</p>')
    }
  })
});