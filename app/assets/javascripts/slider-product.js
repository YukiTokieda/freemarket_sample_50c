$(document).on('turbolinks:load', function(){

  // dots:true : ドットの描写
  $('.owl-carousel.owl-loaded.owl-drag').slick({
    dots:true,
    // customPaging : ページングテンプレート（ドットリストの部分）をカスタマイズ
    // (slick,index) : slickのオブジェクト（コード）と、index(数字)が渡されている
    customPaging: function(slick,index) {
      // スライダーのインデックス番号に対応した画像のsrcを取得
      var targetImage = $(slick.$slides[index]).find('img').attr('src');
      console.log(targetImage)
      // slick-dots > li の中に上記で取得した画像を設定
      return '<img src=" ' + targetImage + ' "/>';
    }
  });

  //マウスポインターが要素に乗ったらクリックする動きでホバーの動きを作成
  $( '.owl-carousel.owl-loaded.owl-drag' ).on( 'mouseenter', '.slick-dots > li', function() {
    $( this ).click();
  });
  //CSSの変化をつける
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
