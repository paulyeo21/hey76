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
