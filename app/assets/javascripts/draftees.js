var draftees = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace("name"),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  prefetch: {
    url: "../v1/draftees.json",
    cache: false
  }
})

$("#search-draftee").typeahead({
  highlight: true,
  minLength: 1
},{
  name: "draftees",
  display: "name",
  source: draftees,
})
.on("typeahead:selected", function(env, suggestion){
  window.location.href = "/draftees/" + suggestion.id;
});

twttr.ready(function(twttr) {
  var tweets = document.getElementsByClassName("tweet");
  for (var i = 0; i < tweets.length; i++) {
    twttr.widgets.createTweet(
      tweets[i].id,
      tweets[i],
      {
        conversation: "none",
        width: "auto"
      }
    );
  }
});
