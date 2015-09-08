
var substringMatcher = function(strs) {
  return function findMatches(q, cb) {
    var matches, substringRegex;

    // an array that will be populated with substring matches
    matches = [];

    // regex used to determine if a string contains the substring `q`
    substrRegex = new RegExp(q, 'i');

    // iterate through the pool of strings and for any string that
    // contains the substring `q`, add it to the `matches` array
    $.each(strs, function(i, str) {
      if (substrRegex.test(str)) {
        matches.push(str);
      }
    });

    cb(matches);
  };
}

$(function() {

  var base_url = window.location.origin;
  var draft_candidates;

  // Asynchronous makes variable assignment last 
  // $.getJSON(base_url + "/suggestions.json", function(data) {
  //   draft_candidates = data.suggestions;
  //   console.log(draft_candidates);
  // });

  // deprecate synchronous ajax call BUT works
  $.ajax({
    url: base_url + "/draftees.json",
    async: false,
    dataType: "json"
  })
  .done(function(data) {
    draft_candidates = data;
  });


  $('#search form input#name').typeahead({
    hint: true,
    highlight: true,
    minLenght: 1
  },{
    name: 'draft_candidates',
    source: substringMatcher(draft_candidates)
  })
  .on('typeahead:selected', function(e){
    e.target.form.submit();
  });

});


var $container = $('#masonry-container');

//https://github.com/desandro/masonry/issues/35
// $container.imagesLoaded(function(){
$(window).load(function(){
  $container.masonry({
    itemSelector : '.box',
    columnWidth: 325,
    isFitWidth: true
  });
});

