$(document).on('turbolinks:load', function(){
  $('.owl-carousel.owl-loaded.owl-drag').slick({
    arrows: false,
    dots:true,
    dotsClass: 'slide-dots',
    customPaging: function(slick,index) {
      var targetImage = $(slick.$slides[index]).find('img').attr('src');
      return '<img src=" ' + targetImage + ' ", class = "owl-dots" "/>';
    }
  });

  $( '.owl-carousel.owl-loaded.owl-drag' ).on( 'mouseenter', '.slide-dots > li', function() {
    $( this ).click();
  });
  $( '.owl-carousel.owl-loaded.owl-drag' ).on( 'mouseover', '.slide-dots > li', function() {
    $( this ).css({
      opacity: "1",
      cursor: "pointer"
    });
  });

  $(".owl-dots").hover(
    function () {
      $(this).css('opacity', '1.0');
  },
    function () {
      $(this).css('opacity', '0.5');
  });
});
