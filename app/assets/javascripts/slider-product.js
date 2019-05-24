$(document).on('turbolinks:load', function(){

  // ドット作成
  $('.owl-carousel.owl-loaded.owl-drag').slick({
    dots:true,
    // ページングテンプレート（ドットリストの部分）をカスタマイズ
    customPaging: function(slick,index) {
      // スライダーのインデックス番号に対応した画像のsrcを取得
      var targetImage = $(slick.$slides[index]).attr('src');
      // slick-dots > li の中に上記で取得した画像を設定
      return '<img src=" ' + targetImage + ' "/>';
    }
  });
  $( '.owl-carousel.owl-loaded.owl-drag' ).on( 'mouseenter', '.slick-dots > li', function() {
    $( this ).click();
  });
  $( '.owl-carousel.owl-loaded.owl-drag' ).on( 'mouseover', '.slick-dots > li', function() {
    $( this ).css({
      opacity: "1",
      cursor: "pointer"
    });
  });
  $( '.owl-carousel.owl-loaded.owl-drag' ).on( 'mouseout', '.slick-dots > li', function() {
    $( this ).css({
      opacity: "",
      cursor: ""
    });
  });
});
