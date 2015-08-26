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
 
	function checkSubmit(e)
	{
	   if(e && e.keyCode == 13)
	   {
	      document.forms[0].submit();
	   }
	}
 
});

