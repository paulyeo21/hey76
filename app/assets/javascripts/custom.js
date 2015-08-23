$(function(){

  var $container = $('#masonry-container');
 
  $container.imagesLoaded(function(){
    $container.masonry({
      itemSelector : '.box',
      isFitWidth: true
      // isRTL: true
      // gutterWidth: 0
    });
  });
 
});